<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Pengajuan Overtime
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>lembur">Overtime </a></li>
        <li class="active">Overtime List</li>
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

                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Tanggal</th>
                                <th>Nama</th>
                                <th>Overtime</th>
                                <th>Status Pengajuan</th>
                                <?php if (
                                    $level == 'administrator' ||
                                    $level == 'admin'
                                ) { ?>
                                <th>Aksi</th>
                                <?php } ?>
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
                            //  echo $idp;
                            $is = $dats->kode_jurusan;
                            //  echo $dat->level;
                            if ($dat->level == 'administrator') {
                                $dtb = $db->query(
                                    "select a.id,a.tanggal, a.sts_ajukan, a.ajukan,b.first_name,b.last_name,a.overtime 
                                    from t_presensi as a, sys_users as b where a.id_pegawai=b.id and a.status='P' order by a.tanggal DESC "
                                );
                            } elseif ($dat->level == 'admin') {
                                $dtb = $db->query(
                                    "select a.id,a.tanggal, a.sts_ajukan, a.ajukan,b.first_name,b.last_name,a.overtime 
                                    from t_presensi as a, sys_users as b where a.id_pegawai=b.id and a.status='P' order by a.tanggal DESC "
                                );
                            } else {
                                $dtb = $db->query(
                                    "select a.id,a.tanggal, a.sts_ajukan, a.ajukan,b.first_name,b.last_name,a.overtime 
                                    from t_presensi as a, sys_users as b where a.id_pegawai=b.id and a.status='P' AND id_pegawai='$idp' order by a.tanggal DESC "
                                );
                            }
                            $no = 1;
                            foreach ($dtb as $isi) {
                                if ($isi->sts_ajukan == 'Y') {
                                    $status =
                                        '<span class="badge bg-yellow">Pending</span>';
                                } elseif ($isi->sts_ajukan == 'N') {
                                    $status =
                                        ' <a href="" class="btn btn-sm btn-flat btn-info badge" data-toggle="modal"
                                        data-target="#modal' .
                                        $isi->id .
                                        ' ">AJUKAN</a>';
                                } elseif ($isi->sts_ajukan == 'R') {
                                    $status =
                                        '<span class="badge bg-blue">Review</span>';
                                } elseif ($isi->sts_ajukan == 'O') {
                                    $status =
                                        '<span class="badge bg-green">Disetujui</span>  ';
                                } elseif ($isi->sts_ajukan == 'P') {
                                    $status =
                                        '<span class="badge bg-yellow">Pending</span>  ';
                                } else {
                                    $status =
                                        '<span class="badge bg-red">Ditolak</span>';
                                } ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?> </td>
                                <td><?= tgl_indo($isi->tanggal) ?></td>
                                <td><?= $isi->overtime ?></td>

                                <td>
                                    <?php if ($isi->overtime == 0) { ?>
                                    <span class="badge ">Tidak memenuhi</span>
                                    <?php } elseif ($isi->overtime < 0) { ?>
                                    <span class="badge ">Tidak memenuhi</span>
                                    <?php } elseif ($isi->overtime > 0) { ?>
                                    <?= $status ?>
                                    <?php } ?>
                                </td>

                                <?php if (
                                    $level == 'administrator' ||
                                    $level == 'admin'
                                ) { ?>
                                <td>

                                    <a href="" class="btn btn-sm btn-flat btn-primary badge" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>"> <i class="fa fa-pencil"> </i></a>
                                </td>
                                <?php } ?>
                                <div class="modal fade" id="modal-<?= $isi->id ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">overtimer</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/overtime/overtime_action.php?act=up">

                                                            <div class="form-group">
                                                                <label for="Deskripsi" class="control-label ">
                                                                    Konfirmasi</label>
                                                                <div>
                                                                    <select name="ajukan"
                                                                        class="form-control chzn-select" tabindex="2">
                                                                        <option value="">Pilih</option>
                                                                        <option value="O">Setuju</option>
                                                                        <option value="R">Review</option>
                                                                        <option value="T">Tolak</option>
                                                                        <option value="N">Kembalikan</option>

                                                                    </select>
                                                                </div>
                                                            </div><!-- /.form-group --><br />
                                                            <input type='hidden' name='id' value='<?= $isi->id ?>'>

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
                                                <h4 class="modal-title">Pengajuan overtime</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/overtime/overtime_action.php?act=up1">

                                                            <div class="form-group">
                                                                <label for="Deskripsi" class="control-label ">
                                                                    Konfirmasi</label>
                                                                <div>
                                                                    <select name="ajukan"
                                                                        class="form-control chzn-select" tabindex="2">
                                                                        <option value="A">Pilih</option>
                                                                        <option value="P">Ya</option>
                                                                        <option value="T">Tidak</option>

                                                                    </select>
                                                                </div>
                                                            </div><!-- /.form-group --><br />
                                                            <input type='hidden' name='id' value='<?= $isi->id ?>'>

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

                </div>
                </tr>
                <?php $no++;
                            }
                            ?>
                </tbody>
                </table>



            </div><!-- /.box-body -->
        </div><!-- /.box -->
        <div class="col-xs-6">
            <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                NOTE*<br>
                Klik Tombol AJUKAN,
                Jika ingin mengajukan overtime<br> </p>
        </div>
    </div>
    </div>


</section><!-- /.content -->

<div class="modal fade" id="modal-tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="input" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/lembur/lembur_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">lembur </h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3> <label for="Level User" class="control-label">Nama lembur</label>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <select name="nama_p" required data-placeholder="Pilih Pegawai ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih Pegawai</option>
                                        <?php foreach (
                                            $db->query(
                                                "select * from t_pengajuan where kode ='L' "
                                            )
                                            as $isi
                                        ) {
                                            echo "<option selected value='$isi->nama'>$isi->nama</option>";
                                        } ?>
                                    </select>
                                </div>
                            </div>

                            <label for="Level User" class="control-label">Tanggal lembur</label>
                            <input type="text" class="form-control pull-right date" name="tanggal"
                                value="<?= date('Y-m-d') ?>" id=""><br />
                            <label for="Level User" class="control-label">Jam mulai lembur</label>
                            <input type="time" class="form-control pull-right" required plscholder="1000000"
                                name="mulai" id=""><br />
                            <label for="Level User" class="control-label">Jam akhir lembur</label>
                            <input type="time" class="form-control pull-right" required plscholder="1000000"
                                name="akhir" id=""><br />
                            <input type="hidden" class="form-control pull-right" value='15000' required
                                plscholder="1000000" name="jumlah" id="">
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