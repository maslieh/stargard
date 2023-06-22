<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Rekap Absen
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>rekap-absen">rekap-absen</a></li>
        <li class="active">rekap-absen List</li>
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
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="box">
                <div class="box">
                    <div class="box-header">
                        <?php if ($level == 'administrator') { ?>
                        <a href="" class="btn btn-sm btn-flat btn-primary " data-toggle="modal"
                            data-target="#modal-tambah"><i class="fa fa-plus"> </i> ABSEN</a>
                        <?php } ?>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="dtb_manual" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width:25px" align="center">No</th>
                                    <th>Nama</th>
                                    <th>Tanggal</th>
                                    <th>Waktu Masuk</th>
                                    <th>Waktu Pulang</th>
                                    <th>Status Masuk</th>
                                    <th>Status Pulang</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $masuk = $db->fetch_custom_single(
                                    "select * from t_absen where status='Y' limit 1"
                                );
                                $idp = $_SESSION['id_user'];
                                $lvl = $_SESSION['level'];
                                $dat = $db->fetch_custom_single(
                                    "select *from sys_group_users where id=$lvl "
                                );
                                $awal = date('Y-m-d');
                                $akhir = date('Y-m-d');
                                //   and tanggal BETWEEN '$awal' and '$akhir'
                                if ($dat->level == 'administrator') {
                                    $dtb = $db->query(
                                        "SELECT id,waktu as masuk,tanggal,id_pegawai from t_presensi where status='M' group by id,tanggal order by tanggal DESC"
                                    );
                                } elseif ($dat->level == 'admin') {
                                    $dtb = $db->query(
                                        "SELECT a.id_pegawai, b.first_name, b.last_name, b.foto_user,a.tanggal FROM 
                                    sys_users as b, t_presensi as a
                                    WHERE b.id=a.id_pegawai and b.id=c.id_pegawai    group by a.id_pegawai,a.tanggal ORDER by a.tanggal DESC
                                    ",
                                        $limit
                                    );
                                } else {
                                    $dtb = $db->query(
                                        "SELECT a.id_pegawai, b.first_name, b.last_name, b.foto_user,a.tanggal,a.masuk,c.pulang FROM 
                                    sys_users as b, (SELECT tanggal, waktu as masuk, id_pegawai FROM t_presensi where status='M') as a, 
                                    (SELECT tanggal as tglp, waktu as pulang, id_pegawai FROM t_presensi where status='P') as c 
                                    WHERE b.id=a.id_pegawai and b.id=c.id_pegawai  and a.id_pegawai='$idp' group by a.id_pegawai,a.tanggal ORDER by a.tanggal DESC
                                         "
                                    );
                                }

                                foreach ($dtb as $isi) {

                                    $tg = $isi->tanggal;
                                    $idpeg = $isi->id_pegawai;
                                    $ppol = $db->fetch_custom_single(
                                        "SELECT waktu as pulang,tanggal from t_presensi where id_pegawai='$idpeg'  and tanggal='$tg'
                                         and status='P'  group by id,tanggal order by tanggal DESC"
                                    );
                                    $nama = $db->fetch_custom_single(
                                        "SELECT *from sys_users where id='$idpeg'"
                                    );

                                    $id_p = $isi->id_pegawai;

                                    @$wkt = $db->fetch_custom_single(
                                        "select * from t_absen where status='Y'"
                                    );

                                    if (@$isi->masuk >= @$wkt->masuk_akhir) {
                                        $ss =
                                            '<span class=" badge bg-red">TELAT</span>';
                                    } else {
                                        $ss =
                                            '<span class=" badge bg-green">ONTIME</span>';
                                    }

                                    @$pulang = date(
                                        'H:i',
                                        strtotime($ppol->pulang)
                                    );
                                    @$pulang_akhir = date(
                                        'H:i',
                                        strtotime($wkt->pulang_akhir)
                                    );
                                    $pulang_awal = date(
                                        'H:i',
                                        strtotime(@$wkt->pulang_awal)
                                    );

                                    if ($pulang <= $pulang_akhir) {
                                        $sss =
                                            '<span class=" badge bg-green">ONTIME</span>';
                                    } elseif ($pulang <= $pulang_awal) {
                                        $sss =
                                            '<span class=" badge bg-green">Pulang Cepat</span>';
                                    } else {
                                        $sss =
                                            '<span class=" badge bg-info">OVERTIME</span>';
                                    }
                                    ?><tr id="line_<?= $isi->id ?>">
                                    <td align="center"><?= $no ?></td>
                                    <td><?= ucwords(
                                        $nama->first_name
                                    ) ?> <?= ucwords($nama->last_name) ?></td>
                                    <td><?= $isi->tanggal ?></td>
                                    <td><?= $isi->masuk ?> </td>
                                    <td><?= @$ppol->pulang ?> </td>
                                    <td><?= $ss ?> </td>
                                    <td><?= $sss ?> </td>

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
        <div class="row">
            <div class="col-xs-12 col-md-6">
                <div class="box">
                    <div class="box-header">
                        <h3>histori Absen Masuk</h3>

                        <hr />
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="dtb_manual3" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width:25px" align="center">No</th>
                                    <th>Langgal</th>
                                    <th>Jam Masuk</th>
                                    <th>Nama</th>
                                    <?php if ($level == 'administrator') { ?>
                                    <th>Aksi</th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $limit = 10;
                                $search = '';
                                $masuk = $db->fetch_custom_single(
                                    "select * from t_absen where status='Y' limit 1"
                                );
                                $level = $dat->level;
                                if ($dat->level == 'administrator') {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='M' order by a.tanggal DESC "
                                    );
                                } elseif ($dat->level == 'admin') {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user  from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='M' order by a.tanggal DESC "
                                    );
                                } else {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user  from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='M' AND a.id_pegawai='$idp' order by a.tanggal DESC "
                                    );
                                }
                                $no = 1;

                                foreach (
                                    $dtb
                                    as $isi1
                                ) { ?><tr id="line_<?= $isi1->ida ?>">
                                    <td align="center"><?= $no ?></td>
                                    <td><?= $isi1->tanggal ?></td>
                                    <td><?= $isi1->waktu ?></td>
                                    <td><?= $isi1->first_name ?> <?= $isi1->last_name ?></td>
                                    <?php if ($level == 'administrator') { ?>
                                    <td>
                                        <a href="#" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                            data-target="#modal-defaultss-<?= $isi1->ida ?>">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                            data-target="#modal-default-<?= $isi1->ida ?>">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <a href="#" type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                            data-target="#modal-defaultsh-<?= $isi1->ida ?>">
                                            <i class="fa fa-trash"></i>
                                        </a>



                                        <div class="modal fade" id="modal-defaultsh-<?= $isi1->ida ?>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">DATA HAPUS </h4>
                                                    </div>

                                                    <div class="modal-body" align='center'>
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/rekap-absen/rekap_action.php?act=hapus1">
                                                            <input type="hidden" class="form-control pull-right date"
                                                                required name="id" value="<?= $isi1->ida ?>" id="">
                                                            <label>Apakah adn ingin menghapus data ini?</label>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="Hapus">
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>


                                        <div class="modal fade" id="modal-defaultss-<?= $isi1->ida ?>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">EDIT masuk </h4>
                                                    </div>

                                                    <div class="modal-body" align='center'>
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/rekap-absen/rekap_action.php?act=masuk">
                                                            <input type="hidden" class="form-control pull-right date"
                                                                required name="id" value="<?= $isi1->ida ?>" id="">
                                                            <div class="form-group">
                                                                <div class="col-lg-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">Tanggal masuk
                                                                            &nbsp;&nbsp;</label>
                                                                        <input type="text"
                                                                            class="form-control pull-right date"
                                                                            required name="tanggal"
                                                                            value="<?= $isi1->tanggal ?>" id="">
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group --><br>


                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">JAM PULANG
                                                                            &nbsp;&nbsp;</label>
                                                                        <input type="time" name="jam"
                                                                            value="<?= $isi1->waktu ?>"
                                                                            class="form-control" required name="jam"
                                                                            id="">
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group --><br>
                                                            <div class="form-group">
                                                                <div class="col-lg-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">Status ?
                                                                            &nbsp;&nbsp;</label>
                                                                        <select name="sts" required
                                                                            data-placeholder="Pilih ..."
                                                                            class="form-control pull-right"
                                                                            tabindex="2">
                                                                            <option value="">Pilih</option>
                                                                            <option value="M" selected>Masuk</option>
                                                                            <option value="P">Pulang</option>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group -->
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

                                        <!-- ////////////////////////////////////////////////////////////////////-->
                                        <div class="modal fade" id="modal-default-<?= $isi1->ida ?>">

                                            <form id="update" method="post" class="form-horizontal"
                                                action="<?= base_admin() ?>modul/booking/booking_action.php?act=up2">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">Ubah Status </h4>
                                                        </div>
                                                        <div class="modal-body" align='center'>
                                                            <div class="form-group">
                                                                <div class="col-lg-10">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <div class="fileinput-preview thumbnail"
                                                                            data-trigger="fileinput"
                                                                            style="width: 300px; height: 300px;">
                                                                            <img style="width: 300px; height: 300px;"
                                                                                src="<?= base_url() ?>upload/absensi/<?= $isi1->foto_user ?>">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default pull-left"
                                                                data-dismiss="modal">Batal</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                    <?php } ?>
                                </tr>
                                <?php $no++;}
                                ?>
                            </tbody>
                        </table>



                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
            <div class="col-xs-12 col-md-6">
                <div class="box">
                    <div class="box-header">
                        <h3>histori Absen Pulang</h3>

                        <hr />
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="dtb_manual2" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width:25px" align="center">No</th>
                                    <th>Langgal</th>
                                    <th>Jam Masuk</th>
                                    <th>Nama</th> <?php if (
                                        $level == 'administrator'
                                    ) { ?>
                                    <th>aksi</th><?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $limit = 10;
                                $search = '';
                                $masuk = $db->fetch_custom_single(
                                    "select * from t_absen where status='Y' limit 1"
                                );
                                $dtb = $db->query(
                                    "SELECT * from t_presensi where status='P' "
                                );
                                $dat->level;
                                if ($dat->level == 'administrator') {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='P' order by a.tanggal DESC "
                                    );
                                } elseif ($dat->level == 'admin') {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='P' order by a.tanggal DESC  "
                                    );
                                } else {
                                    $dtb = $db->query(
                                        "SELECT *,a.id as ida,a.foto_user from t_presensi as a,sys_users as b where a.id_pegawai=b.id AND a.status='P' AND a.id_pegawai=$idp order by a.tanggal DESC "
                                    );
                                }
                                $no = 1;

                                foreach (
                                    $dtb
                                    as $isi
                                ) { ?><tr id="line_<?= $isi->id ?>">
                                    <td align="center"><?= $no ?></td>
                                    <td><?= $isi->tanggal ?></td>
                                    <td><?= $isi->waktu ?></td>
                                    <td><?= $isi->first_name ?> <?= $isi->last_name ?></td>
                                    <?php if (
                                        $level == 'administrator'
                                    ) { ?> <td>

                                        <a href="#" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                            data-target="#modal-defaults-<?= $isi->ida ?>">
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                            data-target="#modal-default-<?= $isi->ida ?>">
                                            <i class="fa fa-eye"></i>
                                        </button>
                                        <a href="#" type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                            data-target="#modal-defaultsh-<?= $isi->ida ?>">
                                            <i class="fa fa-trash"></i>
                                        </a>



                                        <div class="modal fade" id="modal-defaultsh-<?= $isi->ida ?>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">DATA HAPUS </h4>
                                                    </div>

                                                    <div class="modal-body" align='center'>
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/rekap-absen/rekap_action.php?act=hapus">
                                                            <input type="hidden" class="form-control pull-right date"
                                                                required name="id" value="<?= $isi->ida ?>" id="">
                                                            <label>Apakah adn ingin menghapus data ini?</label>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="Hapus">
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>


                                        <div class="modal fade" id="modal-defaults-<?= $isi->ida ?>">


                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">EDIT PULANG </h4>
                                                    </div>
                                                    <div class="modal-body" align='center'>
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/rekap-absen/rekap_action.php?act=pulang">
                                                            <input type="hidden" class="form-control pull-right date"
                                                                required name="id" value="<?= $isi->ida ?>" id="">
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">Tanggal
                                                                            PULANG&nbsp;&nbsp;
                                                                        </label>
                                                                        <input type="text"
                                                                            class="form-control pull-right date"
                                                                            required name="tanggal"
                                                                            value="<?= $isi->tanggal ?>" id="">
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group --><br>


                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">JAM PULANG
                                                                            &nbsp;&nbsp;</label>
                                                                        <input type="time" name="jam"
                                                                            value="<?= $isi->waktu ?>"
                                                                            class="form-control" required name="jam"
                                                                            id="">
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group --><br>
                                                            <div class="form-group">
                                                                <div class="col-md-12">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <label for="Level User"
                                                                            class="control-label">STATUS ?
                                                                            &nbsp;&nbsp;</label>
                                                                        <select name="sts" required
                                                                            data-placeholder="Pilih ..."
                                                                            class="form-control pull-right"
                                                                            tabindex="2">
                                                                            <option value="">Pilih</option>
                                                                            <option value="M">Masuk</option>
                                                                            <option value="P" selected>Pulang</option>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group -->
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

                                        <!-- ////////////////////////////////////////////////////////////////////-->
                                        <div class="modal fade" id="modal-default-<?= $isi->ida ?>">

                                            <form id="update" method="post" class="form-horizontal"
                                                action="<?= base_admin() ?>modul/booking/booking_action.php?act=up2">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">Ubah Status </h4>
                                                        </div>
                                                        <div class="modal-body" align='center'>
                                                            <div class="form-group">
                                                                <div class="col-lg-10">
                                                                    <div class="fileinput fileinput-new"
                                                                        data-provides="fileinput">
                                                                        <div class="fileinput-preview thumbnail"
                                                                            data-trigger="fileinput"
                                                                            style="width: 300px; height: 300px;">
                                                                            <img style="width: 300px; height: 300px;"
                                                                                src="<?= base_url() ?>upload/absensi/<?= $isi->foto_user ?>">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.form-group -->
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default pull-left"
                                                                data-dismiss="modal">Batal</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                    <?php } ?>
                                </tr>
                                <?php $no++;}
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
        action="<?= base_admin() ?>modul/rekap-absen/rekap_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">TAMBAH ABSEN MASUK DAN PULANG </h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3> <label for="Level User" class="control-label">Nama pegawai</label>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <select name="id_pegawai" required data-placeholder="Pilih ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih</option>
                                        <?php foreach (
                                            $db->query(
                                                "select * from sys_users where id_jabatan !='3'"
                                            )
                                            as $isi
                                        ) {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        } ?>
                                    </select>
                                </div>
                            </div>


                            <label for="Level User" class="control-label">Tanggal Masuk</label>
                            <input type="text" class="form-control pull-right date" required name="tanggal" id=""><br />
                            <label for="Level User" class="control-label">Waktu</label>
                            <input type="time" class="form-control pull-right" required name="waktu" id=""><br />
                            <label for="Level User" class="control-label">Absen Masuk atu Pulang ?</label>
                            <select name="sts" required data-placeholder="Pilih ..." class="form-control pull-right"
                                tabindex="2">
                                <option value="">Pilih</option>
                                <option value="M">Masuk</option>
                                <option value="P">Pulang</option>

                            </select>
                            <br /> <br />
                        </div>
                    </div>

                    <h6> <span class="badge bg-red">NOTE :</span></h6>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Batal</button>
                        <input type="submit" class="btn btn-primary" value="simpan">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>