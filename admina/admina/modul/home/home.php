<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Welcome, <?= ucwords($_SESSION['nama_lengkap']) ?>

    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <?php
    $ids = $_SESSION['id_user'];
    $datas = $db->fetch_custom_single(
        "select u.id,l.level from  sys_users as u, sys_group_users as l   where u.id_group=l.id and u.id = $ids"
    );
    $level = $datas->level;

    if ($level == 'administrator' || $level == 'admin') { ?>


    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-usd"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Transaksi</span>
                    <?php $data1 = $db->fetch_custom_single(
                        "select sum(b.harga)  - sum(a.diskon) as total from t_transaksi as a, t_paket as b where a.id_teknisi=b.id and a.sts_hapus='N'and a.sts_book='Y' and a.status_bayar='B'"
                    );
        // $total=$data1->total-
        ?>
                    <span class="info-box-number"><small>Rp. </small><?= number_format(
                        $data1->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>

            </div>

        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="ion ion-ios-cart-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Penjualan</span>
                    <?php $dataa = $db->fetch_custom_single(
                        "select count(id) as total from t_transaksi where sts_book='Y' and sts_hapus='N' and status_bayar='B'"
                    ); ?>
                    <span class="info-box-number"><?= $dataa->total ?></span>
                </div>

            </div>

        </div>


        <div class="clearfix visible-sm-block"></div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="ion ion-ios-people-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Sales</span>
                    <?php $masuk1 = $db->fetch_custom_single(
                        "select count(id) as total from sys_users, t_jabatan where sys_users.id_jabatan=t_jabatan.id_jabatan and jabatan ='sales'"
                    ); ?>
                    <span class="info-box-number"><?= $masuk1->total ?></span>
                </div>

            </div>

        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Pegawai</span>
                    <?php $masuk = $db->fetch_custom_single(
                        "select count(id) as total from sys_users, t_jabatan where sys_users.id_jabatan=t_jabatan.id_jabatan and jabatan !='sales'"
                    ); ?>
                    <span class="info-box-number"> <?= $masuk->total ?></span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-line-chart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Penjualan <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $datas = $db->fetch_custom_single(
                        "select count(id) as total from t_transaksi where sts_hapus='N'and sts_book='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' and status_bayar='B'"
                    );
                    ?>
                    <span class="info-box-number"><?= $datas->total ?></span>
                </div>

            </div>

        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-bar-chart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Penghasilan <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dataee = $db->fetch_custom_single(
                        "select sum(b.harga) - sum(a.diskon) as total from t_transaksi as a, t_paket as b where a.id_teknisi=b.id and a.sts_hapus='N'and a.sts_book='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' and a.status_bayar='B'"
                    );
                    ?>
                    <span class="info-box-number">Rp. <?= number_format(
                        $dataee->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-line-chart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data belum Lunas <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $datas = $db->fetch_custom_single(
                        "select count(id) as total from t_transaksi where sts_hapus='N'and sts_book='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' and status_bayar='T'"
                    );

                    $datast = $db->fetch_custom_single(
                        "select sum(b.harga) - sum(a.diskon) as total from t_transaksi as a, t_paket as b where a.id_teknisi=b.id and a.sts_hapus='N'and a.sts_book='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' and a.status_bayar='T'"
                    );
                    ?>
                    <span class="info-box-number">TOTAL: <?= $datas->total ?></span>

                    <span class="info-box-number">TOTAL Rp. <?= number_format(
                        $datast->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>

                </div>

            </div>

        </div>




        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-trash"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Terhapus </span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $datas = $db->fetch_custom_single(
                        "select count(id) as total from t_transaksi where sts_hapus='Y'and sts_book='Y' "
                    );
                    ?>
                    <span class="info-box-number"><?= $datas->total ?></span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-bar-chart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Nominal Data Terhapus </span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dhp = $db->fetch_custom_single(
                        "select sum(b.harga) - sum(a.diskon) as total from t_transaksi as a, t_paket as b where a.id_teknisi=b.id and a.sts_hapus='Y'and a.sts_book='Y'; "
                    );
                    ?>
                    <span class="info-box-number">Rp. <?= number_format(
                        $dhp->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-maroon"><i class="fa  fa-external-link"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Booking </span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dhp = $db->fetch_custom_single(
                        //   "select count(id) as total from t_transaksi where sts_book='N' and sts_hapus='N'"
                        "SELECT count(p.waranti) as total
                                 FROM `t_transaksi` as p, sys_users as u,t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='N' and sts_hapus='N' and u.id=p.id_sales"
                    );
                    ?>
                    <span class="info-box-number"><?= $dhp->total ?></span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-purple"><i class="fa fa-tasks"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Nominal Data Booking </span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dhps = $db->fetch_custom_single(
                        "select sum(booking) as total from t_transaksi where sts_book='N' and sts_hapus='N' "
                    );
                    ?>
                    <span class="info-box-number">Rp. <?= number_format(
                        $dhps->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-orange"><i class="fa fa-trash"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Data Terhapus <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $datas = $db->fetch_custom_single(
                        "select count(id) as total from t_transaksi where sts_hapus='Y' and sts_book='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' and sts_book='Y' "
                    );
                    ?>
                    <span class="info-box-number"><?= $datas->total ?></span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-area-chart"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Nominal Data Terhapus <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dhp = $db->fetch_custom_single(
                        "select sum(b.harga) - sum(diskon) as total from t_transaksi as a, t_paket as b where a.id_teknisi=b.id and sts_book='Y'
                        and a.sts_hapus='Y' AND tgl BETWEEN '$tgl_pertama' AND '$tgl_terakhir' "
                    );
                    ?>
                    <span class="info-box-number">Rp. <?= number_format(
                        $dhp->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-purple"><i class="fa fa-tasks"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Nominal Data Booking<br>
                        histori </span>
                    <?php
                    $hari_ini = date('Y-m-d');
                    $tgl_pertama = date('Y-m-01', strtotime($hari_ini));
                    $tgl_terakhir = date('Y-m-t', strtotime($hari_ini));
                    $dhps = $db->fetch_custom_single(
                        // "select sum(booking) as total from t_transaksi where sts_book='Y'  And sts_hapus='N'"
                        "SELECT sum(p.booking) as total
                                 FROM `t_transaksi` as p, sys_users as u,t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='N' and sts_hapus='N' and u.id=p.id_sales"
                    );
                    ?>
                    <span class="info-box-number">Rp. <?= number_format(
                        $dhps->total,
                        2,
                        ',',
                        '.'
                    ) ?></span>
                </div>
            </div>
        </div>
    </div>



    <div class="row">

        <div class="col-md-6">
            <?php
            $treat = $db->fetch_custom_single(
                'select count(id) as total from t_history'
            );
            $treat1 = $db->fetch_custom_single(
                'select sum(harga_w) as total from t_history'
            );
            $treat2 = $db->fetch_custom_single(
                "select  count(id) as total from t_history where status_bayar='B' and sts_kerja='1' "
            );
            $treat3 = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where status_bayar='B' and sts_kerja='1' "
            );
            $pending = $db->fetch_custom_single(
                "select  count(id) as total from t_history where sts_kerja='0' "
            );
            $pending1 = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where sts_kerja='0' "
            );

            $belum = $db->fetch_custom_single(
                "select  count(id) as total from t_history where status_bayar='T' "
            );
            $belum1 = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where status_bayar='T'"
            );
            $start = date('Y-m-01');
            $end = date('Y-m-d');
            $treatbulanan = $db->fetch_custom_single(
                "select count(id) as total from t_history where tgl_pakai  BETWEEN '$start' AND '$end'    "
            );
            $treatbulanan1 = $db->fetch_custom_single(
                "select sum(harga_w) as total from t_history where tgl_pakai  BETWEEN '$start' AND '$end'"
            );
            $treat2bulanan = $db->fetch_custom_single(
                "select  count(id) as total from t_history where status_bayar='B' and sts_kerja='1' and  tgl_pakai  BETWEEN '$start' AND '$end'"
            );
            $treat3bulanan = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where status_bayar='B' and sts_kerja='1'  and  tgl_pakai  BETWEEN '$start' AND '$end' "
            );
            $pendingbulanan = $db->fetch_custom_single(
                "select  count(id) as total from t_history where sts_kerja='0'  and  tgl_pakai  BETWEEN '$start' AND '$end' "
            );
            $pending1bulanan = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where sts_kerja='0' and  tgl_pakai  BETWEEN '$start' AND '$end' "
            );

            $belumbulanan = $db->fetch_custom_single(
                "select  count(id) as total from t_history where status_bayar='T'  and  tgl_pakai  BETWEEN '$start' AND '$end' "
            );
            $belum1bulanan = $db->fetch_custom_single(
                "select  sum(harga_w) as total from t_history where status_bayar='T'  and  tgl_pakai  BETWEEN '$start' AND '$end'"
            );

            $ttrbulanan = ($treat2bulanan->total / $treatbulanan->total) * 100;
            $pendbulanan =
                ($pendingbulanan->total / $treatbulanan->total) * 100;
            $belbulanan = ($belumbulanan->total / $treatbulanan->total) * 100;
            $ttr = ($treat2->total / $treat->total) * 100;
            $pend = ($pending->total / $treat->total) * 100;
            $bel = ($belum->total / $treat->total) * 100;
            ?>
            <div class="info-box bg-yellow">
                <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
                <div class="info-box-content">

                    <span class="info-box-text">Treatmen</span>
                    <span class="info-box-number"><?= $treat->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: 100%"></div>
                    </div>
                    <span class="progress-description pull-right">
                        100%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format($treat1->total, 2, ',', '.') ?>
                    </span>
                </div>

            </div>

            <div class="info-box bg-green">
                <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treament Selesai</span>
                    <span class="info-box-number"><?= $treat2->total ?>
                    </span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $ttr ?>%"></div>
                    </div>
                    <span class="progress-description pull-right">
                        <?= number_format($ttr, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format($treat3->total, 2, ',', '.') ?>
                    </span>
                </div>

            </div>

            <div class="info-box bg-red">
                <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treatment Pending</span>
                    <span class="info-box-number"><?= $pending->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $pend ?>%"></div>
                    </div> <span class="progress-description pull-right">
                        <?= number_format($pend, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format($pending1->total, 2, ',', '.') ?>
                    </span>
                </div>

            </div>

            <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treatment Belum lunas</span>
                    <span class="info-box-number"><?= $belum->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $bel ?>%"></div>
                    </div>
                    <span class="progress-description pull-right">
                        <?= number_format($bel, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format($belum1->total, 2, ',', '.') ?>
                    </span>
                </div>

            </div>
        </div>
        <div class="col-md-6">

            <div class="info-box bg-yellow">
                <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treatmen <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <span class="info-box-number"><?= $treatbulanan->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: 100%"></div>
                    </div> <span class="progress-description pull-right">
                        100%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format(
                            $treatbulanan1->total,
                            2,
                            ',',
                            '.'
                        ) ?>
                    </span>

                </div>

            </div>

            <div class="info-box bg-green">
                <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treament Selesai <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <span class="info-box-number"><?= $treat2bulanan->total ?>
                    </span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $ttrbulanan ?>%"></div>
                    </div>
                    <span class="progress-description pull-right">
                        <?= number_format($ttrbulanan, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format(
                            $treat3bulanan->total,
                            2,
                            ',',
                            '.'
                        ) ?>
                    </span>
                </div>

            </div>

            <div class="info-box bg-red">
                <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treatment Pending <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <span class="info-box-number"><?= $pendingbulanan->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $pend ?>%"></div>
                    </div> <span class="progress-description pull-right">
                        <?= number_format($pendbulanan, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format(
                            $pending1bulanan->total,
                            2,
                            ',',
                            '.'
                        ) ?>
                    </span>
                </div>

            </div>

            <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Treatment Belum lunas <?= tgl_indo(
                        date('Y-m')
                    ) ?></span>
                    <span class="info-box-number"><?= $belumbulanan->total ?></span>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?= $bel ?>%"></div>
                    </div>
                    <span class="progress-description pull-right">
                        <?= number_format($belbulanan, 2, '.', '') ?>%
                    </span>
                    <span class="progress-description">
                        Rp. <?= number_format(
                            $belum1bulanan->total,
                            2,
                            ',',
                            '.'
                        ) ?>
                    </span>
                </div>

            </div>


            <div class="clearfix visible-sm-block"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <label> Transaksi Belum Bayar/Pelunasan</label>
                <div class="box-body table-responsive">
                    <table id="dtb_manual2" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>TANGGAL</th>
                                <th>No Waranti</th>
                                <th>Nama Customer</th>
                                <th>Kendaraan</th>
                                <th>Sales </th>
                                <th>status </th>
                                <th>aksi </th>


                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $dtb1 = $db->query(
                                "select t_transaksi.*,sys_users.*,t_transaksi.id as ids, sys_users.id as idi from t_transaksi,sys_users where  t_transaksi.id_sales=sys_users.id
                                             and t_transaksi.sts_book='Y' 
                                             and t_transaksi.status_bayar='T' 
                                              order by t_transaksi.waranti DESC  "
                            );
                            $no1 = 1;

                            foreach ($dtb1 as $isi1) {

                                $stb = $isi1->status_bayar;
                                if ($stb != 'B') {
                                    $sts_bayar = 'Belum Lunas';
                                } else {
                                    $sts_bayar = 'Lunas';
                                }
                                ?>
                            <tr id="line_<?= $isi1->ids ?>">
                                <td align="center"><?= $no1 ?></td>
                                <td><?= tgl_indo($isi1->tgl) ?></td>
                                <td><?= $isi1->waranti ?></td>
                                <td><?= $isi1->nama ?></td>
                                <td><?= $isi1->jns_kendaraan ?></td>
                                <td><?= $isi1->first_name ?> <?= $isi1->last_name ?></td>
                                <td><span class=" badge bg-red"><small><?= $sts_bayar ?></small></span>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                        data-target="#modal-default-<?= $isi1->ids ?>">
                                        <i class="fa fa-check"></i>
                                    </button>

                                    <div class="modal fade" id="modal-default-<?= $isi1->ids ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/booking/booking_action.php?act=up2">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah Anda ingi mengubah status
                                                            <?= $isi1->jns_kendaraan ?>?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi1->ids ?>' name='id'>
                                                        <input type='hidden' value='Y' name='status'>
                                                        <input type='hidden' value='B' name='status_bayar'>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default pull-left"
                                                            data-dismiss="modal">Batal</button>
                                                        <input type="submit" class="btn btn-primary" value='Simpan'>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <?php $no1++;
                            }
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <label> histori Penjualan</label>
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>tanggal </th>
                                <th>No Waranti</th>
                                <th>Nama Customer</th>
                                <th>Kendaraan</th>
                                <th>Sales </th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (isset($_GET['w'])) {
                                $search_condition = $db->getRawWhereFilterForColumns(
                                    $_GET['w'],
                                    [
                                        'nama',
                                        'waranti',
                                        'no_rangka',
                                        'no_polisi',
                                    ]
                                );
                                $search = "and $search_condition";
                            }

                            $dtb = $db->query(
                                "select * from t_transaksi,sys_users where  t_transaksi.id_sales=sys_users.id
                                             and sts_book='Y' order by t_transaksi.waranti DESC  "
                            );
                            $no = $pg->Num($limit);
                            $count = $pg->Num($limit);
                            if ($dtb->rowCount() < 1) {
                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                            }
                            foreach ($dtb as $isi) { ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= tgl_indo(
                                    $isi->tgl
                                ) ?> <br><small><em>tgl input :
                                            <?= tgl_indo(
                                                $isi->tgl_server
                                            ) ?></em></small></td>
                                <td><?= $isi->waranti ?></td>
                                <td><?= $isi->nama ?></td>
                                <td><?= $isi->jns_kendaraan ?></td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?></td>
                            </tr>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>



    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <label> TOTAL PENJUAAN SALES <?= tgl_indo(
                    date('Y-m-d')
                ) ?></label>
                <div class="box-body table-responsive">
                    <table id="dtb_manual3" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Sales </th>
                                <th>Total Penjualan </th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            if (isset($_GET['w'])) {
                                $search_condition = $db->getRawWhereFilterForColumns(
                                    $_GET['w'],
                                    [
                                        'nama',
                                        'waranti',
                                        'no_rangka',
                                        'no_polisi',
                                    ]
                                );
                                $search = "and $search_condition";
                            }
                            $mulai = date('Y-m-01');
                            $sampai = date('Y-m-d');
                            $dtb = $db->query(
                                "select count(t_transaksi.id_sales) as jumlah, sys_users.first_name,sys_users.last_name from t_transaksi,sys_users where  t_transaksi.id_sales=sys_users.id
                                             and sts_book='Y' and tgl BETWEEN '$mulai' AND '$sampai' group by t_transaksi.id_sales order by jumlah DESC  "
                            );
                            $no = $pg->Num($limit);
                            $count = $pg->Num($limit);
                            if ($dtb->rowCount() < 1) {
                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                            }
                            foreach ($dtb as $isi) { ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?></td>
                                <td><?= $isi->jumlah ?></td>
                            </tr>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>

    <?php } else { ?>
    <div class="box box-solid bg-green-gradient">
        <div class="box-header">
            <i class="fa fa-calendar"></i>
            <h3 class="box-title">Calendar</h3>

            <div class="pull-right box-tools">

                <div class="btn-group">
                    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bars"></i></button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#">Add new event</a></li>
                        <li><a href="#">Clear events</a></li>
                        <li class="divider"></li>
                        <li><a href="#">View calendar</a></li>
                    </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
            </div>

        </div>
        <?php }
    ?>
</section>
<script type="text/javascript">
$(function() {
    $("#dtb_manual").dataTable();
    $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false,

    });
});
$(function() {
    $("#dtb_manual2").dataTable();
    $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false,

    });
});

$(function() {
    $("#dtb_manual3").dataTable();
    $('#example2').dataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bSort": true,
        "bInfo": true,
        "bAutoWidth": false,

    });
});
</script>