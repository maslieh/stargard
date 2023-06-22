<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'in':
        $data = [
            'id_paket' => $_POST['id_group'],
            'id_teknisi1' => $_POST['id_teknisi1'],
            'id_teknisi2' => $_POST['id_teknisi2'],
            'id_teknisi3' => $_POST['id_teknisi3'],
        ];

        $in = $db->insert('t_teknisi', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->delete('t_teknisi', 'id', $_GET['id']);
        break;
    case 'up':
        $data = [
            'id_paket' => $_POST['id_paket'],
            'id_teknisi1' => $_POST['id_teknisi1'],
            'id_teknisi2' => $_POST['id_teknisi2'],
            'id_teknisi3' => $_POST['id_teknisi3'],
        ];

        $up = $db->update('t_teknisi', $data, 'id', $_POST['id']);
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