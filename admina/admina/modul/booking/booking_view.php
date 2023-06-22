<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data booking
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>booking">booking</a></li>
        <li class="active">booking List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="<?= base_index() ?>booking/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Tambah
                    </a>
                    <hr />
                </div><!-- /.box-header -->

                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Tanggal Booking</th>
                                <th>No Waranti</th>
                                <th>Nama</th>
                                <th>Sales</th>
                                <th colspan='2'>Jenis pekerjaan</th>

                                <th>Nama Kendaraan</th>

                                <th>Booking</th>
                                <th>Waktu Server</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>


                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';

                            $dtb = $db->query(
                                "SELECT *,p.booking, p.id, p.nama as nama_p,p.waranti,p.alamat,p.tlp,p.jns_kendaraan,p.no_polisi,t.harga,p.diskon,p.total_b,t.nama as paket
                                 FROM `t_transaksi` as p, sys_users as u,t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id and p.sts_book='N' and sts_hapus='N' and u.id=p.id_sales order by p.tgl_booking ASC"
                            );
                            $no = 1;

                            foreach ($dtb as $isi) {

                                @$tob += $isi->booking;
                                $day = date('D', strtotime($isi->tgl_booking));
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
                                $date = date('l');
                                $tek1 = $isi->tek1;
                                $tek2 = $isi->tek2;
                                $tek3 = $isi->tek3;
                                $tek4 = $isi->tek4;
                                $rp1 = $db->fetch_custom_single(
                                    "SELECT * FROM sys_users
                                  where id='$tek1'"
                                );
                                $rp2 = $db->fetch_custom_single(
                                    "SELECT * FROM sys_users
                                  where id='$tek2'"
                                );
                                $rp3 = $db->fetch_custom_single(
                                    "SELECT * FROM sys_users
                                  where id='$tek3'"
                                );
                                $rp4 = $db->fetch_custom_single(
                                    "SELECT * FROM sys_users
                                  where id='$tek4'"
                                );
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $hari ?>,
                                    <?= tgl_indo($isi->tgl_booking) ?>
                                </td>
                                <td><?= $isi->waranti ?></td>
                                <td><?= $isi->nama_p ?></td>
                                <td><?= $isi->first_name ?> <?= $isi->last_name ?> </td>

                                <td><?= $isi->paket ?></td>
                                <td>
                                    <ul>
                                        <li><?= @$rp1->first_name ?> <?= @$rp1->last_name ?></li>
                                        <li> <?= @$rp2->first_name ?> <?= @$rp2->last_name ?> </li>
                                        <li> <?= @$rp3->first_name ?> <?= @$rp3->last_name ?> </li>
                                        <li> <?= @$rp4->first_name ?> <?= @$rp4->last_name ?> </li>
                                    </ul>
                                </td>
                                <td><?= $isi->jns_kendaraan ?></td>


                                <td>Rp. <?= number_format(
                                    @$isi->booking,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td><?= $isi->tgl_server ?> </td>
                                <td>

                                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                        data-target="#modal-default-<?= $isi->id ?>">
                                        <i class="fa fa-check"></i>
                                    </button>
                                </td>
                                <td>
                                    <a href="booking/cetak/<?= $isi->waranti ?>" class="btn btn-sm btn-info"> <i
                                            class="fa fa-print"></i></a>
                                    <a href="https://wa.me/62<?= $isi->tlp ?>?text= %0ASelamat%20Siang%20Bapak%2FIbu%20*<?= $isi->nama_p ?>*%20pemilik%20kendaraan%20*<?= $isi->jns_kendaraan ?>*%20Perkenalkan%20saya%20%20dari%20admin%20*Stargard*%20%20%0A%0ASebelum%20nya%20kami%20ucapkan%20terimakasih%20sudah%20melakukan%20pembayaran%20%2F%20booking%20jadwal%20kepada%20kami%20%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%0AKami%20informasikan%20Kepada%20bapak%2FIbu%20untuk%20proses%20kendaraan%20nya%20akan%20dilakukanya%20pengerjaan%20*<?= $isi->paket ?>*%20Pada%20hari%20*<?= $hari ?>,%20<?= tgl_indo(
    $isi->tgl_booking
) ?>*%0A%0AMohon%20untuk%20Ketersediaan%20waktu%20nya%20%0A%0ATerimakasih%F0%9F%98%8A%F0%9F%99%8F" target="_blank"
                                        class="btn btn-success btn-sm"><i class="fa fa-whatsapp"></i></a>
                                    <a href="<?= base_index() ?>booking/detail/<?= $isi->id ?>"
                                        class="btn btn-warning btn-sm "><i class="fa fa-eye"></i></a> <a
                                        href="<?= base_index() ?>booking/edit/<?= $isi->id ?>"
                                        class="btn btn-primary btn-sm"><i class="fa fa-pencil"></i></a>



                                    <div class="modal fade" id="modal-default-<?= $isi->id ?>">

                                        <form id="update" method="post" class="form-horizontal"
                                            action="<?= base_admin() ?>modul/booking/booking_action.php?act=up1">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Ubah Status</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Apakah Anda ingi mengubah status <?= $isi->jns_kendaraan ?>?
                                                        </p>
                                                        <input type='hidden' value='<?= $isi->id ?>' name='id'>
                                                        <input type='hidden' value='Y' name='status'>

                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" required name="status_bayar"
                                                                    id="optionsRadios1" value="T">Belum Bayar
                                                            </label>
                                                        </div>&nbsp;
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" required name="status_bayar"
                                                                    id="optionsRadios2" value="B">Sudah Bayar
                                                            </label>
                                                        </div>
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

                                    <button class="btn btn-danger btn-sm hapus"
                                        data-uri="<?= base_admin() ?>modul/booking/booking_action.php"
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
                                <td></td>
                                <td></td>
                                <td><b>Total</b></td>
                                <td><b>Rp. <?= number_format(
                                    @$tob,
                                    2,
                                    ',',
                                    '.'
                                ) ?></b></td>
                                <td></td>
                                <td></td>
                                <td></td>

                            </tr>

                        </tbody>
                    </table>




                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->