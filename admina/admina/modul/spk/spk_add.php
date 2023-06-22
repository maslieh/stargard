<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        spk
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>spk">spk</a></li>
        <li class="active">Tambah spk</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah spk</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal foto_banyak"
                        action="<?= base_admin() ?>modul/spk/spk_action.php?act=in">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No waranti</label>
                            <div class="col-lg-4">
                                <?php
                                $w = $db->fetch_custom_single(
                                    'select max(waranti) as kodeTerbesar  from t_transaksi'
                                );
                                $kode = $w->kodeTerbesar;
                                $urutan = (int) substr($kode, 6, 6);
                                $urutan++;
                                $huruf = 'WRT';
                                $kode = $huruf . sprintf('%06s', $urutan);
                                ?>
                                <input type="text" id="waranti" value="<?= $kode ?>" readonly name="waranti"
                                    placeholder="no waranti" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama</label>
                            <div class="col-lg-4">
                                <input type="text" id="	nama" name="nama" placeholder="nama" class="form-control "
                                    required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Alamat</label>
                            <div class="col-lg-4">
                                <input type="text" id="alamat" name="alamat" placeholder="alamat" class="form-control "
                                    required>
                            </div>
                        </div><!-- /.form-group -->


                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">kontak</label>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        + 62
                                    </div>
                                    <input type="text" id="tlp" name="tlp" placeholder="89892828933"
                                        class="form-control " required>
                                </div>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama Kendaraan</label>
                            <div class="col-lg-4">
                                <input type="text" id="jns_kendaraan" name="jns_kendaraan" placeholder="Nama kendaraan"
                                    class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->

                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. Rangka</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_rangka" name="no_rangka" placeholder="no Rangka"
                                    class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. polisi</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_polisi" name="no_polisi" placeholder="No. Polisi"
                                    class="form-control " required>
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
                                            'select a.id,a.nama,b.tipe,a.harga from  t_paket as a, t_tipe as b where a.tipe=b.id '
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>$isi->nama -  ($isi->tipe) Rp. $isi->harga</option>";
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
                                            "select a.id,a.first_name,a.last_name from sys_users as a, t_jabatan as b where 
                                             a.id_jabatan=b.id_jabatan and b.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>" .
                                            ucwords($isi->first_name) .
                                            '  ' .
                                            ucwords($isi->last_name);
                                        '</option>';
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
                                            "select a.id,a.first_name,a.last_name from sys_users as a, t_jabatan as b where 
                                             a.id_jabatan=b.id_jabatan and b.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>" .
                                            ucwords($isi->first_name) .
                                            '  ' .
                                            ucwords($isi->last_name);
                                        '</option>';
                                    } ?>
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
                                            "select a.id,a.first_name,a.last_name from sys_users as a, t_jabatan as b where 
                                             a.id_jabatan=b.id_jabatan and b.jabatan like '%teknisi%'"
                                        )
                                        as $isi1
                                    ) {
                                        echo "<option value='$isi1->id'>" .
                                            ucwords($isi1->first_name) .
                                            '  ' .
                                            ucwords($isi1->last_name);
                                        '</option>';
                                    } ?>
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
                                            "select a.id,a.first_name,a.last_name from sys_users as a, t_jabatan as b where 
                                             a.id_jabatan=b.id_jabatan and b.jabatan like '%teknisi%'"
                                        )
                                        as $isi
                                    ) {
                                        echo "<option value='$isi->id'>" .
                                            ucwords($isi->first_name) .
                                            '  ' .
                                            ucwords($isi->last_name);
                                        '</option>';
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
                                        echo "<option value='$isi->id'>" .
                                            ucwords($isi->first_name) .
                                            '  ' .
                                            ucwords($isi->last_name);
                                        '</option>';
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">diskon</label>
                            <div class="col-lg-4">
                                <input type="text" id="diskon" name="diskon" placeholder="diskon" class="form-control "
                                    required>
                                <input type="hidden" id="diskon" name="tgl" value="<?= date(
                                    'Y-m-d'
                                ) ?>" placeholder="diskon" class="form-control " required>
                                <input type="hidden" id="diskon" name="sts_point" value="N" placeholder="diskon"
                                    class="form-control " required>
                                <input type="hidden" id="diskon" name="admin" value="<?= $_SESSION[
                                    'id_user'
                                ] ?>" placeholder="diskon" class="form-control " required>

                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>spk" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->