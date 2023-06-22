                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Manage Data Pegawai dan Teknisi
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="<?= base_index() ?>pegawai">Data Pegawai dan Teknisi</a></li>
                        <li class="active">Data Pegawai dan Teknisi List </li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <a href="<?= base_index() ?>pegawai/tambah" class="btn btn-primary"><i
                                            class="fa fa-plus"></i>
                                        Tambah</a>
                                </div>
                                <div class="box-header">

                                    <form action="" method="get" class="form_cari">
                                        <div class="input-group col-lg-6">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button">Pencarian !</button>
                                            </span>
                                            <input type="text" name="q" class="form-control" placeholder="Search..." />
                                            <span class="input-group-btn">
                                                <button type="submit" id="search-btn" class="btn btn-flat"><i
                                                        class="fa fa-search"></i></button>
                                            </span>
                                        </div>
                                    </form>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width:25px" align="center">No</th>
                                                <th>ID</th>
                                                <th width='150px'>Nama</th>
                                                <th>Asal</th>
                                                <th>Gender</th>
                                                <th>Agama</th>
                                                <th width='250px'>Alamat</th>
                                                <th>No Telepon</th>
                                                <th>Jabatan</th>
                                                <th>Kantor Cabang</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $limit = 10;
                                            $search = '';
                                            if (isset($_GET['q'])) {
                                                $search_condition = $db->getRawWhereFilterForColumns(
                                                    $_GET['q'],
                                                    [
                                                        'first_name',
                                                        'last_name',
                                                        'email',
                                                        'jabatan',
                                                        'agama',
                                                        'jenkel',
                                                        'nama',
                                                    ]
                                                );
                                                $search = "and $search_condition";
                                            }

                                            $dtb = $pg->myquery(
                                                "select nama,sys_users.aktif,sys_users.username,sys_users.jenkel,sys_users.agama,
                                            sys_users.email,sys_group_users.level,sys_users.id,	t_jabatan.jabatan,sys_users.alamat,
                                            sys_users.first_name,sys_users.last_name, sys_users.temp_lahir,sys_users.no_tlp,
                                            nama from sys_users  inner join sys_group_users on 
                                            sys_users.id_group=sys_group_users.id left join t_cabang on 
                                            sys_users.kode_jurusan=t_cabang.id
                                            left join t_jabatan on sys_users.id_jabatan=t_jabatan.id_jabatan where t_jabatan.jabatan != 'sales' 
                                            $search",
                                                $limit
                                            );
                                            $no = $pg->Num($limit);
                                            $count = $pg->Num($limit);
                                            if ($dtb->rowCount() < 1) {
                                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                                            }
                                            foreach (
                                                $dtb
                                                as $isi
                                            ) { ?><tr id="line_<?= $isi->id ?>">
                                                <td align="center"><?= $no ?></td>
                                                <td align="center"><?= $isi->id ?></td>
                                                <td><?= $isi->first_name ?>
                                                    <?= $isi->last_name ?></td>
                                                <td><?= $isi->temp_lahir ?></td>
                                                <td>
                                                    <?php if (
                                                        $isi->jenkel == 'P'
                                                    ) {
                                                        $jk = 'Perempuan';
                                                    } elseif (
                                                        $isi->jenkel == 'L'
                                                    ) {
                                                        $jk = 'Laki-laki';
                                                    } else {
                                                        $jk = 'Belum dipilih';
                                                    } ?>
                                                    <?= $jk ?>
                                                </td>
                                                <td><?php if (
                                                    $isi->agama == 'I'
                                                ) {
                                                    $ag = 'Islam';
                                                } elseif ($isi->agama == 'K') {
                                                    $ag = 'Katolik';
                                                } elseif ($isi->agama == 'P') {
                                                    $ag = 'Protestan';
                                                } elseif ($isi->agama == 'B') {
                                                    $ag = 'Budha';
                                                } elseif ($isi->agama == 'H') {
                                                    $ag = 'Hindu';
                                                } elseif ($isi->agama == 'KH') {
                                                    $ag = 'Khonghuchu';
                                                } else {
                                                    $ag = 'Lainnya';
                                                } ?>
                                                    <?= $ag ?></td>
                                                <td><?= $isi->alamat ?></td>
                                                <td><?= $isi->no_tlp ?></td>
                                                <td><?= $isi->jabatan ?></td>
                                                <td><?= $isi->nama ?></td>
                                                <td>
                                                    <a href="<?= base_index() ?>pegawai/detail/<?= $isi->id ?>"
                                                        class="btn btn-success"><i class="fa fa-eye"></i></a>
                                                    <a href="<?= base_index() ?>pegawai/edit/<?= $isi->id ?>"
                                                        class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                                                    <button class="btn btn-danger hapus"
                                                        data-uri="<?= base_admin() ?>modul/pegawai/pegawai_action.php"
                                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i></button>
                                                </td>
                                            </tr>
                                            <?php $no++;}
                                            ?>
                                        </tbody>
                                    </table>
                                    <div class="col-xs-6" style="margin-top:10px"> Showing
                                        <?= $count ?> to <?= $no - 1 ?> of
                                        <?= $pg->total_record ?> entries

                                    </div>

                                    <div class="col-xs-6">

                                        <?php
                                        if (isset($_GET['q'])) {
                                            $pg->url =
                                                base_index() .
                                                'pegawai?q=' .
                                                $_GET['q'] .
                                                '&page=';
                                        }
                                        $pg->setParameter([
                                            'range' => $limit,
                                        ]);
                                        ?>

                                        <div class="dataTables_paginate paging_bootstrap">
                                            <ul class="pagination">
                                                <?= $pg->create() ?>
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>