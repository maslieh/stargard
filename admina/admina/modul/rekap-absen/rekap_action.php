<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_absen', 'id', $_GET['id']);
        break;

    case 'in':
        $id_sales = $_POST['id_pegawai'];
        $sts = $_POST['sts'];
        $tgl = $_POST['tanggal'];
        $jam = $_POST['waktu'];
        if ($sts == 'M') {
            $sts1 = 'A';
        } else {
            $sts1 = 'B';
        }
        $datas = $db->fetch_custom_single(
            "select tanggal,status from  t_presensi where id_pegawai= $id_sales and status='M'"
        );
        $datass = $db->fetch_custom_single(
            "select tanggal,status from  t_presensi where id_pegawai= $id_sales and status='P'"
        );
        $pulang = $db->fetch_custom_single(
            "select* from  t_absen where status='Y'"
        );

        $waktu_awal = strtotime($pulang->pulang_awal);
        $waktu_akhir = strtotime($jam); // bisa juga waktu sekarang now()
        //menghitung selisih dengan hasil detik
        $diff = $waktu_akhir - $waktu_awal;
        //membagi detik menjadi jam
        $jam1 = floor($diff / (60 * 60));
        //membagi sisa detik setelah dikurangi $jam menjadi menit
        $menit = $diff - $jam1 * (60 * 60);

        $data = [
            'id_pegawai' => $_POST['id_pegawai'],
            'status' => $sts,
            'tanggal' => $tgl,
            'waktu' => $jam,
            'sts' => $sts1,
            'overtime' => $jam1,
        ];

        $in = $db->insert('t_presensi', $data);
        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;
    case 'upt':
        $id = $_POST['id'];
        $sts = $_POST['status'];
        $s = $db->query("update t_absen set status='$sts' where id='$id' ");
        $ss = $db->query("update t_absen set status='N' where id !='$id' ");
        if ($upt = true) {
            header('Location:' . base_admin() . 'index.php/set-absen');
        } else {
            return false;
        }
        break;

    case 'masuk':
        $data = [
            'tanggal' => $_POST['tanggal'],
            'status' => $_POST['sts'],
            'waktu' => $_POST['jam'],
        ];

        $db->update('t_presensi', $data, 'id', $_POST['id']);
        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }

    case 'pulang':
        $data = [
            'tanggal' => $_POST['tanggal'],
            'status' => $_POST['sts'],
            'waktu' => $_POST['jam'],
        ];

        $db->update('t_presensi', $data, 'id', $_POST['id']);
        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
    case 'hapus':
        $db->delete('t_presensi', 'id', $_POST['id']);

        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil di HAPUS");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
    case 'hapus1':
        $db->delete('t_presensi', 'id', $_POST['id']);
        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil di HAPUS");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
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