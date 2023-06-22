<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data Cabang
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>cabang">Data Cabang</a></li>
        <li class="active">Edit Cabang</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit Cabang</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/cabang/cabang_action.php?act=up">
                        <div class="form-group">
                            <label for="Level User" class="control-label col-lg-2">Nama Cabang</label>
                            <div class="col-lg-10">
                                <input type="text" id="level" name="level" value="<?= $data_edit->nama ?>"
                                    class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-2">Desk / Ket</label>
                            <div class="col-lg-10">
                                <input type="text" id="deskripsi" name="deskripsi" value="<?= $data_edit->deskripsi ?>"
                                    class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->

                        <input type="hidden" name="id" value="<?= $data_edit->id ?>">
                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-2">&nbsp;</label>
                            <div class="col-lg-10">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>cabang" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->