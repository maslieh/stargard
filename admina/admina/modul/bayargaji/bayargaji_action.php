<?php
session_start();
include '../../inc/config.php';
session_check_adm();
switch ($_GET['act']) {
    case 'del':
        $mulai = $_POST['mulai'];
        $dari = $_POST['dari'];
        $del = $db->delete('t_histori_gaji', 'id', $_POST['id']);
        if ($del = true) {
            echo ' <script>
                alert("Data Berhasil");
                 window.location.replace("' .
                base_admin() .
                'index.php/bayargaji?mulai=' .
                $mulai .
                '&dari=' .
                $dari .
                '"); 
                </script>';
        } else {
            return false;
        }
        break;
    case 'ip':
        $mulai = $_POST['mulai'];

        $dari = $_POST['dari'];
        $gajikotor =
            $_POST['gajix'] +
            $_POST['jabatan'] +
            $_POST['makan'] +
            $_POST['uang_transport'] +
            $_POST['overtime'] +
            $_POST['insentif'] +
            $_POST['lembur'];
        $gajibersih =
            $gajikotor - $_POST['jht'] - $_POST['potongan'] + $_POST['bonus'];
        $data = [
            'tgl_gajian' => $_POST['tanggal'],
            'gajix' => $_POST['gajix'],
            'jabatan' => $_POST['jabatan'],
            'makan' => $_POST['makan'],
            'transport' => $_POST['uang_transport'],
            'overtime' => $_POST['overtime'],
            'insentif' => $_POST['insentif'],
            'lembur' => $_POST['lembur'],
            'gajikotor' => $gajikotor,
            'potongan' => $_POST['potongan'],
            'potonganjht' => $_POST['jht'],
            'bonus' => $_POST['bonus'],
            'id_pegawai' => $_POST['id_pegawai'],
            'gajibersih' => $gajibersih,
            'sts_hapus' => '0',
            'sts_gaji' => '0',
        ];

        $up = $db->insert('t_histori_gaji', $data);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil");
                 window.location.replace("' .
                base_admin() .
                'index.php/bayargaji?mulai=' .
                $mulai .
                '&dari=' .
                $dari .
                '"); 
                </script>';
        } else {
            return false;
        }
        break;

    case 'up':
        $data = [
            'sts_gaji' => '1',
            'tgl_gajian' => $_POST['tgl'],
        ];
        $data1 = [
            'sts_bayar' => '1',
            'tglbayar' => $_POST['tgl'],
        ];
        $up1 = $db->update(
            't_pengeluaran',
            $data1,
            'nama_peminjam',
            $_POST['id_pegawai']
        );
        $up = $db->update('t_histori_gaji', $data, 'id', $_POST['id']);
        if ($up = true) {
            echo ' <script>
                alert("Data Berhasil");
                 window.location.replace("' .
                base_admin() .
                'index.php/bayargaji' .
                '"); 
                </script>';
        } else {
            return false;
        }
        break;
    default:
        # code...
        break;
}

?>