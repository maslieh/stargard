<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data bayargaji
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>bayargaji">Data bayargaji</a></li>
        <li class="active">Tambah bayargaji</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah bayargaji</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/bayargaji/bayargaji_action.php?act=in">
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Pegawai</label>
                            <div class="col-lg-10">
                                <select name="id_pegawai" data-placeholder="Pilih  ..." class="form-control chzn-select"
                                    tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query('select * from sys_users ')
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->first_name $isi->first_name  </option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Level User" class="control-label col-lg-2">Tanggal </label>
                            <div class="col-lg-10">
                                <input type="text" id="tgl" name="tgl_bayar" placeholder="2022-01-15"
                                    class="form-control date" required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-2">Bayar/bulan</label>
                            <div class="col-lg-10">
                                <input type="text" id="bayar" name="gaji_bayar" placeholder="1200000"
                                    class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-2">Potongan</label>
                            <div class="col-lg-10">
                                <input type="text" id="potongan" name="potongan" placeholder="1200000"
                                    class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-2">&nbsp;</label>
                            <div class="col-lg-10">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>bayargaji" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->