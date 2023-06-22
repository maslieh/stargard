                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Waranti
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="<?= base_index() ?>warannti">Data waranti</a></li>
                        <li class="active">Data Waranti </li>
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
                                                <button class="btn btn-default" type="button">Pencarian ssss!</button>
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
                                    <table id="dtb_manuail" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width:25px" align="center">No</th>
                                                <th>No Waranti</th>
                                                <th>Nama Customer</th>
                                                <th>Kendaraan</th>
                                                <th>Jenis pekrejaan </th>
                                                <th>Batas Tgl Waranti</th>
                                                <th>Tanggal Realisasi</th>
                                                <th>Tanggal booking</th>
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
                                                        'nama',
                                                        'waranti',
                                                        'no_rangka',
                                                        'no_polisi',
                                                    ]
                                                );
                                                $search = "and $search_condition";
                                            }
                                            $no = 1;

                                            $dtb = $pg->myquery(
                                                "select *,c.nama as nama_p, a.nama as nama_m,a.id as idt from t_transaksi as a , t_garansi as b,
                                                t_paket as c 
                                                where  a.waranti=b.id_data and a.id_teknisi=c.id and a.sts_book='Y' and sts_hapus='N'
                                         $search   order by a.id DESC",
                                                $limit
                                            );
                                            $no = $pg->Num($limit);
                                            $count = $pg->Num($limit);
                                            if ($dtb->rowCount() < 1) {
                                                echo "<tr><td colspan='5'>No matching records found</td></tr>";
                                            }
                                            foreach ($dtb as $isi) {
                                                $sisa =
                                                    $isi->batas -
                                                    $isi->terpakai; ?>
                                            <tr id="line_<?= $isi->id ?>">
                                                <td align="center"><?= $no ?></td>
                                                <td><?= $isi->waranti ?></td>
                                                <td><?= $isi->nama_m ?></td>
                                                <td><?= $isi->jns_kendaraan ?></td>
                                                <td><?= $isi->nama_p ?></td>
                                                <td><?= tgl_indo(
                                                    $isi->tgl_mulai
                                                ) ?> s/d
                                                    <?= tgl_indo(
                                                        $isi->tgl_akhir
                                                    ) ?></td>
                                                <td><?= tgl_indo(
                                                    $isi->tgl
                                                ) ?></td>
                                                <td><?= tgl_indo(
                                                    $isi->tgl_booking
                                                ) ?></td>
                                                <td width="150">
                                                    <a href="" class="btn btn-sm btn-info" data-toggle="modal"
                                                        data-target="#modal-<?= $isi->waranti ?>"><i
                                                            class='fa fa-calendar'></i></a>

                                                    <!--  <a href="waranti/print/<?= $isi->waranti ?>"
                                                        class="btn btn-sm btn-warning"> <i class="fa fa-print"></i></a>-->
                                                    <a href="waranti/histori/<?= $isi->waranti ?>"
                                                        class="btn btn-sm btn-success"> <i
                                                            class="fa  fa-bar-chart   "></i></a>
                                                    <div class="modal fade" id="modal-<?= $isi->waranti ?>"
                                                        tabindex="-1" aria-labelledby="exampleModalLabel"
                                                        aria-hidden="true">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/waranti/waranti_action.php?act=up">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">

                                                                    <div class="modal-header">
                                                                        <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                            <span
                                                                                aria-hidden="true">&times;</span></button>
                                                                        <h4 class="modal-title">Data waranti</h4>

                                                                    </div>

                                                                    <div class="modal-body">
                                                                        <div class="box-body">
                                                                            <label for="Level User"
                                                                                class="control-label">No
                                                                                Waranti</label>
                                                                            <div class="input-group">

                                                                                <span class="input-group-addon"><i
                                                                                        class="fa fa-star-o"></i></span>
                                                                                <input type="text" name="id_data"
                                                                                    class="form-control" readonly
                                                                                    value="<?= $isi->waranti ?>"
                                                                                    placeholder="Waranti">
                                                                                <input type="hidden" name="idt"
                                                                                    class="form-control"
                                                                                    value="<?= $isi->idt ?>"
                                                                                    placeholder="Waranti">
                                                                                <input type="hidden" name="id"
                                                                                    class="form-control"
                                                                                    value="<?= $isi->id ?>"
                                                                                    placeholder="Waranti">
                                                                            </div><br><br>
                                                                            <label for="Level User"
                                                                                class="control-label">Batas
                                                                                Waranti</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon"><i
                                                                                        class="fa fa-hourglass-1"></i></span>
                                                                                <input type="text" name="batas"
                                                                                    class="form-control"
                                                                                    value="<?= $isi->batas ?>"
                                                                                    placeholder="Username">
                                                                            </div><br><br>
                                                                            <label>Terpakai</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon"><i
                                                                                        class="fa fa-hourglass-3"></i></span>
                                                                                <input type="text" name="terpakai"
                                                                                    class="form-control"
                                                                                    value="<?= $isi->terpakai ?>"
                                                                                    placeholder="Username">
                                                                            </div><br><br>
                                                                            <label>Batas Tanggal waranti</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date"><i
                                                                                        class="fa fa-calendar"></i>
                                                                                </span>
                                                                                <input type="text"
                                                                                    class="form-control pull-right date"
                                                                                    value="<?= $isi->tgl_mulai ?>"
                                                                                    name="tgl_mulai" id=" datepicker">
                                                                            </div>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date"><i
                                                                                        class="fa fa-calendar"></i>
                                                                                </span>
                                                                                <input type="text"
                                                                                    class="form-control pull-right date"
                                                                                    value="<?= $isi->tgl_akhir ?>"
                                                                                    name="tgl_akhir" id="datepicker">
                                                                            </div><br><br>
                                                                            <!-- <label>Tanggal booking</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date"><i
                                                                                        class="fa fa-calendar"></i>
                                                                                </span>
                                                                                <input type="text" name="tgl_booking"
                                                                                    class="form-control pull-right date"
                                                                                    value="<?= $isi->tgl ?>"
                                                                                    id="datepicker">
                                                                            </div>
                                                                            <br><br>-->

                                                                            <label>Jadwal</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date"><i
                                                                                        class="fa fa-calendar"></i>
                                                                                </span>
                                                                                <input type="text" name="tgl_pakai"
                                                                                    class="form-control pull-right date"
                                                                                    value="<?= $isi->tgl ?>"
                                                                                    id="datepicker">
                                                                            </div>
                                                                            <br><br> <label>Harga</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date">
                                                                                </span>
                                                                                <input type="text" name="harga_w"
                                                                                    placeholder="1000000"
                                                                                    class="form-control pull-right">
                                                                            </div>
                                                                            <br><br> <label>keterangan</label>
                                                                            <div class="input-group">
                                                                                <span class="input-group-addon date">
                                                                                </span>
                                                                                <textarea type="text" name="keterangan"
                                                                                    class="form-control pull-right"></textarea>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button"
                                                                            class="btn btn-default pull-left"
                                                                            data-dismiss="modal">Close</button>
                                                                        <input type="submit" class="btn btn-primary"
                                                                            value="submit">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>



                                                </td>
                                            </tr>
                                            <?php $no++;
                                            }
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
                    <!-- HISTORY-->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <label>HISTORI</label>

                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="dtb_manual" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width:25px" align="center">No</th>
                                                <th>No Waranti</th>
                                                <th>Tanggal Service</th>
                                                <th>Kendaraan</th>
                                                <th>Keterangan</th>
                                                <th>Tgl Input</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 1;
                                            $search = '';

                                            $dtb = $db->query(
                                                "select * from t_transaksi,t_garansi,t_history where  
                                                t_transaksi.waranti=t_garansi.id_data
                                                and t_history.waranti=t_transaksi.waranti order by t_history.id DESC
                                            "
                                            );

                                            foreach ($dtb as $isi) {
                                                $sisa =
                                                    $isi->batas -
                                                    $isi->terpakai; ?>
                                            <tr id="line_<?= $isi->id ?>">
                                                <td align="center"><?= $no ?></td>
                                                <td><?= $isi->waranti ?></td>
                                                <td><?= $isi->tgl_pakai ?></td>
                                                <td><?= $isi->jns_kendaraan ?></td>
                                                <td> <?= $isi->keterangan ?></td>
                                                <td> <?= $isi->tgl_time ?></td>

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
                </section>