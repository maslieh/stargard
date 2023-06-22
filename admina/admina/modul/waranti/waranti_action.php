<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'nama' => $_POST['nama'],
            'alamat' => $_POST['alamat'],
            'tlp' => $_POST['tlp'],
            'jns_kendaraan' => $_POST['jns_kendaraan'],
            'waranti' => $_POST['waranti'],
            'no_rangka' => $_POST['no_rangka'],
            'no_polisi' => $_POST['no_polisi'],
            'id_teknisi' => $_POST['id_teknisi'],
            'id_sales' => $_POST['id_sales'],
            'diskon' => $_POST['diskon'],
            'tgl' => $_POST['tgl'],
            'sts_point' => $_POST['sts_point'],
            'admin' => $_POST['admin'],
        ];

        $in = $db->insert('t_transaksi', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    //  case 'delete':
    //      $db->delete('t_transaksi', 'id', $_GET['id']);
    //      break;

    case 'up':
        $data = [
            'waranti' => $_POST['waranti'],
            'tgl_pakai' => $_POST['tgl_pakai'],
            'harga_w' => $_POST['harga_w'],
            'harga_p' => $_POST['harga_p'],
            'keterangan' => $_POST['keterangan'],
            'pekerjaan' => $_POST['nama_p'],
            'status_bayar' => $_POST['status_bayar'],
        ];
        $up = $db->insert('t_history', $data);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/waranti');
        } else {
            return false;
        }
        break;

    case 'up2':
        $data = [
            'batas' => $_POST['batas'],
            'terpakai' => $_POST['terpakai'],
            'tgl_mulai' => $_POST['tgl_mulai'],
            'tgl_akhir' => $_POST['tgl_akhir'],
        ];

        $up = $db->update('t_garansi', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/waranti');
        } else {
            return false;
        }
        break;

    case 'ed':
        $data = [
            'harga_p' => $_POST['harga_p'],
            'harga_w' => $_POST['harga_w'],
            'tgl_pakai' => $_POST['tanggal'],
            'keterangan' => $_POST['keterangan'],
            'pekerjaan' => $_POST['teknisi'],
        ];

        $up = $db->update('t_history', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/waranti');
        } else {
            return false;
        }
        break;
    case 'upd':
        $data = [
            'status_bayar' => $_POST['status_bayar'],
        ];

        $up = $db->update('t_history', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/waranti');
        } else {
            return false;
        }
        break;
    case 'upk':
        $data = [
            'sts_kerja' => $_POST['sts_kerja'],
        ];

        $up = $db->update('t_history', $data, 'id', $_POST['id']);
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/waranti');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>