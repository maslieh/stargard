<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'tipe' => $_POST['level'],
        ];

        $in = $db->insert('t_tipe', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->delete('t_tipe', 'id', $_GET['id']);
        break;

    case 'up':
        $data = [
            'tipe' => $_POST['level'],
        ];

        $up = $db->update('t_tipe', $data, 'id', $_POST['id']);
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