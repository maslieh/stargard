<?php switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'absensi_add.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("set-absen"); 
                            </script>';
                }
            }
        }
        break;
    case 'klaim':
        $id_jur = $path_four;
        $data_edit = $db->fetch_single_row('t_absen', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'edit') {
                if ($role_act['up_act'] == 'Y') {
                    include 'absensi_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'absensi_view.php';
                }
            }
        }

        break;
    case 'import':
        include 'import.php';
        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_absen', 'id', $path_id);
        include 'absensi_detail.php';
        break;
    case 'choose':
        $id_jur = $path_id;

        include 'absensi_view_detail.php';
        break;
    default:
        include 'absensi_view.php';
        break;
}

?>