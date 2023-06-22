<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_absen', 'id', $_GET['id']);
        break;
    case 'in':
        $masuk_awal = $_POST['masuk_awal'];
        $masuk_akhir = $_POST['masuk_akhir'];
        $pulang_awal = $_POST['pulang_awal'];
        $pulang_akhir = $_POST['pulang_akhir'];

        $data = [
            'masuk_awal' => $masuk_awal,
            'masuk_akhir' => $masuk_akhir,
            'pulang_awal' => $pulang_awal,
            'pulang_akhir' => $pulang_akhir,
        ];
        $in = $db->insert('t_absen', $data);

        if ($in = true) {
            header('Location:' . base_admin() . 'index.php/set-absen');
        } else {
            return false;
        }
        break;

    case 'upt':
        $id = $_POST['id'];
        $sts = $_POST['status'];
        $s = $db->query("update t_absen set status='$sts' where id='$id' ");
        $ss = $db->query("update t_absen set status='N' where id !='$id' ");
        if ($upt = true) {
            header('Location:' . base_admin() . 'index.php/set-absen');
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>