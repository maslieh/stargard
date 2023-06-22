<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_transaksi', 'id', $_GET['id']);
        break;

    case 'up':
        $sts_poin = $_POST['sts_point'];
        $point = $_POST['poin'];
        $idd = $_POST['id'];

        $data1 = [
            'sts_point' => $_POST['sts_point'],
        ];
        $up = $db->update('t_transaksi', $data1, 'id', $idd);

        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/poin');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>