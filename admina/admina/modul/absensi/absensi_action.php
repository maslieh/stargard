<?php
session_start();
include '../../inc/config.php';
//session_check_adm();
switch ($_GET['act']) {
    case 'delete':
        $db->delete('t_absen', 'id', $_GET['id']);
        break;

    case 'in':
        $id_sales = $_POST['id'];
        $tgl = $_POST['tgl'];
        $jam = $_POST['jam'];
        $sts = $_POST['sts'];
        $sts1 = $_POST['ket'];
        //  $date = date("Y-m-d");
        $datas = $db->fetch_custom_single(
            "select tanggal,status from  t_presensi where id_pegawai= $id_sales and status='M'"
        );
        $datass = $db->fetch_custom_single(
            "select tanggal,status from  t_presensi where id_pegawai= $id_sales and status='P'"
        );
        $pulang = $db->fetch_custom_single(
            "select* from  t_absen where status='Y'"
        );

        $waktu_awal = strtotime($pulang->pulang_awal);
        $waktu_akhir = strtotime($jam); // bisa juga waktu sekarang now()
        //menghitung selisih dengan hasil detik
        $diff = $waktu_akhir - $waktu_awal;
        //membagi detik menjadi jam
        $jam1 = floor($diff / (60 * 60));
        //membagi sisa detik setelah dikurangi $jam menjadi menit
        $menit = $diff - $jam1 * (60 * 60);

        if ($tgl == $datas->tanggal && $sts == 'M') {
            echo ' <script>
                alert("Hari Ini Anda sudah Absen Masuk");
                 window.location.replace("' .
                base_admin() .
                'index.php/absensi' .
                '"); 
                </script>';
        } elseif ($tgl == $datass->tanggal && $sts == 'P') {
            echo ' <script>
                alert("Hari Ini Anda sudah Absen pulang");
                 window.location.replace("' .
                base_admin() .
                'index.php/absensi' .
                '"); 
                </script>';
        } else {
            $data = [
                'id_pegawai' => $id_sales,
                'status' => $sts,
                'tanggal' => $tgl,
                'waktu' => $jam,
                'sts' => $sts1,
                'overtime' => $jam1,
            ];
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
                    /*  $db->compressImage(
                        $_FILES['foto_user']['type'],
                        $_FILES['foto_user']['tmp_name'],
                        '../../../upload/absensi/',
                        $_FILES['foto_user']['name'],
                        200,
                        200
                    );*/
                    $foto_user = ['foto_user' => $_FILES['foto_user']['name']];
                    $data = array_merge($data, $foto_user);
                }
            }
            $in = $db->insert('t_presensi', $data);
        }

        if ($in = true) {
            echo ' <script>
                alert("Absen Berhasil");
                 window.location.replace("' .
                base_admin() .
                'index.php/rekap-absen' .
                '"); 
                </script>';
            //    header('Location:' . base_admin() . 'index.php/rekap-absen');
        } else {
            return false;
        }
        break;

    default:
        # code...
        break;
}

?>