<?php
function tgl_indo($date)
{
    // fungsi atau method untuk mengubah tanggal ke format indonesia
    // variabel BulanIndo merupakan variabel array yang menyimpan nama-nama bulan
    $BulanIndo = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
    ];

    $tahun = substr($date, 0, 4); // memisahkan format tahun menggunakan substring
    $bulan = substr($date, 5, 2); // memisahkan format bulan menggunakan substring
    $tgl = substr($date, 8, 2); // memisahkan format tanggal menggunakan substring

    $result = $tgl . ' ' . $BulanIndo[(int) $bulan - 1] . ' ' . $tahun;
    return $result;
}

function hari_ini(){
	$hari = date ("D");
 
	switch($hari){
		case 'Sun':
			$hari_ini = "Minggu";
		break;
 
		case 'Mon':			
			$hari_ini = "Senin";
		break;
 
		case 'Tue':
			$hari_ini = "Selasa";
		break;
 
		case 'Wed':
			$hari_ini = "Rabu";
		break;
 
		case 'Thu':
			$hari_ini = "Kamis";
		break;
 
		case 'Fri':
			$hari_ini = "Jumat";
		break;
 
		case 'Sat':
			$hari_ini = "Sabtu";
		break;
		
		default:
			$hari_ini = "Tidak di ketahui";		
		break;
	}
 
	return "<b>" . $hari_ini . "</b>";
 
}


function penyebut($nilai)
{
    $nilai = abs($nilai);
    $huruf = [
        '',
        'satu',
        'dua',
        'tiga',
        'empat',
        'lima',
        'enam',
        'tujuh',
        'delapan',
        'sembilan',
        'sepuluh',
        'sebelas',
    ];
    $temp = '';
    if ($nilai < 12) {
        $temp = ' ' . $huruf[$nilai];
    } elseif ($nilai < 20) {
        $temp = penyebut($nilai - 10) . ' belas';
    } elseif ($nilai < 100) {
        $temp = penyebut($nilai / 10) . ' puluh' . penyebut($nilai % 10);
    } elseif ($nilai < 200) {
        $temp = ' seratus' . penyebut($nilai - 100);
    } elseif ($nilai < 1000) {
        $temp = penyebut($nilai / 100) . ' ratus' . penyebut($nilai % 100);
    } elseif ($nilai < 2000) {
        $temp = ' seribu' . penyebut($nilai - 1000);
    } elseif ($nilai < 1000000) {
        $temp = penyebut($nilai / 1000) . ' ribu' . penyebut($nilai % 1000);
    } elseif ($nilai < 1000000000) {
        $temp =
            penyebut($nilai / 1000000) . ' juta' . penyebut($nilai % 1000000);
    } elseif ($nilai < 1000000000000) {
        $temp =
            penyebut($nilai / 1000000000) .
            ' milyar' .
            penyebut(fmod($nilai, 1000000000));
    } elseif ($nilai < 1000000000000000) {
        $temp =
            penyebut($nilai / 1000000000000) .
            ' trilyun' .
            penyebut(fmod($nilai, 1000000000000));
    }
    return $temp;
}

function terbilang($nilai)
{
    if ($nilai < 0) {
        $hasil = 'minus ' . trim(penyebut($nilai));
    } else {
        $hasil = trim(penyebut($nilai));
    }
    return $hasil;
}

//url parsing
function parse_path()
{
    $path = [];
    if (isset($_SERVER['REQUEST_URI'])) {
        $request_path = explode('?', $_SERVER['REQUEST_URI']);

        $path['base'] = rtrim(dirname($_SERVER['SCRIPT_NAME']), '\/');
        $path['call_utf8'] = substr(
            urldecode($request_path[0]),
            strlen($path['base']) + 1
        );
        $path['call'] = utf8_decode($path['call_utf8']);
        if ($path['call'] == basename($_SERVER['PHP_SELF'])) {
            $path['call'] = '';
        }
        $path['call_parts'] = explode('/', $path['call']);

        if ($request_path[1] = '') {
            $path['query_utf8'] = urldecode($request_path[1]);
            $path['query'] = utf8_decode(urldecode($request_path[1]));
            $vars = explode('&', $path['query']);
            foreach ($vars as $var) {
                $t = explode('=', $var);
                $path['query_vars'][$t[0]] = $t[1];
            }
        }
    }
    return $path;
}

//first url path
$path = parse_path();
$path_url = $path['call_parts'][1];

//second path
$path_act = isset($path['call_parts'][2]) ? $path['call_parts'][2] : '';
//third path
$path_id = isset($path['call_parts'][3]) ? $path['call_parts'][3] : '';

//fourth path
$path_four = isset($path['call_parts'][4]) ? $path['call_parts'][4] : '';

//fourth five
$path_five = isset($path['call_parts'][5]) ? $path['call_parts'][5] : '';

//simpan role url page user di array sesuai login session level
$role_user = [];
$role_act = [];
foreach (
    $db->query(
        "select sys_menu.url from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu
    where sys_menu_role.group_id=? and sys_menu_role.read_act=?",
        [
            'sys_menu_role.group_id' => $_SESSION['level'],
            'sys_menu_role.read_act' => 'Y',
        ]
    )
    as $role
) {
    $role_user[] = $role->url;
}
//lebih detail detil crud role user
foreach (
    $db->query(
        'select read_act,insert_act,update_act,delete_act from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu where sys_menu_role.group_id=? and sys_menu.url=?',
        [
            'sys_menu_role.group_id' => $_SESSION['level'],
            'sys_menu.url' => $path_url,
        ]
    )
    as $role
) {
    $role_act['up_act'] = $role->update_act;
    $role_act['insert_act'] = $role->insert_act;
    $role_act['del_act'] = $role->delete_act;
}

//obj to array
function toArray($obj)
{
    if (is_object($obj)) {
        $obj = (array) $obj;
    }
    if (is_array($obj)) {
        $new = [];
        foreach ($obj as $key => $val) {
            $new[$key] = toArray($val);
        }
    } else {
        $new = $obj;
    }

    return $new;
}
?>