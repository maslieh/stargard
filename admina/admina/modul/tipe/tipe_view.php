<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Manage Data tipe
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>tipe">tipe</a></li>
        <li class="active">tipe List</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <a href="<?= base_index() ?>tipe/tambah" class="btn btn-primary"><i class="fa fa-plus"></i>

                        Tambah
                    </a>
                    <hr />
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="dtb_manual" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width:25px" align="center">No</th>
                                <th>Nama</th>
                                <th>aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $limit = 10;
                            $search = '';

                            $dtb = $db->query('select id,tipe from t_tipe  ');
                            $no = 1;

                            foreach (
                                $dtb
                                as $isi
                            ) { ?><tr id="line_<?= $isi->id ?>">
                                <td align="center"><?= $no ?></td>
                                <td><?= $isi->tipe ?></td>
                                <td> <a href="<?= base_index() ?>tipe/edit/<?= $isi->id ?>"
                                        class="btn btn-primary btn-flat"><i class="fa fa-pencil"></i></a> <button
                                        class="btn btn-danger btn-flat hapus"
                                        data-uri="<?= base_admin() ?>modul/tipe/tipe_action.php"
                                        data-id="<?= $isi->id ?>"><i class="fa fa-trash-o"></i> </button>
                                </td>
                            </tr>
                            <?php $no++;}
                            ?>
                        </tbody>
                    </table>



                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>


</section><!-- /.content -->