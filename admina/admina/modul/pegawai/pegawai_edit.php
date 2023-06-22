<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data pegawai
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>pegawai">Data pegawai</a></li>
        <li class="active">Edit Data pegawai</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">EditData pegawai</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="update" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/pegawai/pegawai_action.php?act=up">
                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2">First Name</label>
                            <div class="col-lg-10">
                                <input type="text" id="first_name" name="first_name"
                                    value="<?= $data_edit->first_name ?>" class="form-control" required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Last Name" class="control-label col-lg-2">Last Name</label>
                            <div class="col-lg-10">
                                <input type="text" id="last_name" name="last_name" value="<?= $data_edit->last_name ?>"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2 ">Tempat Lahir</label>
                            <div class="col-lg-10">
                                <input type="text" id="tmp_lahir" name="temp_lahir"
                                    value="<?= $data_edit->temp_lahir ?>" placeholder="Bekasi" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2  date ">Tanggal Lhir</label>
                            <div class="col-lg-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right"
                                        value="<?= $data_edit->tgl_lahir ?>" id="tgl_lahir" name="tgl_lahir"
                                        id="datepicker">
                                </div>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Agama</label>
                            <div class="col-lg-10">
                                <select name="agama" data-placeholder="Pilih Agama..." class="form-control chzn-select"
                                    tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            'select * from t_agama order by nama asc'
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->agama == $isi->kode) {
                                            echo "<option value='$isi->kode' selected>$isi->nama</option>";
                                        } else {
                                            echo "<option value='$isi->kode'>$isi->nama</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Gender</label>
                            <div class="col-lg-10">
                                <select name="jenkel" data-placeholder="Pilih Gender..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php if ($data_edit->jenkel = 'L') {
                                        echo '<option value="P">Perempuan</option>
                                    <option value="L" selected >Laki-laki</option>';
                                    } else {
                                        echo '<option value="P" selected >Perempuan</option>
                                    <option value="L"  >Laki-laki</option>';
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">Alamat</label>
                            <div class="col-lg-10">
                                <input type="text" id="alamat" name="alamat" value="<?= $data_edit->alamat ?>"
                                    placeholder="Alamat" class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">No Rekening</label>
                            <div class="col-lg-10">
                                <input type="text" id="norek" name="norek" value="<?= $data_edit->norek ?>"
                                    placeholder="BCA 57700812 a/n Ahmad Jaelani" class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">No Telepon / WA</label>
                            <div class="col-lg-10">
                                <input type="text" id="no_tlp" name="no_tlp" value="<?= $data_edit->no_tlp ?>"
                                    placeholder="089898998989" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Email" class="control-label col-lg-2">Email</label>
                            <div class="col-lg-10">
                                <input type="text" id="email" data-rule-email="true" name="email"
                                    value="<?= $data_edit->email ?>" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Foto" class="control-label col-lg-2">Foto</label>
                            <div class="col-lg-10">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput"
                                        style="width: 200px; height: 150px;">
                                        <img src="../../../../upload/back_profil_foto/<?= $data_edit->foto_user ?>">
                                    </div>
                                    <div>
                                        <span class="btn btn-default btn-file"><span class="fileinput-new">Select
                                                image</span> <span class="fileinput-exists">Change</span>
                                            <input type="file" name="foto_user" accept="image/*">
                                        </span>
                                        <a href="#" class="btn btn-default fileinput-exists"
                                            data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>

                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Jabatan</label>
                            <div class="col-lg-10">
                                <select name="id_group" data-placeholder="Pilih Group User..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query('select * from t_jabatan ')
                                        as $isi
                                    ) {
                                        if (
                                            $data_edit->id_jabatan ==
                                            $isi->id_jabatan
                                        ) {
                                            echo "<option value='$isi->id_jabatan' selected>$isi->jabatan</option>";
                                        } else {
                                            echo "<option value='$isi->id_jabatan'>$isi->jabatan</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Cabang</label>
                            <div class="col-lg-10">
                                <select name="jurusan" data-placeholder="Pilih Jurusan..."
                                    class="form-control chzn-select" tabindex="2">

                                    <?php foreach (
                                        $db->query(
                                            'select * from t_cabang order by nama asc'
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->id == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->nama</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->nama</option>";
                                        }
                                    } ?>
                                </select>
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
                    <a href="<?= base_index() ?>pegawai" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->