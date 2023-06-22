<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data tipe
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>tipe">Data tipe</a></li>
        <li class="active">Edit tipe</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit tipe</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/tipe/tipe_action.php?act=up">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama tipe</label>
                            <div class="col-lg-4">
                                <input type="text" id="level" name="level" value="<?= $data_edit->tipe ?>"
                                    placeholder="Nama tipe" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->

                        <input type="hidden" name="id" value="<?= $data_edit->id ?>">
                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>tipe" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->