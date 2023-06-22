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


        <div class="row invoice-info">
            <?php $datas = $db->fetch_custom_single(
                "select * from t_transaksi where waranti='$tek'"
            ); ?>
            <div class="col-sm-8 invoice-col">
            </div>

            <div class="col-sm-4 invoice-col pull-right">
                <?php
                $datas1 = $db->fetch_custom_single(
                    "select * from t_garansi where id_data='$tek'"
                );
                $date = date_create();
                ?>
                <b>NO KWITANSI #INV<?= substr($datas->waranti, 3) ?></b><br>
                <b>No Nowaranti:</b> <?= $datas->waranti ?><br>
                <b>Tanggal Cetak:</b> <?= date('d-m-Y') ?><br>
            </div>

        </div>
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <?php $rp = $db->fetch_custom_single(
                        "SELECT * FROM t_transaksi as a, `t_paket` as c ,t_tipe as d
                            where a.id_teknisi=c.id and d.id=c.tipe and a.waranti='$tek'"
                    ); ?>
                    <tr>
                        <td width="150">Telah Terima Dari</td>
                        <td><b>: <?= ucwords($datas->nama) ?></b> </td>
                    </tr>
                    <tr>
                        <td width="150">Uang Sejumlah</td>
                        <td><b>: <em>Rp. <?= number_format(
                            $rp->harga,
                            2,
                            ',',
                            '.'
                        ) ?> </em></b> </td>
                    </tr>
                    <tr>
                        <td width="150">Terbilang</td>
                        <td><b>:<em> <?= ucwords(
                            terbilang($rp->harga)
                        ) ?> Rupiah</em></b> </td>
                    </tr>
                    <tr>
                        <td width="150">Untuk Pembayaran</td>
                        <td><b>: <em> <?= ucwords($rp->nama) ?></em></b> </td>
                    </tr>
                    <tr>
                        <td width="150">No Rangka</td>
                        <td><b>: <em> <?= ucwords(
                            $rp->no_rangka
                        ) ?></em></b> </td>
                    </tr>
                </table>
            </div>
        </div>


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

            <div class="col-xs-6" align="center">
                <p class="lead">Cibubur, <?= tgl_indo(
                    date('Y-m-d')
                ) ?></p><br /><br /><br /><br /><br />
                <div class="table-responsive center" align="center">
                    <table>
                        <tr>( <span class="hidden-xs"><?= ucwords(
                            $db->fetch_single_row(
                                'sys_users',
                                'id',
                                $_SESSION['id_user']
                            )->first_name
                        ) ?>
                                <?= ucwords(
                                    $db->fetch_single_row(
                                        'sys_users',
                                        'id',
                                        $_SESSION['id_user']
                                    )->last_name
                                ) ?>
                            </span> )
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br /> <br /> <br /> <br /> <br /> <br /><br /><br /><br /><br />
            <br />
            <br />
            <br />
            <br />
            <button onclick="window.print()" id="printPageButton">Print this page</button>
    </section>
</div>