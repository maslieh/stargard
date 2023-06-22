<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'jabatan' => $_POST['level'],
            'gapok_jabatan' => $_POST['gapok'],
            'ket' => $_POST['deskripsi'],
        ];

        $in = $db->insert('t_jabatan', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->delete('t_jabatan', 'id_jabatan', $_GET['id']);
        break;
    case 'up':
        $data = [
            'jabatan' => $_POST['level'],
            'gapok_jabatan' => $_POST['gapok'],
            'ket' => $_POST['deskripsi'],
        ];

        $up = $db->update('t_jabatan', $data, 'id_jabatan', $_POST['id']);
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