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
        <div class="row">

            <div class="col-sm-12 ">
                <h3 align="center"> SURAT PERINTAH KERJA</h3>
                <h3 align="center">(SPK)</h3>
            </div>


        </div>
        <br />

        <div class="row">
            <div class="col-xs-12 table-responsive">
                <p>Bersama ini mohon agar dapat dilakukan proses pengerjaan untuk kendaraan sebagai
                    berikut: </p><br>
                <h4>Data Pelanggan </h4>
                <table>
                    <?php $datas = $db->fetch_custom_single(
                        "select * from t_transaksi where waranti='$tek'"
                    ); ?>
                    <tr>
                        <td>Nama Pelanggan</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b><?= $datas->nama ?> </b></td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= $datas->alamat ?> </b></td>
                    </tr>
                    <tr>
                        <td>No. Telpn</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td> <b><?= $datas->tlp ?> </b></td>
                    </tr>

                </table><br />
                <h4>Data Kendaraan </h4>
                <table>
                    <tr>
                        <td>Type kendaraan</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b><?= $datas->jns_kendaraan ?> </b></td>
                    </tr>
                    <tr>
                        <td>No. Rangka</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= $datas->no_rangka?></b></td>
                    </tr>
                    <tr>
                        <?php $datas1 = $db->fetch_custom_single(
                            "select p.nama from t_transaksi as t,t_paket as p where t.id_teknisi=p.id and t.waranti='$tek'"
                        ); ?>
                        <td>Jenis pekrejaan</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= $datas1->nama ?></b></td>
                    </tr>
                </table><br />
                <h4>Data Teknisi </h4>
                <table>
                    <?php $datas1 = $db->fetch_custom_single(
                        "select * from t_transaksi as t,sys_users as p where t.tek1=p.id and t.waranti='$tek'"
                    ); ?>
                    <tr>
                        <td>Teknisi 1</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b><?= @$datas1->first_name ?> <?= @$datas1->last_name ?> </b></td>
                    </tr>
                    <tr>
                        <?php $datas2 = $db->fetch_custom_single(
                            "select * from t_transaksi as t,sys_users as p where t.tek2=p.id and t.waranti='$tek'"
                        ); ?>
                        <td>Teknisi 2</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= @$datas2->first_name ?> <?= @$datas2->last_name ?> </b></td>
                    </tr>
                    <tr>
                        <?php $datas3 = $db->fetch_custom_single(
                            "select * from t_transaksi as t,sys_users as p where t.tek3=p.id and t.waranti='$tek'"
                        ); ?>
                        <td>Teknisi 3</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= @$datas3->first_name ?> <?= @$datas3->last_name ?> </b></td>
                    </tr>
                    <tr>
                        <?php $datas4 = $db->fetch_custom_single(
                            "select * from t_transaksi as t,sys_users as p where t.tek4=p.id and t.waranti='$tek'"
                        ); ?>
                        <td>Teknisi 4</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> :&nbsp; </td>
                        <td><b> <?= @$datas4->first_name ?> <?= @$datas4->last_name ?> </b></td>
                    </tr>
                </table><br />
                <p>Demikian yang dapat kami sampaikan, agar dapat ditindak lnjuti sebagaimana mestinya. Terima kasih</p>
                <br /><br /><br /><br /><br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> &nbsp; </td>
                        <td><b>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TTD ADMIN
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;] </b>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> &nbsp; </td>
                        <td><b>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TTD Teknisi
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;] </b>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td> &nbsp; </td>
                        <td><b>[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TTD Pelanggan
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;] </b>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <br /> <br />
        <br />
        <br />
        <br />
        <br />
        <button onclick="window.print()" id="printPageButton">Print this page</button>
    </section>
</div>