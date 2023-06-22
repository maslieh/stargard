<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data inpeksi
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>inpeksi">Data inpeksi</a></li>
        <li class="active">Tambah inpeksi</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah inpeksi</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/inpeksi/inpeksi_action.php?act=in">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Paket</label>
                            <div class="col-lg-4">
                                <select name="id_group" data-placeholder="Pilih paket ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query('select * from t_paket   ')
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->nama</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 1</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi1" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 2</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi2" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 3</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi3" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>inpeksi" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->