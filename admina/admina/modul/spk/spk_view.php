<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data spk
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>spk">spk</a></li>
        <li class="active">spk List</li>
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
                    <form action="<?= base_index() ?>spk/cari" method="get" class="form_cari">
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
                                <a href="<?= base_index() ?>spk" class="btn btn-info">Reset</a>
                            </span>
                        </div>

                    </form>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Nama Kendaraan</th>
                                <th>No Rangka</th>
                                <th>No Polisi</th>
                                <th>Teknisi 1</th>
                                <th>Teknisi 2</th>
                                <th>Teknisi 3</th>
                                <th>Teknisi 4</th>
                                <th>Tanggal</th>
                            </tr>


                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (
                                $level == 'administrator' ||
                                $level == 'admin'
                            ) {
                                $dtb = $db->query(
                                    "SELECT p.tek1,p.tek2,p.tek3,p.tek4, p.id,p.tgl,p.tgl_server,p.no_rangka, p.nama,p.waranti,p.alamat,p.tlp,p.jns_kendaraan,p.no_polisi,t.harga,p.diskon,p.total_b
                                 FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' AND sts_hapus='N'
                                
                                  order by 
                                 p.tgl DESC; "
                                );
                            } else {
                                $dtb = $db->query(
                                    "SELECT p.tek1,p.tek2,p.tek3,p.tek4, p.id,p.tgl,p.tgl_server,p.no_rangka, p.nama,p.waranti,p.alamat,p.tlp,p.jns_kendaraan,p.no_polisi,t.harga,p.diskon,p.total_b
                                 FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='Y' AND sts_hapus='N' 
                                
                                 order by 
                                 p.tgl DESC; "
                                );
                            }
                            $no = 1;

                            foreach ($dtb as $isi) {

                                @$tob += $isi->total_b;
                                if (
                                    $level == 'administrator' ||
                                    $level == 'admin'
                                ) {
                                    $teknisi1 = $isi->tek1;

                                    if ($teknisi1) {
                                        $idm = $isi->tek1;
                                        $datsa = $db->fetch_custom_single(
                                            "select*from sys_users where id='$idm' "
                                        );
                                        $cet1 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi1 .
                                            '"> <i
                                class="fa fa-print"></i></a><br>
                               <label> ' .
                                            $datsa->first_name .
                                            '
                                ';
                                    } else {
                                        $cet1 = '';
                                    }

                                    $teknisi2 = $isi->tek2;
                                    if ($teknisi2) {
                                        $idm2 = $isi->tek2;
                                        $datsa2 = $db->fetch_custom_single(
                                            "select*from sys_users where id='$idm2' "
                                        );
                                        $cet2 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi2 .
                                            '"> <i
                                class="fa fa-print"></i></a><br>  <label> ' .
                                            $datsa2->first_name .
                                            '';
                                    } else {
                                        $cet2 = '';
                                    }

                                    $teknisi3 = $isi->tek3;
                                    if ($teknisi3) {
                                        $idm3 = $isi->tek3;
                                        $datsa3 = $db->fetch_custom_single(
                                            "select*from sys_users where id='$idm3' "
                                        );
                                        $cet3 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi3 .
                                            '"> <i
                                class="fa fa-print"></i></a><br>
                                <label> ' .
                                            $datsa3->first_name .
                                            '';
                                    } else {
                                        $cet3 = '';
                                    }

                                    $teknisi4 = $isi->tek4;
                                    if ($teknisi4) {
                                        $idm2 = $isi->tek2;
                                        $datsa2 = $db->fetch_custom_single(
                                            "select*from sys_users where id='$idm2' "
                                        );
                                        $cet4 =
                                            '<a href="spk/print/' .
                                            $teknisi4 .
                                            '/' .
                                            $isi->waranti .
                                            '"> <i
                                class="fa fa-print"></i></a><br>
                                <label> ' .
                                            $datsa4->first_name .
                                            '';
                                    } else {
                                        $cet4 = '';
                                    }

                                    ////////////////////////////////
                                } else {
                                    $teknisi1 = $isi->tek1;
                                    if ($teknisi1 == '') {
                                        $cet1 = '';
                                    } elseif ($teknisi1 == $ids) {
                                        $cet1 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi1 .
                                            '"> <i
                                class="fa fa-print"></i></a>';
                                    } else {
                                        $cet1 = '';
                                    }

                                    $teknisi2 = $isi->tek2;
                                    if ($teknisi2 == '') {
                                        $cet2 = '';
                                    } elseif ($teknisi2 == $ids) {
                                        $cet2 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi2 .
                                            '"> <i
                                class="fa fa-print"></i></a>';
                                    } else {
                                        $cet2 = '';
                                    }

                                    $teknisi3 = $isi->tek3;
                                    if ($teknisi3 == '') {
                                        $cet3 = '';
                                    } elseif ($teknisi3 == $ids) {
                                        $cet3 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi3 .
                                            '"> <i
                                class="fa fa-print"></i></a>';
                                    } else {
                                        $cet3 = '';
                                    }

                                    $teknisi4 = $isi->tek4;
                                    if ($teknisi4 == '') {
                                        $cet4 = '';
                                    } elseif ($teknisi4 == $ids) {
                                        $cet4 =
                                            '<a href="spk/print/' .
                                            $isi->waranti .
                                            '/' .
                                            $teknisi4 .
                                            '"> <i
                                class="fa fa-print"></i></a>';
                                    } else {
                                        $cet4 = '';
                                    }
                                }
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->jns_kendaraan ?></td>
                                <td><?= $isi->no_rangka ?></td>
                                <td><?= $isi->no_polisi ?></td>
                                <td><?= $cet1 ?></td>
                                <td><?= $cet2 ?></td>
                                <td><?= $cet3 ?></td>
                                <td><?= $cet4 ?></td>

                                <td><?= tgl_indo(
                                    $isi->tgl
                                ) ?><br /><br /><span><small><em>[tanggal server:<br />
                                                <?= $isi->tgl_server ?> ]</em></small></span>
                                </td>

                            </tr>

                            <?php $no++;
                            }
                            ?>

                    </table>
                    </tbody>




                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->