<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        ABSENSI
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>absensi">absensi</a></li>
        <li class="active">absensi List</li>
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
        <div class="col-xs-12">
            <div class="box">
                <?php date_default_timezone_set('Asia/jakarta'); ?>
                <span>Jam Berjalan Realtime Server</span>
                <center>
                    <h1>WAKTU ABSEN</h1>
                    <?php
                    $tg = date('Y-m-d');
                    $day = date('D', strtotime($tg));
                    $dayList = [
                        'Sun' => 'Minggu',
                        'Mon' => 'Senin',
                        'Tue' => 'Selasa',
                        'Wed' => 'Rabu',
                        'Thu' => 'Kamis',
                        'Fri' => 'Jumat',
                        'Sat' => 'Sabtu',
                    ];
                    $hari = $dayList[$day];
                    $time = date('H:i');
                    $waktu = $db->fetch_custom_single(
                        "select * from t_absen where status='Y' limit 1"
                    );
                    if ($time >= '04:00' && $time <= '10:00') {
                        $masuk = '<span class=" bg-green">Masuk Kerja</span>';
                        $ucap = 'Selamat Datang';
                        $sts = 'M';
                        $sts1 = 'A';
                        $btn =
                            '<input type="submit" class="btn btn-primary" value="Submit">';
                    } elseif (
                        $time >= @$waktu->pulang_awal &&
                        $time <= @$waktu->pulang_akhir
                    ) {
                        $masuk = '<span class="bg-red">Waktu Pulang</span>';
                        $ucap = 'Semangat pulang kerja';
                        $sts = 'P';
                        $sts1 = 'B';
                        $btn =
                            '<input type="submit" class="btn btn-primary" value="Submit">';
                    } elseif (
                        $time >= @$waktu->masuk_akhir &&
                        $time <= @$waktu->pulang_awal
                    ) {
                        $masuk = '<span class="bg-yellow">Pulang awal</span>';
                        $ucap = 'Pulang Lebih Awal?';
                        $sts = 'P';
                        $sts1 = 'B';
                        $btn =
                            '<input type="submit"  class="btn btn-success" value="Submit">';
                    } elseif (
                        $time >= @$waktu->masuk_akhir &&
                        $time <= '22:00'
                    ) {
                        $masuk = '<span class="bg-green">Overtime</span>';
                        $ucap = 'Pulang Telat?';
                        $sts = 'P';
                        $sts1 = 'B';
                        $btn =
                            '<input type="submit"  class="btn bg-maroon btn-warning" value="Submit">';
                    }
                    ?>

                    <h3><?= $masuk ?></h3>
                    <span>
                        <h2 style="font-size:24"><?= $hari ?>,
                            <?= tgl_indo(date('Y-m-d')) ?></h1>
                            <h1 id="jam" style="font-size:24">
                        </h2>
                    </span>
                    <div class="box-header">

                        <form id="input_user" method="post" class="form-horizontal" enctype="multipart/form-data"
                            action="<?= base_admin() ?>modul/absensi/absensi_action.php?act=in">
                            <?php $s = $db->fetch_single_row(
                                'sys_users',
                                'id',
                                $_SESSION['id_user']
                            ); ?>
                            <table border="0">
                                <tr>
                                    <td>
                                        <h3 style="font-size:25"><?= $ucap ?> </h3>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td width="">
                                        <h3 style="font-size:25">
                                            <?= ucwords($s->first_name) ?>
                                            <?= ucwords($s->last_name) ?></h3>
                                    </td>

                                </tr>

                            </table>
                            <input type="hidden" class="form-control pull-right" value="<?= $s->id ?>" name="id" id="">
                            <input type="hidden" class="form-control pull-right" value="<?= date(
                                'Y-m-d'
                            ) ?>" name="tgl" id="">
                            <input type="hidden" class="form-control pull-right" value="<?= $time ?>" name="jam" id="">
                            <input type="hidden" class="form-control pull-right" value="<?= $sts ?>" name="sts" id="">
                            <input type="hidden" class="form-control pull-right" value="<?= $sts1 ?>" name="ket" id="">

                            <br />
                            <div class="form-group">

                                <label>Foto Selfie</label>
                                <div class="col-lg-12">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 150px; height: 100px;">
                                            <img src="../assets/LOGO_BLACK.png" alt="...">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"
                                            style="max-width: 200px; max-height: 150px;"></div>
                                        <div>
                                            <span class="btn btn-default btn-file"><span class="fileinput-new">Select
                                                    image</span> <span class="fileinput-exists">Change</span>
                                                <input type="file" name="foto_user" accept="image/*" required>
                                            </span>
                                            <a href="#" class="btn btn-default fileinput-exists"
                                                data-dismiss="fileinput">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <?= $btn ?>
                                </div>
                            </div><!-- /.form-group -->
                        </form>
                    </div><!-- /.box-header -->
                </center>

            </div><!-- /.box-header -->
            </b></p>

            <script type="text/javascript">
            window.onload = function() {
                jam();
            }

            function jam() {
                var e = document.getElementById('jam'),
                    d = new Date(),
                    h, m, s;
                h = d.getHours();
                m = set(d.getMinutes());
                s = set(d.getSeconds());

                e.innerHTML = h + ':' + m + ':' + s;

                setTimeout('jam()', 1000);
            }

            function set(e) {
                e = e < 10 ? '0' + e : e;
                return e;
            }
            </script>
        </div>
    </div>
    </div>


</section><!-- /.content -->



<div class="modal fade" id="modal-tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="update" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/absensi/setabsen_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">WAKTU ABSEN</h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Waktu Masuk</h3>
                            <label for="Level User" class="control-label">Masuk Awal</label>
                            <input type="time" class="form-control pull-right" name="masuk_awal" id=""><br />
                            <label for="Level User" class="control-label">Masuk Akhir</label>
                            <input type="time" class="form-control pull-right" value="Y" name="masuk_akhir"
                                id=""><br /><br /><br />

                            <h3>Waktu Pulang</h3>
                            <label for="Level User" class="control-label">Pulang Awal</label>
                            <input type="time" class="form-control pull-right" value="<?= $isi->id ?>"
                                name="pulang_awal" id=""><br />
                            <label for="Level User" class="control-label">Pulang Akhir</label>
                            <input type="time" class="form-control pull-right" value="<?= $isi->id ?>"
                                name="pulang_akhir" id=""><br />
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