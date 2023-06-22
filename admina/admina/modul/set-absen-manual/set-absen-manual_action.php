<?php
session_start();
include '../../inc/config.php';
//session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $id = $_POST['id'];
        $del = $db->delete('t_gaji', 'id', $id);
        if ($del = true) {
            echo ' <script>
                alert("Data Berhasil Dihapus");
                 window.location.replace("' .
                base_admin() .
                'index.php/setgaji' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;

    case 'in':
        $id_pegawai = $_POST['id_pegawai'];
        $gaji = $_POST['gaji'];
        $uang_makan = $_POST['uang_makan'];
        $uang_transport = $_POST['uang_transport'];
        $overtime = $_POST['overtime'];
        $lembur = $_POST['lembur'];
        $insentif = $_POST['insentif'];
        $dinas = $_POST['dinas'];
        $jabatan = $_POST['jabatan'];
        $lainnya = $_POST['lainnya'];

        $data = [
            'id_pegawai' => $id_pegawai,
            'gaji' => $gaji,
            'uang_makan' => $uang_makan,
            'uang_transport' => $uang_transport,
            'overtime' => $overtime,
            'lembur' => $lembur,
            'insentif' => $insentif,
            'dinas' => $dinas,
            'lainnya' => $lainnya,
            'tun_jabatan' => $jabatan,
        ];
        $in = $db->insert('t_gaji', $data);

        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/setgaji' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;

    case 'up':
        $id_pegawai = $_POST['id_pegawai'];
        $gaji = $_POST['gaji'];
        $uang_makan = $_POST['uang_makan'];
        $uang_transport = $_POST['uang_transport'];
        $overtime = $_POST['overtime'];
        $lembur = $_POST['lembur'];
        $insentif = $_POST['insentif'];
        $dinas = $_POST['dinas'];
        $lainnya = $_POST['lainnya'];
        $jabatan = $_POST['jabatan'];
       
        $data = [
            'id_pegawai' => $id_pegawai,
            'gaji' => $gaji,
            'uang_makan' => $uang_makan,
            'uang_transport' => $uang_transport,
            'overtime' => $overtime,
            'lembur' => $lembur,
            'insentif' => $insentif,
            'dinas' => $dinas,
            'lainnya' => $lainnya,
            'tun_jabatan' => $jabatan,
        ];
        $up = $db->update('t_gaji', $data,'id',$_POST['id']);

        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil Di-update");
                 window.location.replace("' .
                base_admin() .
                'index.php/setgaji' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
    default:
        # code...
        break;
}

?>
