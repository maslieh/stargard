<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data jabatan
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>jabatan">Data jabatan</a></li>
        <li class="active">Edit jabatan</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit jabatan</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/jabatan/jabatan_action.php?act=up">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama jabatan</label>
                            <div class="col-lg-4">
                                <input type="text" id="level" name="level" value="<?= $data_edit->jabatan ?>"
                                    placeholder="Nama jabatan" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Gaji Pokok</label>
                            <div class="col-lg-4">
                                <input type="text" id="gapok" name="gapok" value="<?= $data_edit->gapok_jabatan ?>"
                                    placeholder="Gaji Pokok" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Desk / ket</label>
                            <div class="col-lg-4">
                                <input type="text" id="deskripsi" value="<?= $data_edit->ket ?>" name="deskripsi"
                                    placeholder="Deskripsi" class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->

                        <input type="hidden" name="id" value="<?= $data_edit->id_jabatan ?>">
                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>jabatan" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->