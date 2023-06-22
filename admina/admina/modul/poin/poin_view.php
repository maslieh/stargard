<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data poin
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>poin">poin</a></li>
        <li class="active">poin List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="<?= base_index() ?>poin/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Tambah
                    </a>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>No Waranti</th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>No Telepon</th>
                                <th>Nama Kendaraan</th>
                                <th>No Polisi</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            $level = $db->fetch_single_row(
                                'sys_group_users',
                                'id',
                                $_SESSION['level']
                            );
                            if ($level->level == 'administrator') {
                                $dtb = $db->query(
                                    'select * from t_transaksi   '
                                );
                            } elseif ($level->level == 'admin') {
                                $dtb = $db->query(
                                    'select * from t_transaksi   '
                                );
                            } else {
                                $id_sales = $_SESSION['id_user'];
                                $dtb = $db->query(
                                    "select * from t_transaksi where id_sales='$id_sales'  "
                                );
                            }

                            $no = 1;

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->waranti ?></td>
                                <td><?= $isi->nama ?></td>
                                <td><?= $isi->alamat ?></td>
                                <td><?= $isi->tlp ?></td>
                                <td><?= $isi->jns_kendaraan ?></td>
                                <td><?= $isi->no_polisi ?></td>
                                <td>
                                    <?php if ($isi->sts_point == 'N') { ?>
                                    <a href="" class="btn btn-sm btn-info" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>">Klaim Poin</i></a>

                                    <div class="modal fade" id="modal-<?= $isi->id ?>" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/poin/poin_action.php?act=up">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Klaim Poin</h4>
                                                        <div class="modal-body">
                                                            <div class="box-body">
                                                                <label for="Level User" class="control-label">Apakah
                                                                    Anda Ingin Klaim Poin?</label>
                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="50" name="poin" id="">
                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="Y" name="sts_point" id="">
                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="<?= $isi->id ?>" name="id" id="">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger pull-left"
                                                                data-dismiss="modal">Batal</button>
                                                            <input type="submit" class="btn btn-primary" value="Klaim">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <?php } else {echo '<a href="#" disabled class="btn btn-primary btn-flat">Sudah Diklaim</a>';} ?>

                                </td>
                            </tr>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->