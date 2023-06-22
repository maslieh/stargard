<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Setting Pengajuan CUTI
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>ajukan">ajukan CUTI</a></li>
        <li class="active">ajukan List</li>
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
                                <th>Tanggal</th>
                                <th>Lama Cuti</th>
                                <th>Tanggal Cuti</th>
                                <th>Status</th>
                                <th>Keterangan</th>
                                <th>Periode</th>
                                <th>Sisa Cuti</th>
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
                            if ($dat->level == 'administrator') {
                                $dtb = $db->query(
                                    "Select *,sum(lama) as total,h.id as idd from sys_users as p inner join t_peng_histori as h on p.id=h.id_pegawai
                                inner join t_pengajuan as y on h.pengajuan=.y.id where y.kode='C'  group by h.tgl_pengajuan,h.kode order by h.tgl_pengajuan DESC"
                                );
                            } elseif ($dat->level == 'admin') {
                                $dtb = $db->query(
                                    "Select *,sum(lama) as total,h.id as idd from sys_users as p inner join t_peng_histori as h on p.id=h.id_pegawai
                                inner join t_pengajuan as y on h.pengajuan=.y.id where y.kode='C' and p.kode_jurusan=$is  group by h.tgl_pengajuan,h.kode order by h.tgl_pengajuan DESC"
                                );
                            } else {
                                $dtb = $db->query(
                                    "Select *,sum(lama) as total,h.id as idd from sys_users as p inner join t_peng_histori as h on p.id=h.id_pegawai
                                inner join t_pengajuan as y on h.pengajuan=.y.id where y.kode='C' AND h.id_pegawai=$idp group by h.tgl_pengajuan,h.id_pegawai,h.kode  order by h.tgl_pengajuan DESC"
                                );
                            }
                            $no = 1;
                            foreach ($dtb as $isi) {

                                @$sum += $isi->lama;
                                $sisa = $isi->batas - $sum;
                                if ($isi->status_pengajuan == 'Y') {
                                    $status =
                                        '<span class="badge bg-green">Disetujui</span>  ';
                                } elseif ($isi->status_pengajuan == 'T') {
                                    $status =
                                        '<span class="badge bg-blue">Disposisi</span> ';
                                } elseif ($isi->status_pengajuan == 'N') {
                                    $status =
                                        '<span class="badge bg-red">Ditolak</span>';
                                } else {
                                    $status =
                                        '<span class="badge bg-yellow">Pending</span>';
                                }
                                ?>
                            <tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= ucwords($isi->first_name) ?>
                                    <?= ucwords($isi->last_name) ?></td>
                                <td><?= tgl_indo($isi->tgl_pengajuan) ?></td>
                                <td><?= $isi->lama ?> hari</td>
                                <td><?= date(
                                    'd-m-Y',
                                    strtotime($isi->mulai)
                                ) ?> s/d
                                    <?= date(
                                        'd-m-Y',
                                        strtotime($isi->akhir)
                                    ) ?> </td>
                                <td>
                                    <?= $status ?> -
                                    <?= tgl_indo($isi->tgl_update) ?> </td>
                                <td><?= $isi->keterangan_p ?></td>
                                <td><?= $isi->tahun ?> </td>
                                <td><?= $isi->sisa ?> </td>
                                <td>

                                    <?php
                                    $le = $_SESSION['level'];
                                    $lev = $db->fetch_custom_single(
                                        "select*from sys_group_users where id=$le"
                                    );
                                    if ($lev->level == 'administrator') { ?>
                                    <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                                        data-target="#modal-<?= $isi->idd ?>"> <i class="fa fa-pencil"> </i></a>
                                    <a href="" class="btn btn-sm btn-flat btn-danger" data-toggle="modal"
                                        data-target="#modal<?= $isi->idd ?>"> <i class="fa fa-trash-o"> </i></a>


                                    <?php } elseif ($lev->level == 'admin') { ?>
                                    <a href="" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"
                                        data-target="#modal-<?= $isi->idd ?>"> <i class="fa fa-pencil"> </i></a>
                                    <a href="" class="btn btn-sm btn-flat btn-danger" data-toggle="modal"
                                        data-target="#modal<?= $isi->idd ?>"> <i class="fa fa-trash-o"> </i></a>

                                    <?php } else {if (
                                            $isi->status_pengajuan == 'A'
                                        ) { ?>

                                    <a href="" class="btn btn-sm btn-flat btn-danger" data-toggle="modal"
                                        data-target="#modal<?= $isi->idd ?>"> <i class="fa fa-trash-o"> </i></a>

                                    <?php } else { ?>
                                    <a href="" class="btn btn-sm btn-flat btn-danger" data-toggle="modal"
                                        data-target="#modal<?= $isi->idd ?>"> <i class="fa fa-trash-o"> </i></a>

                                    <?php }}
                                    ?>
                                </td>
                                <div class="modal fade" id="modal-<?= $isi->idd ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">EDIT PENGAJUAN</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/ajukan/ajukan_action.php?act=up">
                                                            <div class="form-group">
                                                                <label for="First Name" class="control-label">
                                                                    Nama Pengajuan</label>
                                                                <div class="">
                                                                    <input type="text" id="nama" name="nama"
                                                                        placeholder="First Name"
                                                                        value="<?= $isi->nama ?>" disabled
                                                                        class="form-control">
                                                                    <input type="hidden" name="id"
                                                                        value="<?= $isi->idd ?>">
                                                                    <input type="hidden" name="lama"
                                                                        value="<?= $isi->lama ?>">
                                                                    <input type="hidden" name="sisa"
                                                                        value="<?= $isi->sisa ?>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Deskripsi" class="control-label ">
                                                                    Konfirmasi</label>
                                                                <div>
                                                                    <select name="sts" class="form-control chzn-select"
                                                                        tabindex="2">
                                                                        <option value="">Pilih</option>
                                                                        <option value="Y">Setuju</option>
                                                                        <option value="T">Review</option>
                                                                        <option value="N">Tolak</option>

                                                                    </select>
                                                                </div>
                                                            </div><!-- /.form-group --><br />


                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger pull-left"
                                                                    data-dismiss="modal">Batal</button>
                                                                <input type="submit" class="btn btn-primary"
                                                                    value="simpan">
                                                            </div>
                                                        </form>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="modal fade" id="modal<?= $isi->idd ?>" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">Hapus data</h4>
                                                <div class="modal-body">
                                                    <div class="box-body">
                                                        <form id="update" method="post" class="form-horizontal"
                                                            action="<?= base_admin() ?>modul/ajukan/ajukan_action.php?act=del">
                                                            <div class="form-group">
                                                                <hr>
                                                                <label for="First Name" class="control-label">
                                                                    Apakah Anda ingin menghapus data ini? </label>

                                                                <input type="hidden" name="id" value="<?= $isi->idd ?>">
                                                            </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger pull-left"
                                                            data-dismiss="modal">Batal</button>
                                                        <input type="submit" class="btn btn-primary" value="simpan">
                                                    </div>
                                                    </form>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                </div>
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

<div class="modal fade" id="modal-tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form id="input" method="post" class="form-horizontal"
        action="<?= base_admin() ?>modul/ajukan/ajukan_action.php?act=in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">SETTING PENGAJUAN </h4>
                    <div class="modal-body">
                        <div class="box-body">
                            <h3>Input Data</h3> <label for="Level User" class="control-label">Nama pengajuan</label>
                            <div class="form-group">

                                <div class="col-lg-12">
                                    <select name="pengajuan" required data-placeholder="Pilih Pengajuan ..."
                                        class="form-control pull-right" tabindex="2">
                                        <option value="">Pilih Pengajuan</option>
                                        <?php foreach (
                                            $db->query(
                                                "select * from t_pengajuan where kode like'%C%' "
                                            )
                                            as $isi
                                        ) {
                                            echo "<option value='$isi->id'>$isi->nama</option>";
                                        } ?>
                                    </select>
                                </div>
                            </div>

                            <label for="Level User" class="control-label">Jumlah Hari</label>
                            <input type="hidden" class="form-control pull-right" name="jml" value="<?= @$datas->jml ?>"
                                id="">
                            <input type="hidden" class="form-control pull-right" name="kode" value="C" id=""><br />
                            <input type="text" class="form-control pull-right" required name="jml_hari" id=""><br />
                            <label for="Level User" class="control-label">Mulai</label>
                            <input type="text" class="form-control pull-right date" required name="mulai" id=""><br />
                            <label for="Level User" class="control-label">Sampai</label>
                            <input type="text" class="form-control pull-right date" required name="sampai" id=""><br />
                            <input type="hidden" class="form-control pull-right" name="status" value="A" id=""><br />
                            <label for="Level User" class="control-label">Keterangan</label>
                            <input type="text" class="form-control pull-right" name="keterangan" id=""><br />
                            <input type="hidden" class="form-control pull-right" name="id" value="<?= $_SESSION[
                                'id_user'
                            ] ?>" id=""><br />
                        </div>
                    </div>

                    <h6> <span class="badge bg-red">NOTE : Pilih tanggal yang sama untuk satu hari</span></h6>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Batal</button>
                        <input type="submit" class="btn btn-primary" value="simpan">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>