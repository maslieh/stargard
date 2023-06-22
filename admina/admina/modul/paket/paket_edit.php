<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data paket
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>paket">Data paket</a></li>
        <li class="active">Edit paket</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit paket</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/paket/paket_action.php?act=up">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama paket</label>
                            <div class="col-lg-4">
                                <input type="text" id="level" name="level" value="<?= $data_edit->nama ?>"
                                    placeholder="Nama paket" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Gaji Pokok</label>
                            <div class="col-lg-4">
                                <input type="text" id="gapok" name="gapok" value="<?= $data_edit->harga ?>"
                                    placeholder="Gaji Pokok" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Desk / ket</label>
                            <div class="col-lg-4">
                                <select name="id_group" data-placeholder="Pilih paket..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            'select id,tipe from t_tipe '
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->tipe == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->tipe</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->tipe</option>";
                                        }
                                    } ?>
                                </select>
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