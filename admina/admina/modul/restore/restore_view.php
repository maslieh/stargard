<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data restore
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>restore">restore</a></li>
        <li class="active">restore List</li>
    </ol>
</section>

<!-- Main content -->
<?php
$ids = $_SESSION['id_user'];
$datas = $db->fetch_custom_single(
    "select u.id,l.level from  sys_users as u, sys_group_users as l   where u.id_group=l.id and u.id = $ids"
);
$level = $datas->level;
?>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="<?= base_index() ?>restore/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Tambah
                    </a>
                    <br />
                    <hr />
                    <form action="<?= base_index() ?>restore/cari" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">cari berdasarkan </button>
                            </span>
                            <input type="text" name="mulai" class="form-control date" placeholder="yyyy-mm-dd" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"> s/d </button>
                            </span>
                            <input type="text" name="dari" class="form-control date" placeholder="yyyy-mm-dd" />

                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-success btn-flat">Submit</button>
                            </span>
                            <span class="input-group-btn">
                                <a href="<?= base_index() ?>restore" class="btn btn-info">Reset</a>
                            </span>
                        </div>

                    </form>
                    <hr>
                    <form action="" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Pencarian !</button>
                            </span>
                            <input type="text" name="q" class="form-control" placeholder="Search..." />
                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-flat"><i
                                        class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>No Waranti</th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>No Telepon</th>
                                <th>Nama Kendaraan</th>
                                <th>No Polisi</th>
                                <th>Harga</th>
                                <th>Diskon</th>
                                <th>Bayar</th>
                                <th>Tanggal</th>
                                <th>Action</th>
                            </tr>


                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            $no = 0;
                            if (isset($_GET['q'])) {
                                $search_condition = $db->getRawWhereFilterForColumns(
                                    $_GET['q'],
                                    [
                                        'p.nama',
                                        'p.waranti',
                                        'p.no_rangka',
                                        'p.no_polisi',
                                    ]
                                );
                                $search = "and $search_condition";
                            }
                            $dtb = $pg->myquery(
                                "select p.id,p.tgl,p.tgl_server,
                                 p.nama ,p.waranti,p.alamat,
                                 p.tlp,p.jns_kendaraan,
                                 p.no_polisi,t.harga,p.diskon
                                 FROM 
                                 `t_transaksi` as p, t_paket as t, t_tipe as e
                                  where 
                                  p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' AND sts_hapus='Y' 
                                 $search order by waranti DESC ",
                                $limit
                            );
                            $no = $pg->Num($limit);
                            $count = $pg->Num($limit);
                            if ($dtb->rowCount() < 1) {
                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                            }
                            foreach ($dtb as $isi) {

                                @$tob += $isi->harga;
                                $total_b = $isi->harga - $isi->diskon;
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->waranti ?></td>
                                <td><?= $isi->nama ?></td>
                                <td><?= $isi->alamat ?></td>
                                <td><?= $isi->tlp ?></td>
                                <td><?= $isi->jns_kendaraan ?></td>
                                <td><?= $isi->no_polisi ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->harga,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->diskon,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $total_b,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td><?= tgl_indo(
                                    $isi->tgl
                                ) ?><br /><br /><span class="bg-yellow"><small><em>[tanggal server:<br />
                                                <?= $isi->tgl_server ?> ]</em></small></span< /td>
                                <td>
                                    <button class="btn btn-primary btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/restore/restore_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-refresh"></i> </button>
                                </td>
                            </tr>

                            <?php $no++;
                            }
                            ?>
                            <tr>
                                <td colspan="8"></td>
                                <td><b>Total</b></td>
                                <td><b>Rp. <?= number_format(
                                    @$tob,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b></td>
                                <td colspan="2"></td>

                            </tr>
                        </tbody>
                    </table>

                    <div class="col-xs-6" style="margin-top:10px"> Showing
                        <?= $count ?> to <?= $no - 1 ?> of
                        <?= $pg->total_record ?> entries

                    </div>

                    <div class="col-xs-6">

                        <?php
                        if (isset($_GET['q'])) {
                            $pg->url =
                                base_index() .
                                'pegawai?q=' .
                                $_GET['q'] .
                                '&page=';
                        }
                        $pg->setParameter([
                            'range' => $limit,
                        ]);
                        ?>

                        <div class="dataTables_paginate paging_bootstrap">
                            <ul class="pagination">
                                <?= $pg->create() ?>
                            </ul>
                        </div>
                    </div>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->