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
                            <input type="text" name="mulai" class="form-control date" value='<?= $mulai ?>'
                                placeholder="yyyy-mm-dd" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"> s/d </button>
                            </span>
                            <input type="text" name="dari" class="form-control date" value='<?= $dari ?>'
                                placeholder="yyyy-mm-dd" />

                            <span class="input-group-btn">
                                <button type="submit" id="search-btn" class="btn btn-success btn-flat">Submit</button>
                            </span>
                            <span class="input-group-btn">
                                <a href="<?= base_index() ?>restore" class="btn btn-info">Reset</a>
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
                                <th>No Waranti </th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>No Telepon</th>
                                <th>Nama Kendaraan</th>
                                <th>No Polisi</th>
                                <th>Harga</th>
                                <th>Diskon</th>
                                <th>Bayar</th>
                                <th>Tanggal <?= $mulai ?> <?= $dari ?></th>
                                <th>Action</th>
                            </tr>


                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            //$mulai = $_REQUEST['mulai'];
                            $dtb = $db->query(
                                "SELECT p.id,p.tgl,p.tgl_server, p.nama,p.waranti,p.alamat,p.tlp,p.jns_kendaraan,p.no_polisi,t.harga,p.diskon,p.total_b
                                 FROM `t_transaksi` as p, t_paket as t, t_tipe as e where p.id_teknisi=t.id and t.tipe=e.id  
                                and p.tgl BETWEEN '$mulai' and '$dari'
                                 and p.sts_book='Y' AND sts_hapus='Y' order by waranti DESC; "
                            );
                            $no = 1;

                            foreach ($dtb as $isi) {

                                @$tob += $isi->harga;
                                $total_b = $isi->harga - $isi->diskon;
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->waranti ?> </td>
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
                                        target="_blank" class="btn btn-success btn-flat"><i
                                            class="fa fa-whatsapp"></i></a>
                                    <a href="<?= base_index() ?>restore/detail/<?= $isi->id ?>"
                                        class="btn btn-warning btn-flat"><i class="fa fa-eye"></i></a> <a
                                        href="<?= base_index() ?>restore/edit/<?= $isi->id ?>"
                                        class="btn btn-primary btn-flat"><i class="fa fa-pencil"></i></a>
                                    <button class="btn btn-danger btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/restore/restore_action.php"
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

                            </tr>

                        </tbody>
                    </table>




                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->