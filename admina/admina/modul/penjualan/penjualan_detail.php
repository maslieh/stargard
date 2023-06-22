<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Data penjualan detail
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>penjualan">Data penjualan detail</a></li>
        <li class="active">Tambah penjualan detail</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah penjualan detail</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>

                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/penjualan/penjualan_action.php?act=in">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No waranti</label>
                            <div class="col-lg-4">
                                <input type="text" id="waranti" value="<?= $data_edit->waranti ?>" readonly
                                    name="waranti" placeholder="no waranti" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama</label>
                            <div class="col-lg-4">
                                <input type="text" id="nama" readonly name="nama" value="<?= $data_edit->nama ?>"
                                    placeholder="nama" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Alamat</label>
                            <div class="col-lg-4">
                                <input type="text" id="alamat" readonly name="alamat" value="<?= $data_edit->alamat ?>"
                                    placeholder="alamat" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">kontak</label>
                            <div class="col-lg-4">
                                <input type="text" id="tlp" readonly name="tlp" value="<?= $data_edit->tlp ?>"
                                    placeholder="Nomor Hp/Wa" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama Kendaraan</label>
                            <div class="col-lg-4">
                                <input type="text" id="jns_kendaraan" readonly name="jns_kendaraan"
                                    value="<?= $data_edit->jns_kendaraan ?>" placeholder="Nama kendaraan"
                                    class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. Rangka</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_rangka" readonly name="no_rangka"
                                    value="<?= $data_edit->no_rangka ?>" placeholder="no Rangka" class="form-control "
                                    required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">No. polisi</label>
                            <div class="col-lg-4">
                                <input type="text" id="no_polisi" name="no_polisi" value="<?= $data_edit->no_polisi ?>"
                                    placeholder="No. Polisi" readonly class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        
                        <div class="form-group">
                            <label for="Deskripsi" class="control-label col-lg-4">Paket Service</label>
                            <div class="col-lg-4">
                                <select name="id_paket" disabled data-placeholder="Pilih Paket Services ..."
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
                            <label for="Deskripsi" class="control-label col-lg-4">Sales</label>
                            <div class="col-lg-4">
                                <select name="id_sales" disabled data-placeholder="Pilih Sales ..."
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
                                            echo "<option value='$isi->id'selected>" .
                                                ucwords($isi->first_name) .
                                                '  ' .
                                                ucwords($isi->last_name);
                                            '</option>';
                                        } else {
                                            echo "<option value='$isi->id'>" .
                                                ucwords($isi->first_name) .
                                                '  ' .
                                                ucwords($isi->last_name);
                                            '</option>';
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">diskon</label>
                            <div class="col-lg-4">
                                <input type="text" id="diskon" name="diskon" readonly placeholder="diskon"
                                    value="<?= $data_edit->diskon ?>" class="form-control " required>


                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>penjualan" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->