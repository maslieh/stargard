<?php
session_start();
include '../../inc/config.php';
session_check();
switch ($_GET['act']) {
    case 'in':
        $disc = $_POST['diskon'];
        $id_paket = $_POST['id_paket'];
        $datas = $db->fetch_custom_single(
            "select * from  t_paket  where id = $id_paket"
        );
        $tot = $datas->harga - $disc;
        $data = [
            'waranti' => $_POST['waranti'],
            'tgl_booking' => $_POST['tgl_booking'],
            'nama' => $_POST['nama'],
            'alamat' => $_POST['alamat'],
            'tlp' => $_POST['tlp'],
            'jns_kendaraan' => $_POST['jns_kendaraan'],
            'no_rangka' => $_POST['no_rangka'],
            'no_polisi' => $_POST['no_polisi'],
            'id_teknisi' => $_POST['id_paket'],
            'tek1' => $_POST['tek1'],
            'tek2' => $_POST['tek2'],
            'tek3' => $_POST['tek3'],
            'tek4' => $_POST['tek4'],
            'id_sales' => $_POST['id_sales'],
            'diskon' => $_POST['diskon'],
            'total_b' => $tot,
            'tgl' => $_POST['tgl_booking'],
            'admin' => $_POST['admin'],
            'booking' => $_POST['booking'],
        ];

        $data1 = [
            'id_data' => $_POST['waranti'],
        ];
        $in1 = $db->insert('t_garansi', $data1);
        $in = $db->insert('t_transaksi', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $is = $_GET['id'];
        $datas2 = $db->fetch_custom_single(
            "select * from  t_transaksi  where id = $is"
        );
        $date = date('Y-m-d H:m:s');
        $data = [
            'sts_hapus' => 'Y',
            'tgl_hapus' => $date,
        ];

        $del = $db->update('t_transaksi', $data, 'id', $_GET['id']);

        break;

    case 'up':
        $date = date('Y-m-d H:m:s');
        $data = [
            'tgl_booking' => $_POST['tgl_booking'],
            'nama' => $_POST['nama'],
            'alamat' => $_POST['alamat'],
            'tlp' => $_POST['tlp'],
            'jns_kendaraan' => $_POST['jns_kendaraan'],
            'no_rangka' => $_POST['no_rangka'],
            'no_polisi' => $_POST['no_polisi'],
            'id_teknisi' => $_POST['id_paket'],
            'tek1' => $_POST['tek1'],
            'tek2' => $_POST['tek2'],
            'tek3' => $_POST['tek3'],
            'tek4' => $_POST['tek4'],
            'id_sales' => $_POST['id_sales'],
            'diskon' => $_POST['diskon'],
            'admin' => $_POST['admin'],
            'booking' => $_POST['booking'],
            'tgl_server' => $date,
        ];

        $up = $db->update('t_transaksi', $data, 'id', $_POST['id']);
        if ($up = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'up1':
        $date = date('Y-m-d H:m:s');
        $data = [
            'sts_book' => $_POST['status'],
            'tgl_server' => $date,
            'status_bayar' => $_POST['status_bayar'],
            'tgl_lunas' => $date,
        ];

        $up = $db->update('t_transaksi', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/booking');
        } else {
            return false;
        }
        break;

    case 'up2':
        $date = date('Y-m-d H:m:s');
        $data = [
            'sts_book' => $_POST['status'],
            'status_bayar' => $_POST['status_bayar'],
            'tgl_lunas' => $date,
        ];

        $up = $db->update('t_transaksi', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>
