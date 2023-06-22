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
        Bukti
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



        <div class="row" style="border-top: 1px solid black;">
            <div class="col-xs-12 table-responsive">
                <table class="table ">
                    <tr>
                        <td>
                            <p> Diterbitkan Oleh : <br><b>STARGARD CIBUBUR</b></p>
                            <p>Jalan Lurah Namat No.20 <br />
                                Jatirangga Kec. Jatisampurna<br />
                                Kota Bekasi, Jawa Barat 17143</p>
                        </td>
                        <td>

                            Kepada
                            <address>
                                <strong><?= $datas->nama ?></strong><br>
                                <?= $datas->alamat ?><br>
                                Telepon / Hp: <?= $datas->tlp ?><br>
                            </address>

                        </td>
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
                <table class="table table-striped" style="border-style: dotted;  border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Tanggal Pengerjaan</th>
                            <th>No Rangka</th>
                            <th>Pekerjaan Awal</th>
                            <th>Keterangan</th>
                            <th>Biaya</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        $search = '';

                        $dtb = $db->query(
                            "select t_history.keterangan,t_history.waranti,t_history.harga_w,t_history.tgl_pakai,
                            t_paket.nama,t_transaksi.nama as name,t_transaksi.alamat,t_transaksi.tlp,t_transaksi.no_rangka
                             from t_transaksi,t_garansi,t_history,t_paket where  
                            t_transaksi.waranti=t_garansi.id_data 
                             and t_paket.id=t_transaksi.id_teknisi
                            and t_history.waranti=t_transaksi.waranti and t_transaksi.waranti='$tek'
                        "
                        );

                        foreach ($dtb as $isi) {

                            @$sisa = @$isi->batas - $isi->terpakai;
                            if ($isi->harga_w == 0) {
                                $sts = 'Free';
                                $sts2 = '';
                            } elseif ($isi->harga_w != 0) {
                                $sts = number_format(
                                    $isi->harga_w,
                                    2,
                                    ',',
                                    '.'
                                );
                                $sts2 = 'Rp. ';
                            }

                            $day = date('D', strtotime($isi->tgl_pakai));
                            $dayList = [
                                'Sun' => 'Minggu',
                                'Mon' => 'Senin',
                                'Tue' => 'Selasa',
                                'Wed' => 'Rabu',
                                'Thu' => 'Kamis',
                                'Fri' => 'Jumat',
                                'Sat' => 'Sabtu',
                            ];
                            $hari = $dayList[$day];
                            ?>
                        <tr>
                            <td><?= $no ?></td>
                            <td><?= $hari ?>, <?= tgl_indo($isi->tgl_pakai) ?>
                            </td>
                            <td><?= $isi->no_rangka ?></td>
                            <td><?= $isi->nama ?></td>
                            <td><?= $isi->keterangan ?></td>
                            <td><?= $sts2 ?> <?= $sts ?></td>
                        </tr>
                        <?php $no++;
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>
        <br><br><br>
        <div class="row">
            <div class="col-xs-4  ">
                <table class="">
                    <?php $datas = $db->fetch_custom_single(
                        "select * from t_garansi where id_data='$tek'"
                    ); ?>
                    <tr>
                        <td><em>Masa garansi</em></td>
                        <td>&nbsp;</td>
                        <td><em>: <?= tgl_indo(
                            $datas->tgl_mulai
                        ) ?> s/d <?= tgl_indo($datas->tgl_akhir) ?></em></td>
                    </tr>
                    <td><em>Batas garansi</em></td>
                    <?php $jml = $db->query(
                        "select * from t_history where waranti='$tek'"
                    ); ?>
                    <td>&nbsp;</td>
                    <td><em>: <?= $datas->batas ?> kali (Terpakai : <?= $jml->rowCount() ?>)</em></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr style="border-top: dotted black; border-width: 4px">
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
                <p class="lead">Cibubur, <?= tgl_indo(date('Y-m-d')) ?></p>
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th style="width:20%; border-top: 1px solid black;">Subtotal</th>
                            <td style="border-top: 1px solid black;">: <?php
                            $dtb1 = $db->query(
                                "Select sum(harga_w) as jm from t_history where waranti='$tek'"
                            );
                            foreach ($dtb1 as $key) {
                                $sum = $key->jm;
                                echo $ss =
                                    'Rp. ' . number_format($sum, 2, ',', '.');
                            }
                            ?></td>
                        </tr>

                        <tr>
                            <th style="border-top: 1px solid black;">Total </th>
                            <td style="border-top: 1px solid black;">: <?php
                            $dtb11 = $db->query(
                                "Select sum(harga_w) as jm from t_history where waranti='$tek'"
                            );
                            foreach ($dtb11 as $key) {
                                $sum = $key->jm;
                                echo $ss =
                                    'Rp. ' . number_format($sum, 2, ',', '.');
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