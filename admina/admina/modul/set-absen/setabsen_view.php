<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data set-absen
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>set-absen">set-absen</a></li>
        <li class="active">set-absen List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="" class="btn btn-sm btn-info" data-toggle="modal" data-target="#modal-tambah">Tambah</a>

                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Waktu masuk</th>
                                <th>Waktu Pulang</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';

                            $dtb = $db->query('select * from t_absen   ');

                            $no = 1;

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->masuk_awal ?> - <?= $isi->masuk_akhir ?></td>
                                <td><?= $isi->pulang_awal ?> - <?= $isi->pulang_akhir ?></td>
                                <td><?= $isi->status ?> </td>
                                <td>

                                    <a href="" class="btn btn-sm btn-flat btn-info" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>">Ubah</i></a>

                                    <div class="modal fade" id="modal-<?= $isi->id ?>" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/set-absen/setabsen_action.php?act=upt">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">WAKTU ABSEN</h4>
                                                        <div class="modal-body">
                                                            <div class="box-body">
                                                                <label for="Level User" class="control-label">Apakah
                                                                    Anda Ingin aktifkan waktu Absen?</label>
                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="Y" name="status" id="">
                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="<?= $isi->id ?>" name="id" id="">
                                                            </div>
                                                        </div>
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

                                    <button class="btn btn-sm btn-danger btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/set-absen/setabsen_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>
                                </td>
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
    <form id="update" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/set-absen/setabsen_action.php?act=in">
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