<?php
session_start();
include '../../inc/config.php';
//session_check_adm();
switch ($_GET['act']) {
    case 'del':
        $id = $_POST['id'];
        $del = $db->delete('t_peng_histori', 'id', $id);
        if ($del = true) {
            echo ' <script>
                alert("Data Berhasil Dihapus");
                 window.location.replace("' .
                base_admin() .
                'index.php/ajukan' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    case 'in':
        $pengajuan = $_POST['pengajuan'];
        $status_pengajuan = $_POST['status'];
        $tgl_pengajuan = date('Y-m-d');
        $tgl_update = date('Y-m-d');
        $id_pegawai = $_POST['id'];
        $mulai = $_POST['mulai'];
        $kode = $_POST['kode'];
        $akhir = $_POST['sampai'];
        $lama = $_POST['jml_hari'];
        $keterangan_p = $_POST['keterangan'];
        //$sisa = $_POST['sisa'];
        $tahun = date('Y');

        $datas = $db->fetch_custom_single(
            "select * from t_pengajuan where id=$pengajuan"
        );

        $si = $db->fetch_custom_single(
            "SELECT sum(lama) as sisaan FROM `t_peng_histori` where tahun=$tahun and kode='C' and id_pegawai=$id_pegawai group by tahun,kode;"
        );
        $kod = $datas->kode;
        @$sis = $datas->batas - ($si->sisaan + $lama);
        $data = [
            'pengajuan' => $pengajuan,
            'status_pengajuan' => $status_pengajuan,
            'tgl_pengajuan' => $tgl_pengajuan,
            'tgl_update' => $tgl_update,
            'mulai' => $mulai,
            'akhir' => $akhir,
            'lama' => $lama,
            'sisa' => $sis,
            'keterangan_p' => $keterangan_p,
            'id_pegawai' => $id_pegawai,
            'tahun' => $tahun,
            'kode' => $kod,
        ];
        $in = $db->insert('t_peng_histori', $data);

        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/ajukan' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    case 'up':
        $status_pengajuan = $_POST['sts'];
        $id = $_POST['id'];
        $lama = $_POST['lama'];
        $sisa = $_POST['sisa'];
        $tgl_update = date('Y-m-d');
        if ($status_pengajuan == 'N') {
            $isi = $sisa + $lama;
        } elseif ($status_pengajuan == 'Y') {
            $lama = $sisa + 0;
        } else {
            $isi = $sisa + 0;
        }
        $data = [
            'status_pengajuan' => $status_pengajuan,
            'tgl_update' => $tgl_update,
            // $s,
            'sisa' => $isi,
        ];
        $up = $db->update('t_peng_histori', $data, 'id', $id);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil diupdate");
                 window.location.replace("' .
                base_admin() .
                'index.php/ajukan' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>