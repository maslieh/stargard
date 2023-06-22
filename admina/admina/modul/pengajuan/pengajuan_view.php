<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Setting Pengajuan kasbon / pinjaman
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>pengajuan">pengajuan kasbon/pinjaman</a></li>
        <li class="active">pengajuan List</li>
    </ol>
</section>
<?php
$ids = $_SESSION['id_user'];
$datas = $db->fetch_custom_single(
    "select * from  sys_users, sys_group_users   where  
                                sys_group_users.id=sys_users.id_group and
                                sys_users.id = $ids"
);
$level = $datas->level;
$nama_peminja = $datas->first_name . ' ' . $datas->last_name;
?>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">

                    <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                        data-target="#modal-tambah"><i class="fa fa-plus"> </i> Tambah</a><br><br><br>
                    <small class='badge bg-yellow'><em>Klik <a href="" disabled
                                class="btn btn-sm btn-flat badge bg-blue">
                                <i class="fa fa-remove"></i> Belum
                                Lunas</a> jika ingin mengkonfirmasi pembayaran</em></small>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Peminjam</th>
                                <th>Nama Pinjaman</th>
                                <th>Tanggal</th>
                                <th>Jumlah</th>
                                <th>Keterangan</th>
                                <th>Status</th>
                                <th>Status Bayar</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            $idp = $_SESSION['id_user'];
                            $lvl = $_SESSION['level'];
                            $dat = $db->fetch_custom_single(
                                "select *from sys_group_users where id=$lvl "
                            );

                            $dats = $db->fetch_custom_single(
                                "select *from sys_users where id=$idp "
                            );
                            $is = $dats->kode_jurusan;
                            //  echo $dat->level;
                            //  echo $dat->level;
                            if ($dat->level == 'administrator') {
                                $dtb = $db->query(
                                    "select *, a.id as id,b.id as idu from t_pengeluaran  as a,sys_users as b where a.nama_peminjam=b.id and pengajuan='K' and sts_hapus='N' order by tanggal DESC"
                                );
                            } elseif ($dat->level == 'admin') {
                                $dtb = $db->query(
                                    "select *, a.id as idp from t_pengeluaran  as a,sys_users as b where a.nama_peminjam=b.id and pengajuan='K' and sts_hapus='N'"
                                );
                            } else {
                                $dtb = $db->query(
                                    "select *, a.id as id,b.id as idu from t_pengeluaran  as a,sys_users as b where a.nama_peminjam=b.id and a.nama_peminjam ='$ids' and pengajuan='K' and sts_hapus='N'"
                                );
                            }
                            $no = 1;
                            foreach ($dtb as $isi) {

                                //  @$sum += $isi->lama;
                                //  $sisa = $isi->batas - $sum;
                                if ($isi->status_aju == 'Y') {
                                    $status =
                                        '<span class="badge bg-green">Disetujui</span>  ';
                                } elseif ($isi->status_aju == 'N') {
                                    $status =
                                        '<span class="badge bg-red">Ditolak</span>';
                                } elseif ($isi->status_aju == 'R') {
                                    $status =
                                        '<span class="badge bg-blue">Review</span>';
                                } else {
                                    $status =
                                        '<span class="badge bg-yellow">Pending</span>';
                                }
                                if ($isi->sts_bayar == '1') {
                                    $status1 =
                                        '<a href="" class="btn btn-sm btn-flat badge bg-green " data-toggle="modal"
                                        data-target="#modals-' .
                                        $isi->id .
                                        '"> <i class="fa fa-remove"></i>  Lunas</a>';
                                } else {
                                    $status1 =
                                        '<a href="" class="btn btn-sm btn-flat badge bg-blue" data-toggle="modal"
                                        data-target="#modals-' .
                                        $isi->id .
                                        '"> <i class="fa fa-remove"></i> Belum
                            Lunas</a>';
                                }
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $nama = ucwords($isi->first_name) ?>
                                    <?= $nama = ucwords($isi->last_name) ?></td>
                                <td><?= $isi->nama_p ?></td>
                                <td><?= tgl_indo($isi->tanggal) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->jumlah,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td><?= $isi->keterangan ?></td>
                                <td><?= $status ?> </td>
                                <td><?= $status1 ?> </td>
                                <td>
                                    <?php if (
                                        $level == 'administrator' ||
                                        $level == 'admin'
                                    ) { ?>
                                    <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>"> <i class="fa fa-pencil"> </i></a>
                                    <button class="btn btn-danger btn-sm btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/pengeluaran/pengeluaran_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i>
                                    </button>
                                    <?php } else {if (
                                            $isi->status_aju == 'Y'
                                        ) { ?>

                                    <a href="" class="btn btn-sm btn-flat btn-danger" disabled data-toggle="modal"
                                        data-target="#modal<?= $isi->id ?>"> <i class="fa fa-trash-o"> </i></a>

                                    <?php } else { ?>
                                    <button class="btn btn-danger btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/pengeluaran/pengeluaran_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>


                                    <?php }} ?>
                                </td>

                                <div class="modal fade" id="modals-<?= $isi->id ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">Konfirmasi Pembayayaran kasbon</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/pengajuan/pengajuan_action.php?act=upb">
                                                            <div class="form-group">

                                                                <div class="">

                                                                    <input type="hidden" name="id"
                                                                        value="<?= $isi->id ?>">
                                                                    <input type="hidden" name="tglbayar" value="<?= date(
                                                                        'Y-m-d'
                                                                    ) ?>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Deskripsi" class="control-label ">
                                                                    Konfirmasi Apakah Sudah Bayar</label>
                                                                <div>
                                                                    <select name="sts_bayar"
                                                                        class="form-control chzn-select" tabindex="2">
                                                                        <option value="2">Pilih</option>
                                                                        <option value="1">Bayar</option>
                                                                        <option value="0">Belum Bayar</option>

                                                                    </select>
                                                                </div>
                                                            </div><!-- /.form-group --><br />


                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="simpan">
                                                            </div>
                                                        </form>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal fade" id="modal-<?= $isi->id ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">EDIT PENGAJUAN</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/pengajuan/pengajuan_action.php?act=up">
                                                            <div class="form-group">

                                                                <div class="">

                                                                    <input type="hidden" name="id"
                                                                        value="<?= $isi->id ?>">
                                                                    <input type="hidden" name="lama"
                                                                        value="<?= $isi->lama ?>">
                                                                    <input type="hidden" name="sisa"
                                                                        value="<?= $isi->sisa ?>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Deskripsi" class="control-label ">
                                                                    Konfirmasi</label>
                                                                <div>
                                                                    <select name="sts" class="form-control chzn-select"
                                                                        tabindex="2">
                                                                        <option value="">Pilih</option>
                                                                        <option value="Y">Setuju</option>
                                                                        <option value="R">Review</option>
                                                                        <option value="N">Tolak</option>

                                                                    </select>
                                                                </div>
                                                            </div><!-- /.form-group --><br />


                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="simpan">
                                                            </div>
                                                        </form>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal fade" id="modal<?= $isi->id ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">Hapus data</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/pengajuan/pengajuan_action.php?act=del">
                                                            <div class="form-group">
                                                                <label for="First Name" class="control-label">
                                                                    Apakah Anda ingin menghapus data ini? </label>

                                                                <input type="hidden" name="id" value="<?= $isi->id ?>">
                                                            </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger pull-left"
                                                            data-dismiss="modal">Batal</button>
                                                        <input type="submit" class="btn btn-primary" value="simpan">
                                                    </div>
                                                    </form>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                </div>
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


</section><!-- /.content -->

<div class="modal fade" id="modal-tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="input" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/pengajuan/pengajuan_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Pengajuan </h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3> <label for="Level User" class="control-label">Nama pengajuan</label>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <select name="nama_p" required data-placeholder="Pilih Pegawai ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih Pegawai</option>
                                        <?php foreach (
                                            $db->query(
                                                "select * from t_pengajuan where kode ='K' "
                                            )
                                            as $isi
                                        ) {
                                            echo "<option selected value='$isi->nama'>$isi->nama</option>";
                                        } ?>
                                    </select>
                                </div>
                            </div>

                            <label for="Level User" class="control-label">Tanggal Pengajuan</label>
                            <input type="text" class="form-control pull-right date" name="tanggal"
                                value="<?= date('Y-m-d') ?>" id=""><br />
                            <label for="Level User" class="control-label">Jumlah Pinjaman/kasbon</label>
                            <input type="text" class="form-control pull-right" required plscholder="1000000"
                                name="jumlah" id=""><br />

                            <label for="Level User" class="control-label">Keterangan </label>
                            <input type="text" class="form-control pull-right" name="keterangan" id=""><br />
                            <?php if (
                                $level == 'administrator' ||
                                $level == 'admin'
                            ) { ?>
                            <label for="Level User" class="control-label">Keterangan</label>
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <select name="nama_peminjam" required data-placeholder="Pilih Peminjam ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih Peminjam</option>
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
                            <?php } else { ?>
                            <input type="hidden" class="form-control pull-right" name="nama_peminjam"
                                value="<?= $ids ?>" id="">
                            <?php } ?>
                            <br />
                            <input type="hidden" class="form-control pull-right" name="kasbon" value="K" id="">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Batal</button>
                        <input type="submit" class="btn btn-primary" value="simpan">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>