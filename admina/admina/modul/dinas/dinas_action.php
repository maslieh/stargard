<?php
session_start();
include '../../inc/config.php';
//session_check_adm();
switch ($_GET['act']) {
    /* case 'del':
        $id = $_POST['id'];
        //    $del = $db->delete('t_peng_histori', 'id', $id);
        $hapus = 'Y';
        $date = date('Y-m-d h:i:s');
        $data = [
            'sts_hapus' => $hapus,
            'tgl_hapus' => $date,
        ];
        $del = $db->update('t_pengeluaran', $data, 'id', $id);

        if ($del = true) {
            echo ' <script>
                alert("Data Berhasil dihapus");
                 window.location.replace("' .
                base_admin() .
                'index.php/lembur' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;*/

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
                'index.php/dinas' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;

    case 'in':
        $sts_p = '1';
        $sts_d = '0';
        $sts_e = 'A';
        $sts_r = 'A';
        $sts_b = 'NR';
        $sts_l = 'D';
        $data = [
            'tanggal' => $_POST['tanggal'],
            'nama_p' => $_POST['nama_p'],
            'jumlah' => $_POST['jumlah'],
            'mulai' => $_POST['mulai'],
            'akhir' => $_POST['akhir'],
            'keterangan' => $_POST['keterangan'],
            'status_p' => $sts_p,
            'status_d' => $sts_d,
            'status' => $sts_e,
            'status_aju' => $sts_r,
            'pengajuan' => $sts_l,
            'baca' => $sts_b,
            'nama_peminjam' => $_POST['nama_peminjam'],
        ];
        $in = $db->insert('t_pengeluaran', $data);

        if ($in = true) {
            echo ' <script>
                alert("Data Berhasil Diinput");
                 window.location.replace("' .
                base_admin() .
                'index.php/dinas' .
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
            'status_aju' => $_POST['sts'],
            'tgl_edit' => $tgl_update,
        ];
        $up = $db->update('t_pengeluaran', $data, 'id', $id);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil diupdate");
                 window.location.replace("' .
                base_admin() .
                'index.php/dinas' .
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
