<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $aju = 'Y';
        $data = [
            'tanggal' => $_POST['tanggal'],
            'nama_p' => $_POST['nama_p'],
            'jumlah' => $_POST['jumlah'],
            'status_d' => $_POST['status_d'],
            'status' => $_POST['status'],
            'keterangan' => $_POST['keterangan'],
            'status_aju' => $aju,
        ];

        $in = $db->insert('t_pengeluaran', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'ini':
        $aju = 'Y';
        $data = [
            'tanggal' => $_POST['tanggal'],
            'nama_p' => $_POST['nama_p'],
            'jumlah' => $_POST['jumlah'],
            'status_p' => $_POST['status_p'],
            'status' => $_POST['status'],
            'keterangan' => $_POST['keterangan'],
            'status_aju' => $aju,
        ];

        $in = $db->insert('t_pengeluaran', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $date = date('Y-m-d h:i:s');
        $data = [
            'sts_hapus' => 'Y',
            'tgl_hapus' => $date,
        ];

        $db->update('t_pengeluaran', $data, 'id', $_GET['id']);

        break;

    case 'up':
        $date = date('Y-m-d');
        $data = [
            'nama_p' => $_POST['nama_p'],
            'jumlah' => $_POST['jumlah'],
            'tgl_edit' => $date,
            'keterangan' => $_POST['keterangan'],
        ];

        $up = $db->update('t_pengeluaran', $data, 'id', $_POST['id']);
        if ($up = true) {
            echo 'good';
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>