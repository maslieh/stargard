<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Histori Reward klaim poin
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>poin">Histori</a></li>
        <li class="active">Histori </li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">

        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <div class="box-body table-responsive">
                        <table id="dtb_manual" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th style="width:25px" align="center">No</th>
                                    <th>POIN</th>
                                    <th>X (Rp)</th>
                                    <th>Jumlah (Rp)</th>
                                    <th style="width:25px">Status</th>
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
                                        'select count(id) as tot,id_sales,sts_point,sts_klaim  from t_transaksi group by id_sales '
                                    );
                                } elseif ($level->level == 'admin') {
                                    $dtb = $db->query(
                                        'select count(id) as tot,id_sales,sts_point,sts_klaim  from t_transaksi group by id_sales '
                                    );
                                } else {
                                    $id_sales = $_SESSION['id_user'];
                                    $dtb = $db->query(
                                        "select count(id) as tot,id_sales,sts_point,sts_klaim  from t_transaksi where  id_sales='$id_sales' group by id_sales  "
                                    );
                                }

                                $no = 1;

                                foreach (
                                    $dtb
                                    as $isi
                                ) { ?><tr id="line_<?= $isi->id ?>">
                                    <td align="center"><?= $no ?></td>
                                    <td><?= $isi->tot * 10 ?></td>
                                    <td>Rp. 1000 </td>
                                    <td>Rp. <?= number_format(
                                        $isi->tot * 10 * 1000,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></td>
                                    <td>
                                        <?php if (
                                            $isi->tot * 10 >= '300' &&
                                            $isi->sts_klaim == 'N'
                                        ) { ?>
                                        <a href="" class="btn btn-sm btn-info" data-toggle="modal"
                                            data-target="#modal-<?= $isi->id_sales ?>">Klaim Poin</i></a>

                                        <div class="modal fade" id="modal-<?= $isi->id_sales ?>" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <form id="update" method="post" class="form-horizontal"
                                                action="<?= base_admin() ?>modul/reward/reward_action.php?act=up">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title">Cairkan Poin</h4>
                                                            <div class="modal-body">
                                                                <div class="box-body">
                                                                    <label for="Level User" class="control-label">Apakah
                                                                        Anda Ingin Cairkan Poin?</label><br />
                                                                    <hr />
                                                                    <p> <b>Poin Anda:&nbsp;&nbsp;&nbsp;
                                                                            <?= $tot =
                                                                                $isi->tot *
                                                                                10 ?> * 1000 = Rp.
                                                                            <?= number_format(
                                                                                $isi->tot *
                                                                                    10 *
                                                                                    1000,
                                                                                2,
                                                                                ',',
                                                                                '.'
                                                                            ) ?>
                                                                        </b></p>
                                                                    <p></p>
                                                                    <input type="hidden" class="form-control pull-right"
                                                                        value="<?= $isi->tot *
                                                                            10 ?>" name="poin" id="">
                                                                    <input type="hidden" class="form-control pull-right"
                                                                        value="<?= date(
                                                                            'Y-m-d'
                                                                        ) ?>" name="tgl" id="">

                                                                    <input type="hidden" class="form-control pull-right"
                                                                        value="<?= $isi->id_sales ?>" name="id_sales"
                                                                        id="">
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="Cairkan">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        </a><?php } elseif (
                                            $isi->tot * 10 >= '10' &&
                                            $isi->sts_klaim == 'Y'
                                        ) { ?>
                                        <a href="#" disabled class="btn btn-success btn-flat">Sudah Dicairkan
                                            <?php } else { ?>
                                            <a href="#" disabled class="btn btn-danger btn-flat">Poin Kurang...
                                                <?php } ?>
                                    </td>
                                </tr>
                                <?php $no++;}
                                ?>
                            </tbody>
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box-header -->
            </div>
        </div>
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3><label>Histori</label></h3>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual2" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>POIN</th>
                                <th>Jumlah (Rp)</th>
                                <th>Tanggal</th>
                                <th style="width:300px">Status</th>
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
                                $dtb = $db->query('select * from t_poin ');
                            } elseif ($level->level == 'admin') {
                                $dtb = $db->query('select * from t_poin  ');
                            } else {
                                $id_sales = $_SESSION['id_user'];
                                $dtb = $db->query(
                                    "select * from t_poin  where  id_sales='$id_sales' "
                                );
                            }

                            $no = 1;

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->total_poin ?></td>
                                <td><?= $isi->total_poin * 1000 ?></td>
                                <td><?= tgl_indo($isi->tgl_klaim) ?></td>
                                <td>
                                    <?php if ($level = 'administrator') { ?>
                                    <?php if ($isi->status == 'Y') { ?>
                                    <span class="pull-right badge bg-green">Disetujui</span>
                                    <?php } elseif ($isi->status == 'N') { ?>
                                    <span class="badge bg-yellow">Menunggu...</span>
                                    <?php } else { ?>
                                    <span class=" badge bg-red">Ditolak!!</span>
                                    <?php } ?>
                                    <a href="" class="btn btn-sm btn-info" data-toggle="modal"
                                        data-target="#modal-<?= $isi->id ?>">Ubah</i></a>

                                    <div class="modal fade" id="modal-<?= $isi->id ?>" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/reward/reward_action.php?act=upt">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah status</h4>
                                                        <div class="modal-body">
                                                            <div class="box-body">
                                                                <label for="Level User" class="control-label">Apakah
                                                                    Anda Ingin Ubah status?</label><br />
                                                                <br />
                                                                <select name='status' class="form-control select2"
                                                                    style="width: 100%;">
                                                                    <option>Pilih</option>
                                                                    <option value='Y'>Setujui</option>
                                                                    <option value='N'>Tolak</option>
                                                                    <option value='T'>Pending</option>
                                                                </select>

                                                                <input type="hidden" class="form-control pull-right"
                                                                    value="<?= $isi->id ?>" name="id" id="">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger pull-left"
                                                                data-dismiss="modal">Batal</button>
                                                            <input type="submit" class="btn btn-primary"
                                                                value="Cairkan">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <?php } else { ?>
                                    <?php if ($isi->status == 'Y') { ?>
                                    <span class="pull-right badge bg-green">Disetujui</span>
                                    <?php } elseif ($isi->status == 'T') { ?>
                                    <span class="badge bg-yellow">Menunggu...</span>
                                    <?php } else { ?>
                                    <span class=" badge bg-red">Ditolak!!</span>
                                    <?php } ?>
                                    <?php } ?>

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