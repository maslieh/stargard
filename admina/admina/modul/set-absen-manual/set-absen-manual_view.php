<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Setting GAJI
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>setgaji">set-gaji</a></li>
        <li class="active">set-gaji List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <?php
                    $i = 1;
                    $tah = date('Y');
                    $idc = $_SESSION['id_user'];
                    $dat = $db->fetch_custom_single("Select sum(lama) as jml from sys_users as p inner join t_peng_histori as h on p.id=h.id_pegawai
                                inner join t_pengajuan as y on h.pengajuan=.y.id AND p.id=$idc AND h.tahun=$tah group by p.id,h.tahun ");
                    //  foreach ($data as $dt) {
                    //     $i++;
                    //  }
                    if (@$dat->jml == '0') {
                        echo '  <a href="" class="btn btn-sm btn-flat btn-primary disabled" data-toggle="modal"
                        data-target="#modal-tambah"><i class="fa fa-plus"> </i> Tambah</a> ';
                    } else {
                        echo '
                              <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                        data-target="#modal-tambah"><i class="fa fa-plus"> </i> Tambah</a>';
                    }
                    ?>


                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Nama</th>
                                <th>Gaji Pokok</th>
                                <th>Gaji harian</th>
                                <th>Tunj Jabatan</th>
                                <th>Uang Makan</th>
                                <th>Uang transport</th>
                                <th>Uang Dinas</th>
                                <th>Uang overtime</th>
                                <th>Uang Insentif</th>
                                <th>Uang lembur</th>
                                <th>Uang lainnya</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';
                            $idp = $_SESSION['id_user'];
                            $lvl = $_SESSION['level'];
                            $dat = $db->fetch_custom_single(
                                "select *from sys_group_users where id=$lvl "
                            );

                            $dats = $db->fetch_custom_single(
                                "select *from sys_users where id=$idp "
                            );
                            $is = $dats->kode_jurusan;
                            //  echo $dat->level;

                            $dtb = $db->query(
                                'Select p.first_name,p.last_name,g.id,g.id_pegawai, g.tun_jabatan,
                                g.gaji,g.uang_makan,g.uang_transport,g.dinas,g.lainnya,g.lembur,g.insentif,g.overtime 
                                from sys_users as p inner join t_gaji as g on p.id=g.id_pegawai'
                            );

                            $no = 1;
                            foreach ($dtb as $isi) { ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= ucwords($isi->first_name) ?>
                                    <?= ucwords($isi->last_name) ?></td>

                                <td>Rp. <?= number_format(
                                        $isi->gaji * 26,
                                        2,
                                        ',',
                                        '.'
                                    ) ?></td>

                                <td>Rp. <?= number_format(
                                    $isi->gaji,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>
                                <td>Rp. <?= number_format(
                                    $isi->tun_jabatan,
                                    2,
                                    ',',
                                    '.'
                                ) ?></td>

                                <td>Rp. <?= number_format(
                                    $isi->uang_makan,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>
                                <td>Rp. <?= number_format(
                                    $isi->uang_transport,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>

                                <td>Rp. <?= number_format(
                                    $isi->dinas,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>

                                <td>Rp. <?= number_format(
                                    $isi->overtime,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>

                                <td>Rp. <?= number_format(
                                    $isi->insentif,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>

                                <td>Rp. <?= number_format(
                                    $isi->lembur,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>

                                <td>Rp. <?= number_format(
                                    $isi->lainnya,
                                    2,
                                    ',',
                                    '.'
                                ) ?> </td>
                                <td>


                                    <button class="btn btn-danger badge btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/setgaji/setgaji_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i></button>

                                    <a href="" class="btn badge btn-sm btn-flat btn-info" data-toggle="modal"
                                        data-target="#modal-tambah<?= $isi->id ?>" data-id="<?= $isi->id ?>"> <i
                                            class="fa fa-edit"></i></a>


                                </td>
                            </tr>

                            <div class="modal fade" id="modal-tambah<?= $isi->id ?>" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <form id="input" method="post" class="form-horizontal"
                                    action="<?= base_admin() ?>modul/setgaji/setgaji_action.php?act=up">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">SETTING GAJI </h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <h3>EDIT Data</h3>

                                                        <label for="Level User" class="control-label">Tunjangan
                                                            jabatan</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="jabatan" value="<?= $isi->tun_jabatan ?>"><br />


                                                        <label for="Level User" class="control-label">Gaji
                                                        </label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="gaji" value='<?= $isi->gaji ?>'><br />
                                                        <label for="Level User" class="control-label">Uang Makan</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="uang_makan" value='<?= $isi->uang_makan ?>'
                                                            id=""><br />
                                                        <label for="Level User" class="control-label">Uang
                                                            transport</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="uang_transport"
                                                            value='<?= $isi->uang_transport ?>'><br />
                                                        <label for="Level User" class="control-label">Ovetime</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="overtime" value='<?= $isi->overtime ?>'><br />
                                                        <label for="Level User" class="control-label">Insentif</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="insentif" value='<?= $isi->insentif ?>'><br />
                                                        <label for="Level User" class="control-label">Lembur</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="lembur" value='<?= $isi->lembur ?>'><br />
                                                        <label for="Level User" class="control-label">Dinas</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="dinas" value='<?= $isi->dinas ?>'><br />
                                                        <label for="Level User" class="control-label">Biayas
                                                            Lainnya</label>
                                                        <input type="text" class="form-control pull-right" required
                                                            name="lainnya" value='<?= $isi->lainnya ?>'><br />

                                                        <br />
                                                        <input type="hidden" class="form-control pull-right" required
                                                            name="id_pegawai" value='<?= $isi->id_pegawai ?>'><br />

                                                        <input type='hidden' name='id' value='<?= $isi->id ?>'>

                                                    </div>
                                                </div>

                                                <h6> <span class="badge bg-red">NOTE : Berikan angka 0 (nol) jika tidak
                                                        diisi</span></h6>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger pull-left"
                                                        data-dismiss="modal">Batal</button>
                                                    <input type="submit" class="btn btn-primary" value="simpan">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->

<div class="modal fade" id="modal-tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="input" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/setgaji/setgaji_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">SETTING GAJI </h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3> <label for="Level User" class="control-label">Nama </label>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <select name="id_pegawai" required data-placeholder="Pilih ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih</option>
                                        <?php foreach (
                                            $db->query(
                                                "select * from sys_users where id_jabatan !='3'"
                                            )
                                            as $isi
                                        ) {
                                            echo "<option value='$isi->id'>$isi->first_name $isi->last_name</option>";
                                        } ?>
                                    </select>
                                </div>
                            </div>


                            <label for="Level User" class="control-label">Tunjangan jabatan</label>
                            <input type="text" class="form-control pull-right" required name="jabatan" id=""><br />

                            <label for="Level User" class="control-label">Gaji harian</label>
                            <input type="text" class="form-control pull-right" required name="gaji" id=""><br />
                            <label for="Level User" class="control-label">Uang Makan</label>
                            <input type="text" class="form-control pull-right" required name="uang_makan" id=""><br />
                            <label for="Level User" class="control-label">Uang transport</label>
                            <input type="text" class="form-control pull-right" required name="uang_transport"
                                id=""><br />
                            <label for="Level User" class="control-label">Ovetime</label>
                            <input type="text" class="form-control pull-right" required name="overtime" id=""><br />
                            <label for="Level User" class="control-label">Insentif</label>
                            <input type="text" class="form-control pull-right" required name="insentif" id=""><br />
                            <label for="Level User" class="control-label">Lembur</label>
                            <input type="text" class="form-control pull-right" required name="lembur" id=""><br />
                            <label for="Level User" class="control-label">Dinas</label>
                            <input type="text" class="form-control pull-right" required name="dinas" id=""><br />
                            <label for="Level User" class="control-label">Biaya Lainnya</label>
                            <input type="text" class="form-control pull-right" required name="lainnya" id=""><br />

                            <br />
                        </div>
                    </div>

                    <h6> <span class="badge bg-red">NOTE : Berikan angka 0 (nol) jika tidak diisi</span></h6>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Batal</button>
                        <input type="submit" class="btn btn-primary" value="simpan">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>