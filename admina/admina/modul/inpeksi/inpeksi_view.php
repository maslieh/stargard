<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data inpeksi
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>inpeksi">inpeksi</a></li>
        <li class="active">inpeksi List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">

                    <form action="" method="get" class="form_cari">
                        <div class="input-group col-lg-6">
                            <span class="input-group-btn">

                                <a href="<?= base_index() ?>inpeksi/tambah" class="btn btn-primary"><i
                                        class="fa fa-plus"></i> Tambah</a>
                            </span>
                        </div>
                    </form>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Paket</th>
                                <th>Tipe</th>
                                <th>Teknisi 1</th>
                                <th>Teknisi 2</th>
                                <th>Teknisi 3</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;

                            $dtb = $db->query(
                                "select  t.id, p.nama,s.tipe,t.id_teknisi1,t.id_teknisi2,t.id_teknisi3
                                 from t_teknisi as t, t_paket as p, t_tipe s where p.id=t.id_paket and p.tipe=s.id  "
                            );

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->nama ?></td>
                                <td><?= $isi->tipe ?></td>
                                <td><?php
                                $t = $isi->id_teknisi1;

                                if ($t > 0) {
                                    $s = $db->fetch_single_row(
                                        'sys_users',
                                        'id',
                                        $t
                                    );
                                    $nama111 = $s->first_name;
                                    $nama211 = $s->last_name;
                                } else {
                                    $nama111 = 'Tidak';
                                    $nama211 = 'Ada';
                                }
                                ?>
                                    <?= $nama111 ?> <?= $nama211 ?></td>
                                <td><?php
                                $te = $isi->id_teknisi2;

                                if ($te > 0) {
                                    $t2 = $db->fetch_single_row(
                                        'sys_users',
                                        'id',
                                        $te
                                    );
                                    $nama11 = $t2->first_name;
                                    $nama21 = $t2->last_name;
                                } else {
                                    $nama11 = 'Tidak';
                                    $nama21 = 'Ada';
                                }
                                ?>
                                    <?= $nama11 ?> <?= $nama21 ?></td>
                                <td><?php
                                $te3 = $isi->id_teknisi3;

                                if ($te3 > 0) {
                                    $t3 = $db->fetch_single_row(
                                        'sys_users',
                                        'id',
                                        $te3
                                    );
                                    $nama1 = $t3->first_name;
                                    $nama2 = $t3->last_name;
                                } else {
                                    $nama1 = 'Tidak';
                                    $nama2 = 'Ada';
                                }
                                ?>
                                    <?= $nama1 ?> <?= $nama2 ?></td>
                                <td><a href="<?= base_index() ?>inpeksi/edit/<?= $isi->id ?>"
                                        class="btn btn-primary btn-flat"><i class="fa fa-pencil"></i></a> <button
                                        class="btn btn-danger btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/inpeksi/inpeksi_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>
                                </td>
                            </tr>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>

                </div>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
    </div>

</section><!-- /.content -->