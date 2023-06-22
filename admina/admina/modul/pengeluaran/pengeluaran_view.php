<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data pengeluaran
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>pengeluaran">pengeluaran</a></li>
        <li class="active">pengeluaran List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="<?= base_index() ?>pengeluaran/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>
                        Tambah Deposit
                    </a>&nbsp;
                    <a href="<?= base_index() ?>pengeluaran/add" class="btn btn-danger">
                        <i class="fa fa-plus"></i>
                        Tambah Pengeluaran
                    </a>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px; text-align: center; vertical-align: middle;" align="center"
                                    rowspan="2">No</th>
                                <th style="text-align: center; vertical-align: middle;" colspan="2" rowspan="2">Tanggal
                                </th>
                                <th style="text-align: center; vertical-align: middle;" colspan="2" rowspan="2">Nama
                                </th>
                                <th style="text-align: center; vertical-align: middle;" colspan="2" rowspan="2">
                                    Keterangan</th>

                                <th style="text-align: center; vertical-align: middle;" colspan="2">Saldo</th>
                                </th>
                            </tr>
                            <tr>
                                <th style="text-align: center; vertical-align: middle;">Deposit</th>
                                <th style="text-align: center; vertical-align: middle;">Pengeluaran</th>
                                <th style="text-align: center; vertical-align: middle;" colspan="2" rowspan="2">Total
                                    Saldo
                                </th>
                                <th style="text-align: center; vertical-align: middle;" colspan="2" rowspan="2">Action
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $dtb = $db->query(
                                "Select *
                                from t_pengeluaran where sts_hapus='N' and pengajuan !='L' and status_aju='Y' group by id"
                            );
                            $no = 1;
                            /* 'tanggal' => $_POST['tanggal'],
                            'nama_p' => $_POST['nama_p'],
                            'jumlah' => $_POST['jumlah'],
                            'status' => $_POST['status'],
                            'keterangan' => $_POST['keterangan'],*/
                            $ids = $_SESSION['id_user'];

                            foreach ($dtb as $isi) {

                                $dpb = $isi->status_d;
                                $dpt = $isi->status_p;
                                if ($dpb == 1) {
                                    $dp = number_format(
                                        $isi->jumlah,
                                        2,
                                        ',',
                                        '.'
                                    );

                                    @$dp1 += $isi->jumlah;
                                    $rp = 'Rp.';
                                } else {
                                    $dp = '-';
                                    //$dp1 = 0;
                                    $rp = '';
                                }

                                if ($dpt == 1) {
                                    $dptt = number_format(
                                        $isi->jumlah,
                                        2,
                                        ',',
                                        '.'
                                    );
                                    @$dptt1 += $isi->jumlah;
                                    $rp1 = 'Rp.';
                                } else {
                                    $dptt = '-';
                                    //   $dptt1 = 0;
                                    $rp1 = '';
                                }
                                ?>
                            <td align="center"><?= $no ?></td>
                            <td colspan="2" style="text-align: left; vertical-align: middle;"><?= $isi->tanggal ?><br>
                                <small class="bg-info"><em>tanggal edit: <?= $isi->tgl_edit ?></em></small>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: middle;"><?= $isi->nama_p ?>
                            </td>
                            <td colspan="2" style="text-align: left; vertical-align: middle;">
                                <?= $isi->keterangan ?></td>
                            <td> <?= $rp ?>
                                <?= $dp ?></td>
                            <td><?= $rp1 ?>
                                <?= $dptt ?>
                            </td>
                            <td colspan="2" style="text-align: center; vertical-align: middle;">
                                Rp. <?= number_format(
                                    @$dp1 - @$dptt1,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                            <td colspan="2" style="text-align: center; vertical-align: middle;"> <a
                                    href="<?= base_index() ?>pengeluaran/edit/<?= $isi->id ?>"
                                    class="btn btn-primary btn-flat"><i class="fa fa-pencil"></i></a>
                                <button class="btn btn-danger btn-flat hapus"
                                    data-uri="<?= base_admin() ?>modul/pengeluaran/pengeluaran_action.php"
                                    data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>
                            </td>
                            </tr>
                            <?php $no++;
                            }
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->