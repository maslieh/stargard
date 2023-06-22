<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data sales
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>sales">Data sales</a></li>
        <li class="active">Tambah Data sales</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah Data sales</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <div class="alert alert-danger user_exist" style="display:none">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>Maaf Username Sudah Terdaftar</strong>
                    </div>
                    <form id="input_user" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/sales/sales_action.php?act=in">
                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">First Name</label>
                            <div class="col-lg-10">
                                <input type="text" id="first_name" name="first_name" placeholder="First Name"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Last Name" class="control-label col-lg-2">Last Name</label>
                            <div class="col-lg-10">
                                <input type="text" id="last_name" name="last_name" placeholder="Last Name"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Agama</label>
                            <div class="col-lg-10">
                                <select name="agama" data-placeholder="Pilih Agama..." class="form-control chzn-select"
                                    tabindex="2">
                                    <option value=""></option>
                                    <option value="I">Islam</option>
                                    <option value="K">Katolik</option>
                                    <option value="P">Protestan</option>
                                    <option value="B">Budha</option>
                                    <option value="H">Hindu</option>
                                    <option value="KH">Khonghuchu</option>
                                    <option value="L">Lainnya</option>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Gender</label>
                            <div class="col-lg-10">
                                <select name="jenkel" data-placeholder="Pilih Gender..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <option value="P">Perempuan</option>
                                    <option value="L">Laki-laki</option>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">Tempat Lahir</label>
                            <div class="col-lg-10">
                                <input type="text" id="tmp_lahir" name="tmp_lahir" placeholder="Bekasi"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2  date ">Tanggal Lhir</label>
                            <div class="col-lg-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right" id="tgl_lahir" name="tgl_lahir"
                                        id="datepicker">
                                </div>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">Alamat</label>
                            <div class="col-lg-10">
                                <input type="text" id="alamat" name="alamat" placeholder="Alamat" class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">No Telepon / WA</label>
                            <div class="col-lg-10">
                                <input type="text" id="no_tlp" name="no_tlp" placeholder="089898998989"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Email" class="control-label col-lg-2">Email</label>
                            <div class="col-lg-10">
                                <input type="text" id="email" data-rule-email="true" name="email" placeholder="Email"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Username" class="control-label col-lg-2">No Rek</label>
                            <div class="col-lg-10">
                                <input type="text" id="norek" name="norek" placeholder="BCA 57700812 a/n Ahmad Jaelani"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-label col-lg-2">Foto</label>
                            <div class="col-lg-10">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                        <img data-src="holder.js/100%x100%" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                        style="max-width: 200px; max-height: 150px;"></div>
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
                        </div>

                        <div class="form-group">
                            <label for="Username" class="control-label col-lg-2">Username</label>
                            <div class="col-lg-10">
                                <input type="text" id="username" name="username" placeholder="Username"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Password" class="control-label col-lg-2">Password</label>
                            <div class="col-lg-10">
                                <input type="password" id="password_baru" name="password_baru" placeholder="Password"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Password" class="control-label col-lg-2">Confirm Password</label>
                            <div class="col-lg-10">
                                <input type="password" id="password_confirm" name="password_confirm"
                                    placeholder="Password" class="form-control">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Jabatan</label>
                            <div class="col-lg-10">
                                <select name="id_jabatan" data-placeholder="Pilih Jabatan ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from t_jabatan where jabatan like '%sales%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id_jabatan'>$isi->jabatan</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Group User</label>
                            <div class="col-lg-10">
                                <select name="id_group" data-placeholder="Pilih Group User ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from sys_group_users where id !='1' and level like '%sales%' "
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->level</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Group User" class="control-label col-lg-2">Cabang</label>
                            <div class="col-lg-10">
                                <select name="jurusan" data-placeholder="Pilih Cabang ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            'select * from t_cabang order by nama asc '
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->nama</option>";
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-2   ">Nama Dealer</label>
                            <div class="col-lg-10">
                                <input type="text" id="dealer" name="dealer" placeholder="Honda Cibubur"
                                    class="form-control">
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="aktif" class="control-label col-lg-2">aktif</label>
                            <div class="col-lg-10">
                                <input name="aktif" class="make-switch" type="checkbox" checked>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-2">&nbsp;</label>
                            <div class="col-lg-10">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>sales" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->