<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'nama' => $_POST['level'],
            'deskripsi' => $_POST['deskripsi'],
        ];

        $in = $db->insert('t_cabang', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->delete('t_cabang', 'id', $_GET['id']);
        break;
    case 'up':
        $data = [
            'nama' => $_POST['level'],
            'deskripsi' => $_POST['deskripsi'],
        ];

        $up = $db->update('t_cabang', $data, 'id', $_POST['id']);
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