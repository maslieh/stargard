<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'reset':
        $data = ['password' => md5($_POST['password_baru'])];
        $up = $db->update('sys_users', $data, 'id', $_POST['id']);
        if ($up = true) {
            echo 'good';
        } else {
            return false;
        }
        break;
    case 'in':
        $data = ['username' => $_POST['username']];
        $check = $db->check_exist('sys_users', $data);
        if ($check == true) {
            echo 'false';
            exit();
        }

        $data = [
            'first_name' => $_POST['first_name'],
            'last_name' => $_POST['last_name'],
            'jenkel' => $_POST['jenkel'],
            'temp_lahir' => $_POST['tmp_lahir'],
            'tgl_lahir' => $_POST['tgl_lahir'],
            'alamat' => $_POST['alamat'],
            'no_tlp' => $_POST['no_tlp'],
            'agama' => $_POST['agama'],
            'id_jabatan' => $_POST['id_jabatan'],
            'username' => $_POST['username'],
            'password' => md5($_POST['password_baru']),
            'email' => $_POST['email'],
            'id_group' => $_POST['id_group'],
            'kode_jurusan' => $_POST['jurusan'],
            'norek' => $_POST['norek'],
            'dealer' => $_POST['dealer'],
            'date_created' => date('Y-m-d'),
        ];

        if (isset($_POST['aktif']) == 'on') {
            $aktif = ['aktif' => 'Y'];
            $data = array_merge($data, $aktif);
        } else {
            $aktif = ['aktif' => 'N'];
            $data = array_merge($data, $aktif);
        }

        if (isset($_FILES['foto_user']['name'])) {
            if (
                !preg_match(
                    '/.(png|jpg|jpeg|gif|bmp)$/i',
                    $_FILES['foto_user']['name']
                )
            ) {
                echo 'pastikan file yang anda pilih png|jpg|jpeg|gif';

                exit();
            } else {
                $db->compressImage(
                    $_FILES['foto_user']['type'],
                    $_FILES['foto_user']['tmp_name'],
                    '../../../upload/back_profil_foto/',
                    $_FILES['foto_user']['name'],
                    200,
                    200
                );
                $foto_user = ['foto_user' => $_FILES['foto_user']['name']];
                $data = array_merge($data, $foto_user);
            }
        }

        $in = $db->insert('sys_users', $data);
        if ($in = true) {
            echo 'good';
        } else {
            return false;
        }
        break;

    case 'delete':
        $db->deleteDirectory(
            '../../upload/profil/' .
                $db->fetch_single_row('sys_users', 'id', $_POST['id'])
                    ->foto_user
        );
        $db->delete('sys_users', 'id', $_GET['id']);
        break;

    case 'up':
        $data = [
            'first_name' => $_POST['first_name'],
            'last_name' => $_POST['last_name'],
            'email' => $_POST['email'],
            'temp_lahir' => $_POST['temp_lahir'],
            'tgl_lahir' => $_POST['tgl_lahir'],
            'alamat' => $_POST['alamat'],
            'no_tlp' => $_POST['no_tlp'],
            'norek' => $_POST['norek'],
            'email' => $_POST['email'],
            'agama' => $_POST['agama'],
            'jenkel' => $_POST['jenkel'],
            'id_jabatan' => $_POST['id_group'],
            'kode_jurusan' => $_POST['jurusan'],
            'dealer' => $_POST['dealer'],
        ];

        if (isset($_FILES['foto_user']['name'])) {
            if (
                !preg_match(
                    '/.(png|jpg|jpeg|gif|bmp)$/i',
                    $_FILES['foto_user']['name']
                )
            ) {
                echo 'pastikan file yang anda pilih gambar';
                exit();
            } else {
                $db->compressImage(
                    $_FILES['foto_user']['type'],
                    $_FILES['foto_user']['tmp_name'],
                    '../../../upload/back_profil_foto/',
                    $_FILES['foto_user']['name'],
                    200,
                    200
                );
                $db->deleteDirectory(
                    '../../../upload/back_profil_foto/' .
                        $db->fetch_single_row('sys_users', 'id', $_POST['id'])
                            ->foto_user
                );
                $foto_user = ['foto_user' => $_FILES['foto_user']['name']];
                $data = array_merge($data, $foto_user);
            }
        }

        $up = $db->update('sys_users', $data, 'id', $_POST['id']);
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
