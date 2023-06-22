<?php switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'booking_add.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("booking"); 
                            </script>';
                }
            }
        }
        break;
    case 'edit':
        $id_jur = $path_four;
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'edit') {
                if ($role_act['up_act'] == 'Y') {
                    include 'booking_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'booking_view.php';
                }
            }
        }

        break;
    case 'cetak':
        $id_jur = $path_four;
        $tek = $path_id;
        // $data_edit = $db->fetch_custom_single(
        //    "select * from  t_transaksi  where tek1 = $path_id"
        // );
        // $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        //  $dat = $db->fetch_custom_single("
        include 'waranti_his.php';
        break;
    case 'print':
        $id_jur = $path_four;
        $tek = $path_id;
        // $data_edit = $db->fetch_custom_single(
        //    "select * from  t_transaksi  where tek1 = $path_id"
        // );
        // $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        //  $dat = $db->fetch_custom_single("
        include 'waranti_print.php';
        break;
    case 'import':
        include 'import.php';
        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        include 'booking_detail.php';
        break;
    case 'choose':
        $id_jur = $path_id;

        include 'booking_view_detail.php';
        break;
    default:
        include 'booking_view.php';
        break;
}

?>