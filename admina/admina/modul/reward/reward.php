<?php switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'reward_add.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("reward"); 
                            </script>';
                }
            }
        }
        break;
    case 'klaim':
        $id_jur = $path_four;
        $data_edit = $db->fetch_single_row('t_reward', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'edit') {
                if ($role_act['up_act'] == 'Y') {
                    include 'reward_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'reward_view.php';
                }
            }
        }

        break;
    case 'import':
        include 'import.php';
        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_transaksi', 'id', $path_id);
        include 'reward_detail.php';
        break;
    case 'choose':
        $id_jur = $path_id;

        include 'reward_view_detail.php';
        break;
    default:
        include 'reward_view.php';
        break;
}

?>