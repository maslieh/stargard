<?php
session_check_adm();
switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'pegawai_add.php';
                } else {
                    echo 'permission denied';
                }
            }
        }
        break;
    case 'edit':
        $data_edit = $db->fetch_single_row('sys_users', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'edit') {
                if ($role_act['up_act'] == 'Y') {
                    include 'pegawai_edit.php';
                } else {
                    echo 'permission denied';
                }
            }
        }

        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_cabang', 'id', $path_id);
        include 'pegawai_detail.php';
        break;
    default:
        include 'pegawai_view.php';
        break;
}

?>