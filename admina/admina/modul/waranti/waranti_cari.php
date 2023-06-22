<section class="content-header">
    <h1>
        Waranti
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>warannti">Data waranti</a></li>
        <li class="active">Data Waranti </li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <form action="<?= base_index() ?>waranti/cari" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">cari berdasarkan </button>
                            </span>
                            <input type="text" name="mulai" class="form-control date" value="<?= $mulai ?>"
                                placeholder="yyyy-mm-dd" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"> s/d </button>
                            </span>
                            <input type="text" name="dari" value="<?= $dari ?>" class="form-control date"
                                placeholder="yyyy-mm-dd" />

                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-success btn-flat">Submit</button>
                            </span>
                            <span class="input-group-btn">
                                <a href="<?= base_index() ?>waranti" class="btn btn-info">Reset</a>
                            </span>
                        </div>

                    </form>
                    <hr>
                    <?php if (isset($_GET['mulai']) && isset($_GET['dari'])) {
                        $dtb = 'dtb_manuail13';
                    } else {
                        echo '<form action="" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" disabled type="button">Pencarian !</button>
                            </span>
                            <input type="text" name="q" class="form-control" placeholder="Search..." />
                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-flat"><i
                                        class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>';
                        $dtb = '';
                    } ?>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="<?= $dtb ?>" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Tanggal</th>
                                <th>No Warantsi</th>
                                <th>Nama Customer</th>
                                <th>Kendaraan</th>
                                <th>Jenis pekrejaan </th>
                                <th>Batas Tgl Waranti</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (isset($_GET['mulai']) && isset($_GET['dari'])) {
                                $dtb = $db->query(
                                    "select a.*,b.*,c.nama as nama_p, a.nama as nama_m,a.id as idt,a.tlp from t_transaksi as a , t_garansi as b,
                                t_paket as c 
                                where  a.waranti=b.id_data and a.id_teknisi=c.id and a.sts_book='Y' and sts_hapus='N' and a.tgl BETWEEN '$mulai' and '$dari'  order by a.id DESC"
                                );
                            } else {
                                if (isset($_GET['q'])) {
                                    $search_condition = $db->getRawWhereFilterForColumns(
                                        $_GET['q'],
                                        [
                                            'a.nama',
                                            'a.waranti',
                                            'a.no_rangka',
                                            'a.no_polisi',
                                        ]
                                    );
                                    $search = "and $search_condition";
                                }
                                $no = 1;

                                $dtb = $pg->myquery(
                                    "select a.*,b.*,c.nama as nama_p, a.nama as nama_m,a.id as idt,a.tlp from t_transaksi as a , t_garansi as b,
                                t_paket as c 
                                where  a.waranti=b.id_data and a.id_teknisi=c.id and a.sts_book='Y' and sts_hapus='N'
                                $search   order by a.id DESC",
                                    $limit
                                );
                                $no = $pg->Num($limit);
                                $count = $pg->Num($limit);
                                if ($dtb->rowCount() < 1) {
                                    echo "<tr><td colspan='5'>No matching records found</td></tr>";
                                }
                            }
                            $no = 1;

                            foreach ($dtb as $isi) {
                                $sisa = $isi->batas - $isi->terpakai; ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= tgl_indo($isi->tgl) ?></td>
                                <td><?= $isi->waranti ?></td>
                                <td><?= $isi->nama_m ?></td>
                                <td><?= $isi->jns_kendaraan ?></td>
                                <td><?= $isi->nama_p ?></td>
                                <td><?= tgl_indo($isi->tgl_mulai) ?> s/d
                                    <?= tgl_indo($isi->tgl_akhir) ?></td>
                                <td width="220">
                                    <a href="" class="btn btn-sm btn-warning badge" data-toggle="modal"
                                        data-target="#modal-warning<?= $isi->waranti ?>"><i class='fa fa-pencil'></i>
                                    </a>

                                    <a href="" class="btn btn-sm btn-info badge" data-toggle="modal"
                                        data-target="#modal-info<?= $isi->waranti ?>"><i class='fa fa-calendar'></i>
                                        booking</a>

                                    <a href="waranti/histori/<?= $isi->waranti ?>" class="btn btn-sm bg-blue badge">
                                        <i class="fa  fa-print   "></i></a>
                                    <a href="penjualan/card/<?= $isi->waranti ?>" class="btn btn-sm bg-maroon badge"> <i
                                            class="fa fa-credit-card"></i></a>
                                    <a href="https://wa.me/62<?= $isi->tlp ?>?text= %0ASelamat%20Siang%20Bapak%2FIbu%20*<?= $isi->nama_m ?>*%20pemilik%20kendaraan%20*<?= $isi->jns_kendaraan ?>*%20Perkenalkan%20saya%20%20dari%20admin%20*STARGARD*
                                    %20%20%0A%0AKami%20Informasikan%20kendaraan%20*<?= $isi->jns_kendaraan ?>*%20Bpk/Ibu%20untuk%20dilakukan%20perawatan%20coating%20%20%0A%0AApakah%20berkenan%20jika%20kami%20bantu%20untuk%20*reservasi*%20di%20perawatan%20berkala%20tsb%20pak/bu?%20%20%0A%0ATerimakasih😊🙏%20
                                  " target="_blank" class="btn btn-success badge btn-sm"><i
                                            class="fa fa-whatsapp"></i></a>
                                    <div class="modal modal-warning fade" id="modal-warning<?= $isi->waranti ?>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">Konfirmasi</h4>
                                                </div>
                                                <form id="update" method="post" class="form-horizontal"
                                                    action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=up2">
                                                    <div class="modal-body">
                                                        <label for="Level User" class="control-label">No
                                                            Waranti</label>
                                                        <div class="input-group">

                                                            <span class="input-group-addon"><i
                                                                    class="fa fa-star-o"></i></span>
                                                            <input type="text" name="id_data" class="form-control"
                                                                readonly value="<?= $isi->waranti ?>"
                                                                placeholder="Waranti">
                                                            <input type="hidden" name="idt" class="form-control"
                                                                value="<?= $isi->idt ?>" placeholder="Waranti">
                                                            <input type="hidden" name="id" class="form-control"
                                                                value="<?= $isi->id ?>" placeholder="Waranti">
                                                        </div><br><br>
                                                        <label for="Level User" class="control-label">Batas
                                                            Waranti</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i
                                                                    class="fa fa-hourglass-1"></i></span>
                                                            <input type="text" name="batas" class="form-control"
                                                                value="<?= $isi->batas ?>" placeholder="Username">
                                                        </div><br><br>
                                                        <label>Terpakai</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><i
                                                                    class="fa fa-hourglass-3"></i></span>
                                                            <input type="text" name="terpakai" class="form-control"
                                                                value="<?= $isi->terpakai ?>" placeholder="Username">
                                                        </div><br><br>
                                                        <label>Batas Tanggal waranti</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date"><i
                                                                    class="fa fa-calendar"></i>
                                                            </span>
                                                            <input type="text" class="form-control pull-right date"
                                                                value="<?= $isi->tgl_mulai ?>" name="tgl_mulai"
                                                                id=" datepicker">
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date"><i
                                                                    class="fa fa-calendar"></i>
                                                            </span>
                                                            <input type="text" class="form-control pull-right date"
                                                                value="<?= $isi->tgl_akhir ?>" name="tgl_akhir"
                                                                id="datepicker">
                                                        </div><br><br>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-outline pull-left"
                                                            data-dismiss="modal">Close</button>
                                                        <input type="submit" class="btn btn-outline" value='Simpan'>
                                                    </div>
                                                </form>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="modal modal-info fade" id="modal-info<?= $isi->waranti ?>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">Konfirmasi</h4>
                                                </div>
                                                <form id="update" method="post" class="form-horizontal"
                                                    action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=up">
                                                    <div class="modal-body">
                                                        <label for="Level User" class="control-label">No
                                                            Waranti</label>
                                                        <div class="input-group">

                                                            <span class="input-group-addon"><i
                                                                    class="fa fa-star-o"></i></span>
                                                            <input type="text" name="waranti" class="form-control"
                                                                readonly value="<?= $isi->waranti ?>"
                                                                placeholder="Waranti">
                                                        </div><br><br>


                                                        <label>Jadwal</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date"><i
                                                                    class="fa fa-calendar"></i>
                                                            </span>
                                                            <input type="text" name="tgl_pakai"
                                                                class="form-control pull-right date"
                                                                value="<?= $isi->tgl ?>" id="datepicker">
                                                        </div>

                                                        <label>Harga</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date">
                                                            </span>
                                                            <input type="text" name="harga_p" value='500000'
                                                                placeholder="1000000" class="form-control pull-right">

                                                        </div>
                                                        <label>Bayar</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date">
                                                            </span>
                                                            <input type="text" name="harga_w" value='0'
                                                                placeholder="1000000" class="form-control pull-right">

                                                        </div>
                                                        <small><em>Isikan 0 (NOL) jika dalam
                                                                masa garansi</em></small>

                                                        <label>keterangan</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon date">
                                                            </span>
                                                            <textarea type="text" name="keterangan"
                                                                class="form-control pull-right"></textarea>
                                                        </div>
                                                        <div>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" required name="status_bayar"
                                                                        id="optionsRadios1" value="T">Belum Bayar
                                                                    &nbsp;&nbsp;&nbsp;
                                                                </label>
                                                                <label>
                                                                    <input type="radio" required name="status_bayar"
                                                                        id="optionsRadios2" value="B">Sudah Bayar
                                                                </label>
                                                            </div>&nbsp;
                                                        </div>
                                                        <label>Teknisi</label>
                                                        <div class="form-control">
                                                            <select name="nama_p" required
                                                                data-placeholder="Pilih Pegawai ..."
                                                                class="form-control pull-right" tabindex="2">
                                                                <option value="">Pilih teknisi</option>
                                                                <?php foreach (
                                                                    $db->query(
                                                                        "select * from sys_users where id_group ='20' "
                                                                    )
                                                                    as $isi
                                                                ) {
                                                                    echo "<option  value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                                                } ?>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-outline pull-left"
                                                            data-dismiss="modal">Close</button>
                                                        <input type="submit" class="btn btn-primary btn-outline"
                                                            value="submit">
                                                    </div>
                                                </form>
                                            </div>

                                        </div>

                                    </div>




                                </td>
                            </tr>
                            <?php $no++;
                            }
                            ?>
                        </tbody>
                    </table>
                    <?php if (
                        !isset($_GET['mulai']) &&
                        !isset($_GET['dari'])
                    ) { ?>
                    <div class="col-xs-6" style="margin-top:10px"> Showing
                        <?= $count ?> to <?= $no - 1 ?> of
                        <?= $pg->total_record ?> entries

                    </div>

                    <div class="col-xs-6">

                        <?php
                        if (isset($_GET['q'])) {
                            $pg->url =
                                base_index() .
                                'waranti?q=' .
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
                    <?php } else {} ?>

                </div><!-- /.box-body -->



            </div><!-- /.box -->
        </div>
    </div>
    <!-- HISTORY-->

    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <label>BOOKING TREATMENT</label>
                    <hr>
                    <form action="<?= base_index() ?>waranti/cari" method="get" class="form_cari">

                        <div class="form-row col-md-12">
                            <div class="form-group col-md-3">
                                <label for="inputCity">Mulai</label>
                                <input type="text" name="mli" class="form-control date" value="<?= $_GET[
                                    'mli'
                                ] ?>" placeholder=" yyyy-mm-dd" />
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputCity">Sampai</label>
                                <input type="text" name="smp" value="<?= $_GET[
                                    'smp'
                                ] ?>" class=" form-control date" placeholder="yyyy-mm-dd" />
                            </div>

                        </div>

                        <div class="form-row col-md-12">
                            <div class="form-group col-md-3">
                                <label for="inputState">Status Bayar</label>
                                <select id="inputState" name="bayar" class="form-control">
                                    <option value=''>Pilih...</option>
                                    <?php if ($_GET['bayar'] == 'B') {
                                        echo '<option value="B" selected>Lunas</option>
                                           <option value="T">Belum Lunas</option>';
                                    } elseif ($_GET['bayar'] == 'T') {
                                        echo '<option value="B" >Lunas</option>
                                           <option value="T" selected>Belum Lunas</option>';
                                    } else {
                                        echo '<option value="B" >Lunas</option>
                                           <option value="T" >Belum Lunas</option>';
                                    } ?>



                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputState">Status Pengerjaan</label>
                                <select id="inputState" name="kerja" class="form-control">
                                    <option value=''>Pilih...</option>
                                    <?php if ($_GET['kerja'] == '0') {
                                        echo '
                                    <option value="0" selected>Pending</option>
                                    <option value="1">Selesai</option>
                                    <option value="3">Batal</option>';
                                    } elseif ($_GET['kerja'] == '1') {
                                        echo '
                                    <option value="0">Pending</option>
                                    <option value="1" selected>Selesai</option>
                                    <option value="3">Batal</option>';
                                    } elseif ($_GET['kerja'] == '3') {
                                        echo '
                                    <option value="0">Pending</option>
                                    <option value="1">Selesai</option>
                                    <option value="3" selected>Batal</option>';
                                    } else {
                                        echo '<option value="0">Pending</option>
                                    <option value="1">Selesai</option>
                                    <option value="3">Batal</option>';
                                    } ?>

                                </select>
                            </div>

                        </div>
                        <label class="badge bg-blue"><small><i>Kosongkan tanggal jika ingin mencari berdasarkan
                                    status</i></small></label><br>
                        <button type="submit" class="btn btn-primary">Cari</button>
                        <a href="<?= base_index() ?>waranti" class="btn btn-info">Reset</a>
                    </form>
                    <br />
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Jadwal Service</th>
                                <th>No Waranti</th>
                                <th>Nama CUST</th>
                                <th>Kendaraan</th>
                                <th>Pekrejaan Awal</th>
                                <th>Keterangan</th>
                                <th>Pekrejaan</th>
                                <th>Teknisi</th>
                                <th>Harga</th>
                                <th>Bayar</th>
                                <th>Tgl Input</th>
                                <th>Status</th>
                                <th>Status Pengerjaan</th>
                                <th>aksi</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            $search = '';

                            $bayar = $_GET['bayar'];
                            $kerja = $_GET['kerja'];
                            $mli = $_GET['mli'];
                            $smp = $_GET['smp'];
                            if (
                                $mli == '' &&
                                $smp == '' &&
                                $bayar == '' &&
                                $kerja == ''
                            ) {
                                echo $stss = '';
                            } elseif (
                                $mli != '' &&
                                $smp != '' &&
                                $bayar != '' &&
                                $kerja != ''
                            ) {
                                echo $stss = "AND b.tgl_pakai BETWEEN '$mli' AND '$smp' and b.status_bayar='$bayar' and b.sts_kerja='$kerja'";
                            } elseif (
                                $mli != '' &&
                                $smp != '' &&
                                $bayar != '' &&
                                $kerja == ''
                            ) {
                                echo $stss = "AND b.tgl_pakai BETWEEN '$mli' AND '$smp' and b.status_bayar='$bayar'";
                            } elseif (
                                $mli != '' &&
                                $smp != '' &&
                                $bayar == '' &&
                                $kerja != ''
                            ) {
                                echo $stss = "AND b.tgl_pakai BETWEEN '$mli' AND '$smp' and b.sts_kerja='$kerja'";
                            } elseif (
                                $mli == '' &&
                                $smp == '' &&
                                $bayar != '' &&
                                $kerja != ''
                            ) {
                                echo $stss = " and b.status_bayar='$bayar' and b.sts_kerja='$kerja'";
                            } elseif (
                                $mli == '' &&
                                $smp == '' &&
                                $bayar == '' &&
                                $kerja != ''
                            ) {
                                echo $stss = " and b.sts_kerja='$kerja'";
                            } elseif (
                                $mli == '' &&
                                $smp == '' &&
                                $bayar != '' &&
                                $kerja == ''
                            ) {
                                echo $stss = " and b.status_bayar='$bayar' ";
                            }
                            $dtb = $db->query(
                                "select b.id,a.waranti,b.sts_kerja,a.jns_kendaraan,b.keterangan,b.tgl_pakai,b.tgl_time,b.harga_w,b.harga_p,b.pekerjaan,a.id_teknisi,b.status_bayar,a.nama as name, a.tlp
                            from t_transaksi as a, t_history as b where a.waranti=b.waranti $stss order by b.status_bayar DESC
                            "
                            );

                            foreach ($dtb as $isi1) {

                                if ($isi1->harga_w == 0) {
                                    $bayar = 'Garansi';
                                } else {
                                    $bayar = 'Treatmen';
                                }
                                $day = date('D', strtotime($isi1->tgl_pakai));
                                $dayList = [
                                    'Sun' => 'Minggu',
                                    'Mon' => 'Senin',
                                    'Tue' => 'Selasa',
                                    'Wed' => 'Rabu',
                                    'Thu' => 'Kamis',
                                    'Fri' => 'Jumat',
                                    'Sat' => 'Sabtu',
                                ];
                                $idpp = $isi1->id_teknisi;
                                $hari = $dayList[$day];
                                $datas = $db->fetch_custom_single(
                                    "select*from t_paket where id='$idpp' "
                                );
                                $idm = $isi1->pekerjaan;
                                $datsa = $db->fetch_custom_single(
                                    "select*from sys_users where id='$idm' "
                                );
                                ?>
                            <tr id="line_<?= $isi1->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $hari ?>,
                                    <?= tgl_indo($isi1->tgl_pakai) ?>
                                </td>
                                <td><?= $isi1->waranti ?></td>
                                <td><?= $isi1->name ?></td>
                                <td><?= $isi1->jns_kendaraan ?> </td>
                                <td> <?= $datas->nama ?></td>
                                <td><?= $isi1->keterangan ?></td>
                                <td><?= $bayar ?></td>

                                <td> <?= $datsa->first_name ?></td>
                                <td>Rp. <?= number_format(
                                    $isi1->harga_p,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi1->harga_w,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>
                                <td> <?php
                                $date = date_create($isi1->tgl_time);
                                echo date_format($date, 'd/m/Y H:i:s');
                                ?></td>
                                <td>
                                    <?php if ($isi1->status_bayar == 'T') { ?>
                                    <button type="button" class="btn bg-red btn-sm badge" data-toggle="modal"
                                        data-target="#modal-default-<?= $isi1->id ?>">
                                        <i class="fa  fa-close"></i> Belum Lunas
                                    </button>

                                    <div class="modal fade" id="modal-default-<?= $isi1->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=upd">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah Anda ingi mengubah status <?= $isi1->jns_kendaraan ?>?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi1->id ?>' name='id'>
                                                        <input type='hidden' value='B' name='status_bayar'>
                                                        <div>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" required name="status_bayar"
                                                                        id="optionsRadios1" value="T">Belum Bayar
                                                                    &nbsp;&nbsp;&nbsp;
                                                                </label>
                                                                <label>
                                                                    <input type="radio" required name="status_bayar"
                                                                        id="optionsRadios2" value="B">Sudah Bayar
                                                                </label>
                                                            </div>&nbsp;
                                                        </div>
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
                                    <?php } else { ?>
                                    <span class=" badge bg-blue">Lunas</span>
                                    <?php } ?>
                                </td>
                                <td>
                                    <?php if ($isi1->sts_kerja == 0) { ?>
                                    <button type="button" class="btn bg-orange btn-sm badge" data-toggle="modal"
                                        data-target="#modal-default<?= $isi1->id ?>">
                                        <i class="fa  fa-close"></i> Pending
                                    </button>

                                    <div class="modal fade" id="modal-default<?= $isi1->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=upk">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status Kerja</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah <?= $isi1->jns_kendaraan ?> sudah selesai dikerjakan ?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi1->id ?>' name='id'>

                                                        <div>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" required name="sts_kerja"
                                                                        id="optionsRadios1" value="0">Pending
                                                                    &nbsp;&nbsp;&nbsp;
                                                                </label>
                                                                <label>
                                                                    <input type="radio" required name="sts_kerja"
                                                                        id="optionsRadios2" value="1">Selesai
                                                                </label> &nbsp;&nbsp;&nbsp;
                                                                <label>
                                                                    <input type="radio" required name="sts_kerja"
                                                                        id="optionsRadios2" value="3">Batal
                                                                </label>
                                                            </div>&nbsp;
                                                        </div>
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
                                    <?php } elseif ($isi1->sts_kerja == 1) { ?>
                                    <span class=" badge bg-green">Selesai</span>

                                    <?php } else { ?>
                                    <button type="button" class="btn bg-blue btn-sm badge" data-toggle="modal"
                                        data-target="#modal-default<?= $isi1->id ?>">
                                        <i class="fa  fa-close"></i> BATAL
                                    </button>

                                    <div class="modal fade" id="modal-default<?= $isi1->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=upk">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status Kerja</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah <?= $isi1->jns_kendaraan ?> sudah selesai dikerjakan ?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi1->id ?>' name='id'>

                                                        <div>
                                                            <label>
                                                                <input type="radio" required name="sts_kerja"
                                                                    id="optionsRadios1" value="0">Pending
                                                                &nbsp;&nbsp;&nbsp;
                                                            </label>
                                                            <label>
                                                                <input type="radio" required name="sts_kerja"
                                                                    id="optionsRadios2" value="1">Selesai
                                                            </label> &nbsp;&nbsp;&nbsp;
                                                            <label>
                                                                <input type="radio" required name="sts_kerja"
                                                                    id="optionsRadios2" value="3">Batal
                                                            </label>
                                                        </div>
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
                                    <?php } ?>
                                </td>
                                <td width='100'> <a href="waranti/histori/<?= $isi1->waranti ?>"
                                        class="btn badge btn-sm btn-info">
                                        <i class="fa  fa-print   "></i></a>
                                    <button type="button" class="btn bg-blue btn-sm badge" data-toggle="modal"
                                        data-target="#modal-defaul<?= $isi1->id ?>">
                                        <i class="fa  fa-edit"></i>
                                    </button>

                                    <a href="https://wa.me/62<?= $isi1->tlp ?>?text= %0ASelamat%20Siang%20Bapak%2FIbu%20*<?= $isi1->name ?>*%20pemilik%20kendaraan%20*<?= $isi1->jns_kendaraan ?>*
                                    %20Perkenalkan%20saya%20%20dari%20admin%20*STARGARD*%20%20%0A%0ASebelum%20nya%20kami%20ucapkan%20terimakasih%20sudah%20melakukan%20pembayaran%20%2F%20booking%20jadwal%20kepada%20kami%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%0AKami%20informasikan%20Kepada%20bapak%2FIbu%20untuk%20proses%20kendaraan%20nya%20akan%20dilakukanya%20pengerjaan%20
                                    *<?= $isi1->keterangan ?>*%20Pada%20hari%20
                                    *<?= $hari ?>,%20  <?= tgl_indo(
    $isi1->tgl_pakai
) ?>*%0A%0AMohon%20untuk%20Ketersediaan%20waktu%20nya%20%0A%0ATerimakasih%F0%9F%98%8A%F0%9F%99%8F" target="_blank"
                                        class="btn btn-success badge btn-sm"><i class="fa fa-whatsapp"></i></a>
                                    <div class="modal fade" id="modal-defaul<?= $isi1->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=ed">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah harga</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah <?= $isi1->jns_kendaraan ?> sudah sesuai ?
                                                        </p>
                                                        <label>Tanggal </label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon ">
                                                            </span>
                                                            <input type='text' class="form-control date"
                                                                value='<?= $isi1->tgl_pakai ?>' name='tanggal'>
                                                        </div>
                                                        <br> <br>
                                                        <label>Harga </label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon ">
                                                            </span>
                                                            <input type='text' class="form-control"
                                                                value='<?= $isi1->harga_p ?>' name='harga_p'>
                                                        </div>
                                                        <input type='hidden' value='<?= $isi1->id ?>' name='id'> <br>
                                                        <br>
                                                        <label>Bayar </label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon ">
                                                            </span>
                                                            <input type='text' class="form-control"
                                                                value='<?= $isi1->harga_w ?>' name='harga_w'>
                                                        </div>
                                                        <br> <br>
                                                        <label>keterangan </label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon ">
                                                            </span>
                                                            <input type='text' class="form-control"
                                                                value='<?= $isi1->keterangan ?>' name='keterangan'>
                                                        </div><br> <br>
                                                        <label>Teknisi</label>
                                                        <br>
                                                        <select name="teknisi" required
                                                            data-placeholder="Pilih Pegawai ..." class="form-control "
                                                            tabindex="2">
                                                            <option value="">Pilih teknisi</option>
                                                            <?php foreach (
                                                                $db->query(
                                                                    "select * from sys_users where id_group ='20' "
                                                                )
                                                                as $isi
                                                            ) {
                                                                if (
                                                                    $isi1->pekerjaan ==
                                                                    $isi->id
                                                                ) {
                                                                    echo "<option selected value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                                                } else {
                                                                    echo "<option  value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                                                }
                                                            } ?>
                                                        </select>

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

                                </td>
                            </tr>
                            <?php $no++;
                            }
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
</section>
<script type="text/javascript">
$(function() {
    $("#dtb_manual1").dataTable();
    $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false,

    });
});
$(function() {
    $("#dtb_manuail13").dataTable();
    $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false,

    });
});
</script>