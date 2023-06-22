<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data Bayar Gaji
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>bayargaji">Bayar Gaji</a></li>
        <li class="active">Bayar Gaji List</li>
    </ol>
</section>
<?php
$ids = $_SESSION['id_user'];
$datas = $db->fetch_custom_single(
    "select u.id,l.level from  sys_users as u, sys_group_users as l   where u.id_group=l.id and u.id = $ids"
);
$level = $datas->level;
?>
<!-- Main content -->
<section class="content">
    <?php if ($level == 'administrator') { ?>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <!--<a href="<?= base_index() ?>bayargaji/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Iput gaji
                    </a>-->

                    <form action="" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">PERIODE PENGGAJIAN
                                </button>
                            </span>
                            <input type="text" name="mulai" class="form-control date" value="<?= $_GET[
                                'mulai'
                            ] ?>" placeholder="yyyy-mm-dd" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"> s/d </button>
                            </span>
                            <input type="text" name="dari" class="form-control date" value="<?= $_GET[
                                'dari'
                            ] ?>" placeholder="yyyy-mm-dd" />

                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-success btn-flat">Submit</button>
                            </span>
                            <span class="input-group-btn">
                                <a href="<?= base_index() ?>bayargaji" class="btn btn-info">Reset</a>
                            </span>
                        </div>
                        <small>Pilih periode tanggal gaji dahulu jika ingin menghitung gaji<?= $path_id ?></small>
                    </form>
                    <hr />
                    <form action="" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Pencarian !</button>
                            </span>
                            <input type="text" name="q" class="form-control" placeholder="Search..." />
                            <span class="input-group-btn" value="$_GET['q']">
                                <button type="submit" id="search-btn" class="btn btn-flat"><i
                                        class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                </div><!-- /.box-header -->

                <div class="box-body table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Nama Pegawai</th>
                                <th>Masuk</th>
                                <th>Telat Masuk</th>
                                <th>Tidak Masuk</th>
                                <th>Tunj jabatan</th>
                                <th>OverTime</th>
                                <th>Uang Makan</th>
                                <th>Uang Transport </th>
                                <th>Lembur</th>
                                <th>Insentif</th>
                                <th>Gaji Kotor</th>
                                <th>JHT</th>
                                <th>Potongan</th>
                                <th>Gaji bersih</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (isset($_GET['q'])) {
                                $search_condition = $db->getRawWhereFilterForColumns(
                                    $_GET['q'],
                                    ['first_name', 'last_name']
                                );
                                $search = "AND $search_condition";
                            }

                            if (isset($_GET['mulai']) && isset($_GET['dari'])) {
                                $mulaii = $_GET['mulai'];
                                $darii = $_GET['dari'];
                                $search1 = "AND tanggal BETWEEN '$mulaii' and '$darii'";
                                $search2 = "and p.tgl BETWEEN '$mulaii' and '$dari'";
                            } else {
                                $date1 = date(
                                    'Y-m-d',
                                    strtotime(date('28-m-Y') . '- 1 month')
                                );

                                $date2 = date('Y-m-27');
                                $mulaii = $date1;
                                $darii = date('Y-m-d');
                                $search1 = "AND tanggal BETWEEN '$date1' and '$date2'";
                                $search2 = "and p.tgl BETWEEN '$date1' and '$date2'";
                            }

                            $dtb = $pg->myquery(
                                "select *,a.id as idpp from sys_users as a, t_gaji as b
                                where a.id=b.id_pegawai 
                                $search",
                                $limit
                            );
                            $no = $pg->Num($limit);
                            $count = $pg->Num($limit);
                            if ($dtb->rowCount() < 1) {
                                echo "<tr><td colspan='4'>No matching records found</td></tr>";
                            }
                            foreach ($dtb as $isi) {

                                $idpp = $isi->idpp;

                                $date = date(
                                    'Y-m-d',
                                    strtotime(date('29-m-Y') . '- 1 month')
                                );

                                $abs = $db->query(
                                    "Select * from t_presensi where id_pegawai='$idpp' and status='M'  $search1 "
                                );
                                $bts_waktu = $db->fetch_custom_single(
                                    "Select masuk_akhir from t_absen where status ='Y' "
                                );
                                $bats = $bts_waktu->masuk_akhir;
                                $telat = $db->query(
                                    "Select * from t_presensi where id_pegawai='$idpp' and status='M' $search1  and waktu >'$bats' "
                                );
                                $tgln = $db->fetch_custom_single(
                                    "Select * from t_presensi where id_pegawai='$idpp' and status='M' $search1"
                                );
                                $utang = $db->fetch_custom_single(
                                    "Select sum(jumlah) as jumlah from  t_pengeluaran where nama_peminjam='$idpp' and pengajuan='K'   and status_aju='Y'  and sts_bayar='0' and sts_hapus='N'"
                                );
                                $lembur = $db->fetch_custom_single(
                                    "Select count(nama_peminjam) as jumlah from  t_pengeluaran where nama_peminjam='$idpp' and pengajuan='L' and status_aju='Y'  $search1"
                                );
                                $gji = $db->fetch_custom_single(
                                    "Select * from  t_gaji where id_pegawai='$idpp' "
                                );
                                $over = $db->fetch_custom_single(
                                    "Select sum(overtime) as ovrtm from  t_presensi where id_pegawai='$idpp' and sts_ajukan='O' $search1   "
                                );

                                $teknisi1 = $db->fetch_custom_single(
                                    "SELECT count(p.tek1) as jmlh  FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' 
                                    AND sts_hapus='N' $search2 AND '$dari'  and p.tek1='$idpp';"

                                    // "Select count(id) as jmlh from  t_transaksi where tek1='$idpp' and tgl BETWEEN '$date' AND '$date2' "
                                );
                                $teknisi2 = $db->fetch_custom_single(
                                    "SELECT count(p.tek2) as jmlh  FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' 
                                    AND sts_hapus='N' $search2 AND '$dari'  and p.tek2='$idpp'"
                                    // "Select count(id) as jmlh from  t_transaksi where tek2='$idpp' and tgl BETWEEN '$date' AND '$date2' "
                                );
                                $teknisi3 = $db->fetch_custom_single(
                                    "SELECT count(p.tek3) as jmlh  FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' 
                                    AND sts_hapus='N' $search2  and p.tek3='$idpp'"
                                    // "Select count(id) as jmlh from  t_transaksi where tek3='$idpp' and tgl BETWEEN '$date' AND '$date2' "
                                );
                                $teknisi4 = $db->fetch_custom_single(
                                    "SELECT count(p.tek4) as jmlh  FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' 
                                    AND sts_hapus='N' $search2 and p.tek4='$idpp' "
                                );
                                $ins =
                                    $teknisi1->jmlh +
                                    $teknisi2->jmlh +
                                    $teknisi3->jmlh +
                                    $teknisi4->jmlh;
                                $tahun = date('Y');
                                $bulan = date('m');
                                $jumHari = cal_days_in_month(
                                    CAL_GREGORIAN,
                                    $bulan,
                                    $tahun
                                );

                                //  $Aawal_cuti = date('28-m-Y') . ' - ';
                                //   $Aakhir_cuti = date('d-m-Y');
                                //   $Aawal_cuti = date(
                                //         'Y-m-d',
                                //         strtotime(date('28-m-Y') . '- 1 month')
                                //      );
                                $awal_cuti = date('d-m-Y', strtotime($mulaii));
                                $akhir_cuti = date('d-m-Y', strtotime($darii));
                                // tanggalnya diubah formatnya ke Y-m-d
                                $awal_cuti = date_create_from_format(
                                    'd-m-Y',
                                    $awal_cuti
                                );
                                $awal_cuti = date_format($awal_cuti, 'Y-m-d');
                                $awal_cuti = strtotime($awal_cuti);

                                $akhir_cuti = date_create_from_format(
                                    'd-m-Y',
                                    $akhir_cuti
                                );
                                $akhir_cuti = date_format($akhir_cuti, 'Y-m-d');
                                $akhir_cuti = strtotime($akhir_cuti);

                                $haricuti = [];
                                $sabtuminggu = [];

                                for (
                                    $i = $awal_cuti;
                                    $i <= $akhir_cuti;
                                    $i += 60 * 60 * 24
                                ) {
                                    if (
                                        date('w', $i) !== '0'
                                        //date('w', $i) !== '6'
                                    ) {
                                        $haricuti[] = $i;
                                    } else {
                                        $sabtuminggu[] = $i;
                                    }
                                }
                                $jumlah_cuti = count($haricuti);
                                $jumlah_sabtuminggu = count($sabtuminggu);
                                $abtotal = $jumlah_cuti;

                                $absen = $abs->rowCount();
                                $tlt = $telat->rowCount();
                                $tdk_hadir = $jumHari - $absen;
                                $gaji_k = $isi->gaji * $absen;
                                $uang_m = $isi->uang_makan * $absen;
                                $uang_t = $isi->uang_transport * $absen;
                                $gaji_kotor = $gaji_k + $uang_m + $uang_t;

                                $kasbon = @$utang->jumlah;
                                $gaji_bersih = $gaji_kotor - $kasbon;
                                $datew = date_create(@$tgln->tanggal);
                                $tahuna = date_format($datew, 'Y');
                                $bulanan = date_format($datew, 'm');
                                if ($over->ovrtm == 0) {
                                    $ff = '0 <small>Jams </small>';
                                    $jmo = $over->ovrtm * $utang->jumlah;
                                } else {
                                    $ff = $over->ovrtm . ' <small>Jam </small>';
                                    $jmo = $over->ovrtm * $isi->overtime;
                                }

                                $hasilgaji = $absen * $gji->gaji;

                                $tgl1 = new DateTime($mulaii);
                                $tgl2 = new DateTime($darii);
                                $d = $tgl2->diff($tgl1)->days + 1;

                                //     echo $d . ' hari';
                                $s = $_GET['dari'];
                                $m = $_GET['mulai'];
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?> </td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?>
                                    <hr />
                                    <small>Gaji Pokok : Rp. <?= number_format(
                                        @$gji->gaji * 26,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></small>
                                    <hr>
                                </td>
                                <td><?= $absen ?> <small>hari x </small>
                                    <?= number_format(
                                        @$gji->gaji,
                                        2,
                                        ',',
                                        '.'
                                    ) ?>
                                    <hr> <b> Rp.<?= number_format(
                                        @$hasilgaji,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></b>
                                </td>
                                <td align="center"><br /><br /><br /><?= $tlt ?> </td>
                                <td align="center"><br /><br /><br /><?= $abtotal -
                                    $absen ?><br><small> <?= $d ?> hari</small></td>
                                <td> <br /><br /><br /><b> Rp.<?= number_format(
                                    $isi->tun_jabatan,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b>
                                </td>
                                <td><?php if ($ff <= 0) {
                                    echo '0 <small>Jam </small>';
                                } else {
                                    echo $ff .
                                        ' * ' .
                                        number_format(
                                            $isi->overtime,
                                            2,
                                            ',',
                                            '.'
                                        );
                                } ?>
                                    <hr>
                                    <b> Rp. <?= number_format(
                                        $jmo,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></b>
                                </td>

                                <td><?= $absen ?> <small>hari x </small>
                                    <?= number_format(
                                        $isi->uang_makan,
                                        2,
                                        ',',
                                        '.'
                                    ) ?>
                                    <hr> <b> Rp.<?= number_format(
                                        $mam = $isi->uang_makan * $absen,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></b>
                                </td>
                                <td><?= $absen ?> <small>hari x </small>
                                    <?= number_format(
                                        $isi->uang_transport,
                                        2,
                                        ',',
                                        '.'
                                    ) ?>
                                    <hr> <b> Rp.<?= $gt = number_format(
                                        $trans = $isi->uang_transport * $absen,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></b>
                                </td>
                                <td><?= $lembur->jumlah ?> <small>hari x </small>
                                    <?= number_format(
                                        $isi->lembur,
                                        2,
                                        ',',
                                        '.'
                                    ) ?>
                                    <hr> <b> Rp.<?= $gl = number_format(
                                        $lem = $isi->lembur * $lembur->jumlah,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></b>
                                </td>
                                <td>
                                    <?= $ins ?> <small> x </small>
                                    <?= number_format(
                                        @$isi->insentif,
                                        2,
                                        ',',
                                        '.'
                                    ) ?>
                                    <hr>
                                    <b> Rp.
                                        <?= number_format(
                                            $inss = $isi->insentif * $ins,
                                            2,
                                            ',',
                                            '.'
                                        ) ?>
                                    </b>
                                </td>
                                <?php
                                $lmb = $isi->lembur * $lembur->jumlah;
                                $absn = $isi->uang_transport * $absen;
                                $gm = $isi->uang_makan * $absen;
                                $tun_jabatans = $isi->tun_jabatan;
                                $gajikotor =
                                    $hasilgaji +
                                    $isi->tun_jabatan +
                                    $jmo +
                                    $isi->uang_makan * $absen +
                                    $trans +
                                    $lem +
                                    $inss;
                                $gajb = $gajikotor;
                                ?>
                                <td><br /><br /><br /><b>Rp. <?= number_format(
                                    $gajikotor,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b>
                                </td>
                                <td><small> 2.50 % x </small> <?= number_format(
                                    $gajb,
                                    2,
                                    ',',
                                    '.'
                                ) ?><b>
                                        <hr>
                                        Rp. <?= number_format(
                                            $is = $gajb * 0.025,
                                            2,
                                            ',',
                                            '.'
                                        ) ?>
                                    </b></td>

                                <td><br /><br /><br />Rp. <?= number_format(
                                    @$kasbon,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td align="left"><br /><br /><br /><b>Rp. <?= number_format(
                                    $gajb - $is,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b></td>
                                <td align="center"><br /><br /><br />

                                    <a href="" class="btn badge btn-sm btn-flat btn-info" data-toggle="modal"
                                        data-target="#modal-tambah<?= $isi->id ?>" data-id="<?= $isi->id ?>"> <i
                                            class="fa fa-edit"></i> Hitung Gaji</a>
                                    <div class="modal fade" id="modal-tambah<?= $isi->id ?>" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <form id="input" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/bayargaji/bayargaji_action.php?act=ip">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">BAYAR GAJI </h4>
                                                        <div class="modal-body">
                                                            <div class="box-body">
                                                                <h3>Cek Nominal Gaji </h3>
                                                                <label for="Level User" class="control-label">TANGGAL
                                                                </label><br />
                                                                <input type="text" align="center"
                                                                    class="form-control  date" required name="tanggal"
                                                                    value="<?= date(
                                                                        'Y-m-d'
                                                                    ) ?>">
                                                                <br />
                                                                <input type="hidden" align="center"
                                                                    class="form-control pull-right" required
                                                                    name="mulai" value="<?= $_GET[
                                                                        'mulai'
                                                                    ] ?>">
                                                                <input type="hidden" align="center"
                                                                    class="form-control pull-right" required name="dari"
                                                                    value="<?= $_REQUEST[
                                                                        'dari'
                                                                    ] ?>">
                                                                <label for="Level User" class="control-label">Gaji x
                                                                    Jumlah masuk</label><br />
                                                                <input type="number" align="center"
                                                                    class="form-control pull-right" required
                                                                    name="gajix" value="<?= $hasilgaji ?>">
                                                                <br /><br />
                                                                <label for="Level User" class="control-label">Tunj
                                                                    Jabatan
                                                                </label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="jabatan"
                                                                    value='<?= $isi->tun_jabatan ?>'><br /><br />
                                                                <label for="Level User" class="control-label">Uang
                                                                    Makan x Masuk Kerja</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="makan" value='<?= $mam ?>'
                                                                    id=""><br /><br />
                                                                <label for="Level User" class="control-label">Uang
                                                                    transport</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="uang_transport"
                                                                    value='<?= $trans ?>'><br /><br />
                                                                <label for="Level User"
                                                                    class="control-label">Ovetime</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="overtime"
                                                                    value='<?= $jmo ?>'><br /><br />
                                                                <label for="Level User"
                                                                    class="control-label">Insentif</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="insentif"
                                                                    value='<?= $inss ?>'><br /><br />
                                                                <label for="Level User"
                                                                    class="control-label">Lembur</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="lembur"
                                                                    value='<?= $lem ?>'><br /><br />
                                                                <label for="Level User" class="control-label">Gaji
                                                                    kotor</label><br />
                                                                <input type="number" disabled
                                                                    class="form-control pull-right" required
                                                                    name="gajikotor"
                                                                    value='<?= $gajikotor ?>'><br /><br />
                                                                <label for="Level User"
                                                                    class="control-label">Potongan</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="potongan" value='<?php if (
                                                                        $kasbon ==
                                                                        ''
                                                                    ) {
                                                                        echo '0';
                                                                    } else {
                                                                        echo $kasbon;
                                                                    } ?>'><br /><br />
                                                                <label for="Level User"
                                                                    class="control-label">JHT</label><br />
                                                                <input type="number" class="form-control pull-right"
                                                                    required name="jht" value='<?= $is ?>'><br /><br />
                                                                <label for="Level User" class="control-label">Bonus
                                                                </label><br />
                                                                <input type="text" class="form-control pull-right"
                                                                    required name="bonus" value='0'><br /><br />

                                                                <br />
                                                                <input type="hidden" class="form-control pull-right"
                                                                    required name="id_pegawai"
                                                                    value='<?= $isi->id_pegawai ?>'><br />

                                                                <input type='hidden' name='id' value='<?= $isi->id ?>'>

                                                            </div>
                                                        </div>
                                                        <br />
                                                        <h6> <span class="badge bg-red">NOTE : Berikan angka 0 (nol)
                                                                jika tidak
                                                                diisi</span></h6>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger pull-left"
                                                                data-dismiss="modal">Batal</button>
                                                            <input type="submit" class="btn btn-primary" value="simpan">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <?php $no++;
                            }
                            ?>
                        </tbody>
                    </table>
                    <div class="col-xs-6" style="margin-top:10px">
                        Showing <?= $count ?> to <?= $no - 1 ?> of
                        <?= $pg->total_record ?> entries

                    </div>

                    <div class="col-xs-6">

                        <?php
                        if (isset($_GET['q'])) {
                            $pg->url =
                                base_index() .
                                'bayargaji?q=' .
                                $_GET['q'] .
                                '&page=';
                        }
                        $pg->setParameter([
                            'range' => $limit,
                        ]);
                        ?>

                        <div class="dataTables_paginate paging_bootstrap">
                            <ul class="pagination">
                                <?= $pg->create() ?>
                            </ul>
                        </div>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
    <?php } ?>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <label>histori</label>

                </div><!-- /.box-header -->

                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Tanggal Gaji</th>
                                <th>Nama Pegawai</th>
                                <th>Gaji</th>
                                <th>Jabatan</th>
                                <th>OverTime</th>
                                <th>Uang Makan</th>
                                <th>insentif</th>
                                <th>Lembur</th>
                                <th>Uang Transport</th>
                                <th>Gaji Kotor</th>
                                <th>JHT</th>
                                <th>Pot. Kasbon</th>
                                <th>Bonus</th>
                                <th>Gaji bersih</th>
                                <th>STATUS</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (
                                $level == 'administrator' ||
                                $level == 'admin'
                            ) {
                                $dtb1 = $db->query(
                                    "select*from sys_users as a, t_histori_gaji as b where a.id=b.id_pegawai
                                   order by b.tgl_gajian DESC"
                                );
                            } else {
                                // echo $ids;
                                $dtb1 = $db->query(
                                    "select*from sys_users as a, t_histori_gaji as b where a.id=b.id_pegawai and a.id='$ids'
                                   order by b.tgl_gajian DESC"
                                );
                            }
                            $no = 1;

                            foreach ($dtb1 as $isi) { ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= tgl_indo($isi->tgl_gajian) ?></td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->gajix,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->jabatan,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->overtime,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->makan,
                                    2,
                                    ',',
                                    '.'
                                ) ?>
                                </td>
                                <td>Rp. <?= number_format(
                                    $isi->insentif,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->lembur,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->transport,
                                    2,
                                    ',',
                                    '.'
                                ) ?>
                                </td>
                                <td>Rp. <?= number_format(
                                    $isi->gajikotor,
                                    2,
                                    ',',
                                    '.'
                                ) ?>
                                </td>
                                <td>Rp. <?= number_format(
                                    $isi->potonganjht,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->potongan,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->bonus,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->gajibersih,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td><?php if ($isi->sts_gaji == 1) {
                                    echo '<span class="badge bg-green">Dibayar</span>';
                                } else {
                                    echo '<span  class="badge bg-red">Belum Dibayar</span>';
                                } ?></td>
                                <td>
                                    <?php if ($isi->sts_gaji == 1) { ?>
                                    <a href="" data-toggle="modal" disabled data-target="#modal-default-<?= $isi->id ?>"
                                        class="btn btn-info badge btn-flat"><i class="fa fa-check"></i> Bayar</a>
                                    <a class="btn btn-danger badge btn-flat" data-toggle="modal"
                                        data-target="#modal-hapus-<?= $isi->id ?>">
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                    <?php } else { ?>
                                    <a href="" data-toggle="modal" data-target="#modal-default-<?= $isi->id ?>"
                                        class="btn btn-info badge btn-flat">
                                        <i class="fa fa-check"></i> Bayar</a>
                                    <a class="btn btn-danger badge btn-flat" data-toggle="modal"
                                        data-target="#modal-hapus-<?= $isi->id ?>">
                                        <i class="fa fa-trash-o"></i></a>
                                    <?php } ?>


                                    <div class="modal fade" id="modal-default-<?= $isi->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/bayargaji/bayargaji_action.php?act=up">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah Anda ingin membayar gaji <?= $isi->first_name ?>?
                                                        </p>
                                                        <label>TANGGAL BAYAR GAJI : </label>
                                                        <input type='text' class="form-control date"
                                                            value='<?= $isi->tgl_gajian ?>' name='tgl'>
                                                        <input type='hidden' value='<?= $isi->id ?>' name='id'>
                                                        <input type='hidden' value='<?= $isi->id_pegawai ?>'
                                                            name='id_pegawai'>
                                                        <input type='hidden' value='1' name='status'>
                                                        <input type='hidden' value='B' name='status_bayar'>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default pull-left"
                                                            data-dismiss="modal">Batal</button>
                                                        <input type="submit" class="btn btn-primary" value='Simpan'>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="modal fade" id="modal-hapus-<?= $isi->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/bayargaji/bayargaji_action.php?act=del">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah Anda ingin menghapus data <?= $isi->first_name ?>?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi->id ?>' name='id'>
                                                        <input type='hidden' value='1' name='status'>
                                                        <input type='hidden' value='B' name='status_bayar'>
                                                        <input type="hidden" align="center"
                                                            class="form-control pull-right" required name="mulai" value="<?= $_GET[
                                                                'mulai'
                                                            ] ?>">
                                                        <input type="hidden" align="center"
                                                            class="form-control pull-right" required name="dari" value="<?= $_REQUEST[
                                                                'dari'
                                                            ] ?>">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default pull-left"
                                                            data-dismiss="modal">Batal</button>
                                                        <input type="submit" class="btn btn-danger" value='hapus'>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                </td>
                            </tr>

                            <?php $no++;}
                            ?>

                    </table>
                    </tbody>



                </div>

            </div><!-- /.box -->
        </div>
    </div>
    <!--  <a href="<?= base_index() ?>bayargaji/tambah" class="btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
                    -->
</section><!-- /.content -->