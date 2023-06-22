<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Tambah Data Deposit
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>pengeluaran">Data Deposit</a></li>
        <li class="active">Tambah Deposit</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-lg-12">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Tambah Deposit</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-info btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div>
                <!--'tanggal' => $_POST['tanggal'],
                            'nama_p' => $_POST['nama_p'],
                            'jumlah' => $_POST['jumlah'],
                            'status' => $_POST['status'],
                            'keterangan' => $_POST['keterangan'],*/-->
                <div class="box-body">
                    <form id="input" method="post" class="form-horizontal"
                        action="<?= base_admin() ?>modul/pengeluaran/pengeluaran_action.php?act=in">
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Tanggal</label>
                            <div class="col-lg-4">
                                <input type="text" id="level" readonly value="<?= date(
                                    'Y-m-d'
                                ) ?>" name="tanggal" placeholder="Nama pengeluaran" class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Nama</label>
                            <div class="col-lg-4">
                                <input type="text" id="level" name="nama_p" placeholder="Deposit dana"
                                    class="form-control " required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Jumlah</label>
                            <div class="col-lg-4">
                                <input type="text" id="gapok" name="jumlah" placeholder="1000000" class="form-control "
                                    required>
                            </div>
                        </div><!-- /.form-group -->
                        <div class="form-group ">
                            <label for="Level User" class="control-label col-lg-4">Keterangan</label>
                            <div class="col-lg-4">
                                <input type="text" id="gapok" name="keterangan" placeholder="Keterangan"
                                    class="form-control " required>
                                <input type="hidden" id="gapok" name="status_d" value='1' class="form-control ">
                                <input type="hidden" id="gapok" name="status" value='D' class="form-control ">
                            </div>
                        </div><!-- /.form-group -->

                        <div class=" form-group">
                            <label for="tags" class="control-label col-lg-4">&nbsp;</label>
                            <div class="col-lg-4">
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </div><!-- /.form-group -->
                    </form>
                    <a href="<?= base_index() ?>pengeluaran" class="btn btn-success">Kembali</a>

                </div>
            </div>
        </div>
    </div>

</section><!-- /.content -->