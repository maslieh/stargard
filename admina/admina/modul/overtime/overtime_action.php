<?php
session_start();
include '../../inc/config.php';
//session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $date = date('Y-m-d h:i:s');
        $data = [
            'sts_hapus' => 'Y',
            'tgl_hapus' => $date,
        ];
        $del =
            //$db->delete('t_peng_histori', 'id', $_GET['id']);
            $db->update('t_pengeluaran', $data, 'id', $_GET['id']);
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
    case 'up':
        $status_pengajuan = $_POST['sts'];
        $id = $_POST['id'];
        $tgl_update = date('Y-m-d');
        $sts_b = 'L';
        $data = [
            'sts_ajukan' => $_POST['ajukan'],
            'tgl_acc' => $tgl_update,
        ];
        $up = $db->update('t_presensi', $data, 'id', $id);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil diupdate");
                 window.location.replace("' .
                base_admin() .
                'index.php/overtime' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    case 'up1':
        $status_pengajuan = $_POST['sts'];
        $id = $_POST['id'];
        $tgl_update = date('Y-m-d');
        $sts_b = 'L';
        $data = [
            'sts_ajukan' => $_POST['ajukan'],
        ];
        $up = $db->update('t_presensi', $data, 'id', $id);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil diupdate");
                 window.location.replace("' .
                base_admin() .
                'index.php/overtime' .
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