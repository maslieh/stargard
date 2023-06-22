<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data booking
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>booking">booking</a></li>
        <li class="active">Edit booking</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Edit booking</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal foto_banyak"
                        action="<?= base_admin() ?>modul/booking/booking_action.php?act=up">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No waranti</label>
                            <div class="col-lg-4">
                                <input type="text" id="waranti" value="<?= $data_edit->waranti ?>" readonly
                                    name="waranti" placeholder="no waranti" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="First Name" class="control-label col-lg-4  date ">Tanggal booking</label>
                            <div class="col-lg-4">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control pull-right" id="tgl_booking"
                                        name="tgl_booking" value="<?= $data_edit->tgl_booking ?>" id="datepicker">
                                </div>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama</label>
                            <div class="col-lg-4">
                                <input type="text" id="	nama" name="nama" value="<?= $data_edit->nama ?>"
                                    placeholder="nama" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Alamat</label>
                            <div class="col-lg-4">
                                <input type="text" id="alamat" name="alamat" value="<?= $data_edit->alamat ?>"
                                    placeholder="alamat" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->


                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">kontak</label>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        + 62
                                    </div>
                                    <input type="text" id="tlp" name="tlp" value="<?= $data_edit->tlp ?>"
                                        placeholder="89892828933" class="form-control " required>
                                </div>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama Kendaraan</label>
                            <div class="col-lg-4">
                                <input type="text" id="jns_kendaraan" name="jns_kendaraan"
                                    value="<?= $data_edit->jns_kendaraan ?>" placeholder="Nama kendaraan"
                                    class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. Rangka</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_rangka" name="no_rangka" value="<?= $data_edit->no_rangka ?>"
                                    placeholder="no Rangka" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. polisi</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_polisi" name="no_polisi" value="<?= $data_edit->no_polisi ?>"
                                    placeholder="No. Polisi" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->


                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Paket Service</label>
                            <div class="col-lg-4">
                                <select name="id_paket" data-placeholder="Pilih Paket Services ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            'SELECT p.id as idt, p.nama,p.harga,h.tipe FROM  t_paket as p, t_tipe as h where  p.tipe=h.id;'
                                        )
                                        as $isi
                                    ) {
                                        if (
                                            $data_edit->id_teknisi == $isi->idt
                                        ) {
                                            echo "<option value='$isi->idt' selected>$isi->nama - $isi->tipe (Rp. $isi->harga)</option>";
                                        } else {
                                            echo "<option value='$isi->idt'>$isi->nama - $isi->tipe (Rp. $isi->harga)</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 1</label>
                            <div class="col-lg-4">
                                <select name="tek1" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from sys_users where id_jabatan='2'"
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->tek1 == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 2</label>
                            <div class="col-lg-4">
                                <select name="tek2" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from sys_users where id_jabatan='2'"
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->tek2 == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 3</label>
                            <div class="col-lg-4">
                                <select name="tek3" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from sys_users where id_jabatan='2'"
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->tek3 == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Teknisi 4</label>
                            <div class="col-lg-4">
                                <select name="tek4" data-placeholder="Pilih Teknisi ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select * from sys_users where id_jabatan='2'"
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->tek4 == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Sales</label>
                            <div class="col-lg-4">
                                <select name="id_sales" data-placeholder="Pilih Sales ..."
                                    class="form-control chzn-select" tabindex="2">
                                    <option value=""></option>
                                    <?php foreach (
                                        $db->query(
                                            "select a.id,a.first_name,a.last_name from sys_users as a, t_jabatan as b where 
                                             a.id_jabatan=b.id_jabatan and b.jabatan like '%sales%'"
                                        )
                                        as $isi
                                    ) {
                                        if ($data_edit->id_sales == $isi->id) {
                                            echo "<option value='$isi->id' selected>$isi->first_name $isi->last_name</option>";
                                        } else {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Status Booking</label>
                            <div class="col-lg-4">
                                <select name="sts_book" data-placeholder="Pilih ..." class="form-control chzn-select"
                                    tabindex="2">
                                    <option value="N">Tidak</option>
                                    <option value="Y">Ya</option>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Booking</label>
                            <div class="col-lg-4">
                                <input type="text" id="booking" name="booking" value="<?= $data_edit->booking ?>"
                                    placeholder="no Rangka" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" disabled class="control-label col-lg-4">diskon</label>
                            <div class="col-lg-4">
                                <input type="text" id="diskon" name="diskon" value="<?= $data_edit->diskon ?>"
                                    placeholder="diskon" class="form-control " required>
                                <input type="hidden" id="diskon" name="tgl" value="<?= date(
                                    'Y-m-d'
                                ) ?>" placeholder="diskon" class="form-control " required>
                                <input type="hidden" id="diskon" name="sts_point" value="N" placeholder="diskon"
                                    class="form-control " required>
                                <input type="hidden" id="diskon" name="admin" value="<?= $_SESSION[
                                    'id_user'
                                ] ?>" placeholder="diskon" class="form-control " required>
                                <input type="hidden" name="id" value="<?= $data_edit->id ?>">
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>booking" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->