<?php $data_edit = $db->fetch_single_row('sys_users', 'id', $path_id);
$date = $data_edit->tgl_lahir;
if ($jenkel = 'L') {
    $jk = 'Laki-laki';
} else {
    $jk = 'Perempuan';
}

$id_cab = $data_edit->kode_jurusan;
$id_jab = $data_edit->id_jabatan;
$s = $db->fetch_single_row('t_cabang', 'id', $id_cab);
$ss = $db->fetch_single_row('t_jabatan', 'id_jabatan', $id_jab);
if ($date = null) {
    $tgl = tgl_indo($date);
} else {
    $tgl = 'Belum input';
}
?>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        View Profil
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>profil">Profil</a></li>
        <li class="active">Profil</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box" style="padding-bottom:30px;padding-left:10px">
                <div class="box-header">
                    <h3 class="box-title">Profil <?= ucwords(
                        $data_edit->username
                    ) ?></h3>

                </div><!-- /.box-header -->
                <span class="foto_profil"><img src="../../../../upload/back_profil_foto/<?= $data_edit->foto_user ?>"
                        class="img-thumbnail"></span>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">

                        <tbody>
                            <tr>
                                <th class="col-md-2">Username</th>
                                <td><?= $data_edit->username ?></td>
                            </tr>
                            <tr>
                                <th>Nama Lengkap</th>
                                <td><?= ucwords(
                                    $data_edit->first_name
                                ) ?> <?= ucwords($data_edit->last_name) ?></td>
                            </tr>
                            <tr>
                                <th>Tempat, Tgl Lahir</th>
                                <td><?= ucwords(
                                    $data_edit->temp_lahir
                                ) ?>, <?= $tgl ?></td>
                            </tr>
                            <tr>
                                <th>Jenis Kelamin</th>
                                <td><?= ucwords($jk) ?></td>
                            </tr>
                            <tr>
                                <th>Alamat</th>
                                <td><?= ucwords($data_edit->alamat) ?></td>
                            </tr>
                            <tr>
                                <th>Nomor HP</th>
                                <td><?= ucwords($data_edit->no_tlp) ?></td>
                            </tr>
                            <tr>
                                <th>Cabang</th>
                                <td><?= ucwords($s->nama) ?></td>
                            </tr>
                            <tr>
                                <th>Jabatan</th>
                                <td><?= ucwords($ss->jabatan) ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div><!-- /.box-body -->

            </div><!-- /.box -->
        </div>
    </div>

</section><!-- /.content -->