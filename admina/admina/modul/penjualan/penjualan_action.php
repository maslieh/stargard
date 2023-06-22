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
            'sts_book' => 'Y',
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
        $date = date('Y-m-d H:m:s');
        $data = [
            'sts_hapus' => 'Y',
            'tgl_hapus' => $date,
        ];

        $del = $db->update('t_transaksi', $data, 'id', $_GET['id']);
        //  $idd = $datas2->waranti;
        // $del2 = $db->delete('t_garansi', 'id_data', $idd);
        // $del1 = $db->delete('t_transaksi', 'id', $_GET['id']);

        break;

    case 'up':
        $data = [
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
        ];

        $up = $db->update('t_transaksi', $data, 'id', $_POST['id']);
        if ($up = true) {
            echo 'good';
        } else {
            return false;
        }
        break;
    case 'cari':
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        //  $dat = $db->fetch_custom_single("
        include 'penjualan_cari.php';
        break;
    default:
        # code...
        break;
}

?>