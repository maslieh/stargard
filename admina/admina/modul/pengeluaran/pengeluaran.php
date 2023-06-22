<?php switch ($path_act) {
    case 'tambah':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'tambah') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'pengeluaran_add.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("pengeluaran"); 
                            </script>';
                }
            }
        }
        break;
    case 'add':
        $id_jur = $path_id;
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'add') {
                if ($role_act['insert_act'] == 'Y') {
                    include 'pengeluaran_tambah.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                                 window.location.replace("pengeluaran"); 
                            </script>';
                }
            }
        }
        break;

    case 'edit':
        $id_jur = $path_four;
        $data_edit = $db->fetch_single_row('t_pengeluaran', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'edit') {
                if ($role_act['up_act'] == 'Y') {
                    include 'pengeluaran_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'pengeluaran_view.php';
                }
            }
        }

    case 'ubah':
        $id_jur = $path_four;
        $data_edit = $db->fetch_single_row('t_pengeluaran', 'id', $path_id);
        foreach ($db->fetch_all('sys_menu') as $isi) {
            if ($path_url == $isi->url && $path_act == 'ubah') {
                if ($role_act['up_act'] == 'Y') {
                    include 'pengeluaran_edit.php';
                } else {
                    echo ' <script>
                                alert("Akses tidak diizinkan");
                               
                            </script>';
                    include 'pengeluaran_view.php';
                }
            }
        }

        break;
    case 'import':
        include 'import.php';
        break;
    case 'detail':
        $data_edit = $db->fetch_single_row('t_pengeluaran', 'id', $path_id);
        include 'pengeluaran_detail.php';
        break;
    case 'choose':
        $id_jur = $path_id;

        include 'pengeluaran_view_detail.php';
        break;
    default:
        include 'pengeluaran_view.php';
        break;
}

?>