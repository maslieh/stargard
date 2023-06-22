<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data penjualan
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>penjualan">penjualan</a></li>
        <li class="active">penjualan List</li>
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
                    <a href="<?= base_index() ?>penjualan/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Tambah
                    </a>
                    <br />
                    <hr />
                    <form action="<?= base_index() ?>penjualan/cari" method="get" class="form_cari">
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
                                <a href="<?= base_index() ?>penjualan" class="btn btn-info">Reset</a>
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
                                  p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' AND sts_hapus='N' 
                                 $search order by waranti DESC ",
                                $limit
                            );
                            $no = $pg->Num($limit);
                            $count = $pg->Num($limit);
                            if ($dtb->rowCount() < 1) {
                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                            }
                            foreach ($dtb as $isi) {

                                @$tob1 += $isi->harga;
                                @$tob2 += $isi->diskon;
                                @$tob += $isi->harga - $isi->diskon;
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
                                <td> <a href="https://wa.me/62<?= $isi->tlp ?>?text=Hallo,%20bpk/ibu%20<?= $isi->nama ?>,%20apakah%20saya%20boleh%20berbicara%20dengan%20bpk/ibu?"
                                        target="_blank" class="btn btn-success btn-sm btn-flat"><i
                                            class="fa fa-whatsapp"></i></a>
                                    <a href="<?= base_index() ?>penjualan/detail/<?= $isi->id ?>"
                                        class="btn btn-warning btn-sm btn-flat"><i class="fa fa-eye"></i></a> <a
                                        href="<?= base_index() ?>penjualan/edit/<?= $isi->id ?>"
                                        class="btn btn-primary btn-sm btn-flat"><i class="fa fa-pencil"></i></a>
                                    <a href="penjualan/print/<?= $isi->waranti ?>" class="btn btn-sm btn-info"> <i
                                            class="fa fa-print"></i></a>
                                    <a href="penjualan/card/<?= $isi->waranti ?>" class="btn btn-sm bg-maroon"> <i
                                            class="fa fa-credit-card"></i></a>
                                    <button class="btn btn-danger btn-sm btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/penjualan/penjualan_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>
                                </td>
                            </tr>

                            <?php $no++;
                            }
                            ?>
                            <tr>

                                <td>No</td>

                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>



                                <td colspan='2'><b>Total</b></td>
                                <td><em>Rp. <?= number_format(
                                    @$tob1,
                                    2,
                                    ',',
                                    '.'
                                ) ?></em></td>
                                <td><em>Rp. <?= number_format(
                                    @$tob2,
                                    2,
                                    ',',
                                    '.'
                                ) ?></em></td>
                                <td><b>Rp. <?= number_format(
                                    @$tob,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b></td>
                                <td colspan='2'></td>

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