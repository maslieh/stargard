<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_transaksi', 'id', $_GET['id']);
        break;

    case 'up':
        $id_sales = $_POST['id_sales'];
        $s = $db->query(
            "update t_transaksi set sts_klaim='Y' where id_sales='$id_sales' and sts_point='Y' and sts_klaim='N'"
        );

        $data1 = [
            'total_poin' => $_POST['poin'],
            'tgl_klaim' => $_POST['tgl'],
            'id_sales' => $_POST['id_sales'],
        ];
        $up = $db->insert('t_poin', $data1);

        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/reward');
        } else {
            return false;
        }
        break;

    case 'upt':
        $id = $_POST['id'];
        $sts = $_POST['status'];
        $s = $db->query("update t_poin set status='$sts' where id='$id' ");
        if ($up = true) {
            header('Location:' . base_admin() . 'index.php/reward');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>