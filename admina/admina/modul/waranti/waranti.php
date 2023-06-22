<?php switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'waranti_add.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("waranti"); 
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
                    include 'waranti_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'waranti_view.php';
                }
            }
        }

        break;
    case 'import':
        include 'import.php';
        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        include 'waranti_detail.php';
        break;
    case 'kwitansi':
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        include 'kwitansi.php';
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
    case 'histori':
        $id_jur = $path_four;
        $tek = $path_id;
        // $data_edit = $db->fetch_custom_single(
        //    "select * from  t_transaksi  where tek1 = $path_id"
        // );
        // $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        //  $dat = $db->fetch_custom_single("
        include 'waranti_his.php';
        break;
    case 'choose':
        $id_jur = $path_id;

        include 'waranti_view_detail.php';
        break;
    case 'cari':
        $mulai = $_REQUEST['mulai'];
        $dari = $_REQUEST['dari'];
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        //  $dat = $db->fetch_custom_single("
        include 'waranti_cari.php';
        break;
    default:
        include 'waranti_view.php';
        break;
}

?>
