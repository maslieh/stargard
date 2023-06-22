<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Setting Pengajuan
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>set-pengajuan">set-pengajuan</a></li>
        <li class="active">set-pengajuan List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                        data-target="#modal-tambah"><i class="fa fa-plus"> </i> Tambah</a>

                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Nama</th>
                                <th>Batas</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            $masuk = $db->fetch_custom_single(
                                "select * from t_absen where status='Y' limit 1"
                            );
                            $dtb = $db->query('SELECT * from t_pengajuan  ');

                            $no = 1;

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= ucwords($isi->nama) ?></td>
                                <td><?= $isi->batas ?></td>
                                <td><?= $isi->keterangan ?> </td>
                                <td> <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>"> <i class="fa fa-pencil"> </i></a>
                                    <button class="btn btn-sm btn-flat btn-danger hapus"
                                        data-uri="<?= base_admin() ?>modul/set-pengajuan/set_pengajuan_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i></button>
                                </td>
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
                                                            action="<?= base_admin() ?>modul/set-pengajuan/set_pengajuan_action.php?act=up">
                                                            <div class="form-group">
                                                                <label for="First Name" class="control-label">
                                                                    Nama Pengajuan</label>
                                                                <div class="">
                                                                    <input type="text" id="nama" name="nama"
                                                                        placeholder="First Name"
                                                                        value="<?= $isi->nama ?>" class="form-control">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="batas Name" class="control-label">
                                                                    Batas Pengajuan</label>
                                                                <div class="">
                                                                    <input type="text" id="batas" name="batas"
                                                                        placeholder="First Name"
                                                                        value="<?= $isi->batas ?>" class="form-control">
                                                                    <input type="hidden" name="id"
                                                                        value="<?= $isi->id ?>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Deskripsi">Deskripsi</label>
                                                                <div class="col-col-lg-12">
                                                                    <input type="text" id="keterangan" name="keterangan"
                                                                        value="<?= $isi->keterangan ?>"
                                                                        class="form-control" required>
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
                                    </div>

                                </div>
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
        action="<?= base_admin() ?>modul/set-pengajuan/set_pengajuan_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">SETTING PENGAJUAN</h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3>
                            <label for="Level User" class="control-label">Kode</label>
                            <input type="text" class="form-control pull-right" name="kode" placeholder="Contoh Kode : C"
                                id=""><br />
                            <label for="Level User" class="control-label">Nama Pengajuan</label>
                            <input type="text" class="form-control pull-right" name="nama" placeholder="Contoh  : Cuti"
                                id=""><br />
                            <label for="Level User" class="control-label">Batas pengajuan</label>
                            <input type="text" class="form-control pull-right" name="batas"
                                placeholder="Contoh  : 12 atau 200000 " id=""><br />
                            <label for="Level User" class="control-label">Keterangan</label>
                            <input type="text" class="form-control pull-right" name="keterangan"
                                placeholder="Contoh : Cuti hanya bisa diambil perbulan" id=""><br />
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