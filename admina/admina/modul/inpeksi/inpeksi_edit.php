<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data inpeksi
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>inpeksi">Data inpeksi</a></li>
        <li class="active">Edit inpeksi</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit inpeksi</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/inpeksi/inpeksi_action.php?act=up">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama inpeksi</label>
                            <div class="col-lg-4">
                                <select name="id_paket" data-placeholder="Paket..." class="form-control chzn-select"
                                    tabindex="2">

                                    <?php foreach (
                                        $db->query(
                                            'select * from t_paket order by nama asc'
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->id_paket == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->nama</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->nama</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama inpeksi</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi1" data-placeholder="Pilih Teknisi..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        if (
                                            $data_edit->id_teknisi1 == $isi->id
                                        ) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama inpeksi</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi2" data-placeholder="Pilih Teknisi..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        if (
                                            $data_edit->id_teknisi2 == $isi->id
                                        ) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama inpeksi</label>
                            <div class="col-lg-4">
                                <select name="id_teknisi3" data-placeholder="Pilih Teknisi..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option></option>
                                    <?php foreach (
                                        $db->query(
                                            "SELECT s.id,s.first_name, s.last_name FROM sys_users as s,t_jabatan as j where j.id_jabatan=s.id_jabatan and j.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        if (
                                            $data_edit->id_teknisi3 == $isi->id
                                        ) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
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
                    <a href="<?= base_index() ?>inpeksi" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->