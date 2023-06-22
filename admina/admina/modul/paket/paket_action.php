<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'nama' => $_POST['level'],
            'harga' => $_POST['gapok'],
            'tipe' => $_POST['id_group'],
        ];

        $in = $db->insert('t_paket', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->delete('t_paket', 'id', $_GET['id']);
        break;

    case 'up':
        $data = [
            'nama' => $_POST['level'],
            'harga' => $_POST['gapok'],
            'tipe' => $_POST['id_group'],
        ];

        $up = $db->update('t_paket', $data, 'id', $_POST['id']);
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