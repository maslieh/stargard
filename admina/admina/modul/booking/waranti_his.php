<!-- Content Header (Page header) -->

<style>
@media print {
    #printPageButton {
        display: none;
    }
}
</style>
<section class="content-header">
    <h1>
        Data spk detail
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>spk">PRINT</a></li>
        <li class="active">SPK</li>
    </ol>
</section>

<!-- Main content -->

<div class="box-body" onload="window.print();">
    <section class="invoice">

        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <img src="<?= base_admin() ?>assets/LOGO_BLACK.png" width="150" height="46" alt="User Image">
                    <small class="pull-right">
                        <p align="right">Jalan Lurah Namat No.20 <br />
                            Jatirangga Kec. Jatisampurna<br /> Kota Bekasi, Jawa Barat 17143</p>
                    </small>
                </h2>
            </div>

        </div>
        <?php
        $datas = $db->fetch_custom_single(
            "select * from t_transaksi where waranti='$tek'"
        );
        $datas1 = $db->fetch_custom_single(
            "select * from t_garansi where id_data='$tek'"
        );
        $date = date_create();
        ?>



        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table "  >
                    <tr>
                        <td width='300'>

                            Kepada
                            <address>
                                <strong><?= $datas->nama ?></strong><br>
                                <?= $datas->alamat ?><br>
                                Telepon / Hp: <?= $datas->tlp ?><br>
                            </address>

                        </td>
                        <td>&nbsp;</td>
                        <td align="right"> <span align="right"> <b>No Nowaranti:</b> <?= $datas->waranti ?><br>
                                <b>Tanggal Cetak:</b> <?= date(
                                    'd-m-Y'
                                ) ?><br></span></td>
                    </tr>

                </table>
            </div>
        </div><br>

        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tanggal booking</th>
                            <th>Jenis kendaraan</th>
                            <th>No Rangka</th>
                            <th>Tipe Pengerjaan</th>
                            
                            
                            <th>Biaya</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $search = '';

                        $dtb = $db->query(
                            "select *,a.nama as nama_k, c.nama as nama_p from t_transaksi as a,sys_users as b ,t_paket as c where 
                            c.id=a.id_teknisi
                            and b.id=a.id_sales and a.waranti='$tek'
                        "
                        );

                        foreach ($dtb as $isi) {

                            /*$sisa = $isi->batas - $isi->terpakai;
                            if ($isi->booking == 0) {
                                $sts = 'Free';
                                $sts2 = '';
                            } elseif ($isi->harga_w != 0) {
                                $sts = number_format(
                                    $isi->booking,
                                    2,
                                    ',',
                                    '.'
                                );
                                $sts2 = 'Rp. ';
                            }*/
                            $day = date('D', strtotime($isi->tgl_booking));
                                 $dayList = array(
                                 'Sun' => 'Minggu',
                                 'Mon' => 'Senin',
                                 'Tue' => 'Selasa',
                                 'Wed' => 'Rabu',
                                  'Thu' => 'Kamis',
                                   'Fri' => 'Jumat',
                                   'Sat' => 'Sabtu'
                                    );
                                 $hari=  $dayList[$day];
                            
                            ?>
                        <tr>
                            <td><?= $no ?></td>
                            <td><?=$hari?>, <?=tgl_indo($isi->tgl_booking)?></td>
                            <td><?= $isi->jns_kendaraan ?></td>
                            <td><?= $isi->no_rangka ?></td>
                            <td><?= $isi->nama ?></td>
                            
                            
                            <td>Rp. <?=number_format(
                                    $isi->booking,
                                    2,
                                    ',',
                                    '.'
                                ); ?></td>
                        </tr>
                        <?php $no++;
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>
        <hr>
        <div class="row">

            <div class="col-xs-6">
                <p class="lead">Metode Pembayaran:</p>
                <img src="<?= base_admin() ?>/assets/BCA.png" alt="BCA">
                <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                    Kirim Ke :<br>
                    Bank BCA <br>
                    PT. STARGARD AUTO INTERNASIONAL<br>
                    740-3000720<br><br>
                    <small><em>Perhatian : Pembayaran Dengan Cek/Giro Hanya Sah Apabila Telah Dicairkan</em></small>
                </p>
            </div>

            <div class="col-xs-6">
                <p class="lead">Jumlah Terbayar <?= tgl_indo(
                    date('Y-m-d')
                ) ?></p>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th style="width:20%">Subtotal</th>
                            <td> :</td>
                            <td><?php
                            $dtb1 = $db->query(
                                "Select * from t_transaksi where waranti='$tek'"
                            );
                            foreach ($dtb1 as $key) {
                               // $sum = $key->jm;
                                echo $ss =
                                    'Rp. ' . number_format($key->booking, 2, ',', '.');
                            }
                            ?></td>
                        </tr>

                        <tr>
                            <th>Total </th>
                            <td> : </td>
                            <td><?php
                            $dtb11 = $db->query(
                                "Select*from t_transaksi where waranti='$tek'"
                            );
                            foreach ($dtb11 as $keye) {
                                //$sum = $key->jm;
                                echo $ss =
                                    'Rp. ' . number_format($keye->booking, 2, ',', '.');
                            }
                            ?></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br /><br /> <br />
            <br />
            <br />
            <br />
            <br />
            <button onclick="window.print()" id="printPageButton">Print this page</button>
    </section>
</div>