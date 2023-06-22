<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_pengajuan', 'id', $_GET['id']);
        break;
    case 'in':
        $nama = $_POST['nama'];
        $batas = $_POST['batas'];
        $keterangan = $_POST['keterangan'];
        $kode = $_POST['kode'];

        $data = [
            'nama' => $nama,
            'batas' => $batas,
            'keterangan' => $keterangan,
            'kode' => $kode,
        ];
        $in = $db->insert('t_pengajuan', $data);

        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/set-pengajuan' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    case 'up':
        $nama = $_POST['nama'];
        $batas = $_POST['batas'];
        $keterangan = $_POST['keterangan'];
        $id = $_POST['id'];
        //$kode = $_POST['kode'];

        $data = [
            'nama' => $nama,
            'batas' => $batas,
            'keterangan' => $keterangan,
        ];
        $up = $db->update('t_pengajuan', $data, 'id', $id);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil diupdate");
                 window.location.replace("' .
                base_admin() .
                'index.php/set-pengajuan' .
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