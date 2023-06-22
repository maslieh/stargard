<html>

<head>
    <title>Lat Long Picker</title>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="jquery-1.4.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css.css">
    <script type="text/javascript">
    var peta;
    var pertama = 0;
    var jenis = "restoran";
    var judulx = new Array();
    var desx = new Array();
    var i;
    var url;
    var gambar_tanda;

    function peta_awal() {
        var klaten = new google.maps.LatLng(-7.712182, 110.596790);
        var petaoption = {
            zoom: 12,
            center: klaten,
            mapTypeId: google.maps.MapTypeId.HYBRID
        };
        peta = new google.maps.Map(document.getElementById("petaku"), petaoption);
        google.maps.event.addListener(peta, 'click', function(event) {
            kasihtanda(event.latLng);
        });
        ambildatabase('awal');
    }

    $(document).ready(function() {
        $("#tombol_simpan").click(function() {
            var x = $("#x").val();
            var y = $("#y").val();
            var judul = $("#judul").val();
            var des = $("#deskripsi").val();
            $("#loading").show();
            $.ajax({
                url: "simpanlokasi.php",
                data: "x=" + x + "&y=" + y + "&judul=" + judul + "&des=" + des + "&jenis=" +
                    jenis,
                cache: false,
                success: function(msg) {
                    alert(msg);
                    $("#loading").hide();
                    $("#x").val("");
                    $("#y").val("");
                    $("#judul").val("");
                    $("#deskripsi").val("");
                    ambildatabase('akhir');
                }
            });
        });
        $("#tutup").click(function() {
            $("#jendelainfo").fadeOut();
        });
    });

    function kasihtanda(lokasi) {
        set_icon(jenis);
        tanda = new google.maps.Marker({
            position: lokasi,
            map: peta,
            icon: gambar_tanda
        });
        $("#x").val(lokasi.lat());
        $("#y").val(lokasi.lng());

    }

    function set_icon(jenisnya) {
        switch (jenisnya) {
            case "restoran":
                gambar_tanda = 'icon/restaurant.png';
                break;
            case "piknik":
                gambar_tanda = 'icon/piknik.png';
                break;
            case "masjid":
                gambar_tanda = 'icon/mosque.png';
                break;
        }
    }

    function ambildatabase(akhir) {
        if (akhir == "akhir") {
            url = "ambildata.php?akhir=1";
        } else {
            url = "ambildata.php?akhir=0";
        }
        $.ajax({
            url: url,
            dataType: 'json',
            cache: false,
            success: function(msg) {
                for (i = 0; i < msg.wilayah.petak.length; i++) {
                    judulx[i] = msg.wilayah.petak[i].judul;
                    desx[i] = msg.wilayah.petak[i].deskripsi;

                    set_icon(msg.wilayah.petak[i].jenis);
                    var point = new google.maps.LatLng(
                        parseFloat(msg.wilayah.petak[i].x),
                        parseFloat(msg.wilayah.petak[i].y));
                    tanda = new google.maps.Marker({
                        position: point,
                        map: peta,
                        icon: gambar_tanda
                    });
                    setinfo(tanda, i);

                }
            }
        });
    }

    function setjenis(jns) {
        jenis = jns;
    }

    function setinfo(petak, nomor) {
        google.maps.event.addListener(petak, 'click', function() {
            $("#jendelainfo").fadeIn();
            $("#teksjudul").html(judulx[nomor]);
            $("#teksdes").html(desx[nomor]);
        });
    }
    </script>
    <style>
    #jendelainfo {
        position: absolute;
        z-index: 1000;
        top: 100;
        left: 400;
        background-color: yellow;
        display: none;
    }
    </style>
</head>

<body onload="peta_awal()">
    <center>
        <h1>Lat Long Picker</h1>
        <table id="jendelainfo" border="1" cellpadding="4" cellspacing="0" style="border-collapse: collapse"
            bordercolor="#FFCC00" width="250" height="136">
            <tr>
                <td width="248" bgcolor="#000000" height="19">
                    <font color=white><span id="teksjudul"></span></font>
                </td>
                <td width="30" bgcolor="#000000" height="19">
                    <p align="center">
                        <font color="RED"><a style="cursor:pointer" id="tutup" title="Tutup"><b><img
                                        src="icon/close.png"></b></a></font>
                </td>
            </tr>
            <tr>
                <td width="290" bgcolor="#FFCC00" height="100" valign="top" colspan="2">
                    <p align="left"><span id="teksdes"></span>
                </td>
            </tr>
        </table>
        <table border=0 width=800>
            <tr>
                <td>
                    <div id="petaku" style="width:600px; height:400px"></div>
                </td>
                <td valign=top>
                    Pilih jenis lokasi<p>
                        <input type=radio checked name=jenis value="restoran" onclick="setjenis(this.value)"><img
                            src="icon/restaurant.png"> Restoran<br>
                        <input type=radio name=jenis value="piknik" onclick="setjenis(this.value)"><img
                            src="icon/piknik.png"> Rekreasi<br>
                        <input type=radio name=jenis value="masjid" onclick="setjenis(this.value)"><img
                            src="icon/mosque.png"> Masjid<br>
                    <p>
                        X : <input type=text id=x>
                    <p>
                        Y : <input type=text id=y>
                    <p>
                        Nama:<br>
                        <input type=text id="judul" size=32>
                    <p>
                        Deskripsi:<br>
                        <textarea cols=24 rows=3 id="deskripsi"></textarea>
                    <p>
                        <button id="tombol_simpan">Simpan</button>
                        <img src="icon/ajax-loader.gif" style="display:none" id="loading">
                </td>
            </tr>
        </table>
        <br>
        <table width="815" border="0" cellspacing="1" cellpadding="2" align="center">
            <?php include_once 'koneksi.php'; 
            $id=$_GET[id];
            $query_wisata=mysql_query("select * from peta_icon ") or die (mysql_error());
            $hasil = mysql_query($query);
            $sqlCount = ("select * from peta_icon");
            $rsCount = mysql_num_rows(mysql_query($sqlCount));
            $banyakData = $rsCount;
            if ($_GET[hal] == '') {
                $page = 1;
            } else {
                $page = $_GET[hal];
            }
            $limit = 5;
            $mulai_dari = $limit * ($page - 1);
            $sql_limit = ("select * from peta_icon order by nomor desc limit $mulai_dari, $limit");
            $hasil = mysql_query($sql_limit);
            if(mysql_num_rows($hasil) > 0){
            ?>
            <tr bgcolor="#81a3d0" align="center">
                <td>NAMA</td>
                <td>DESKRIPSI</td>
                <td>LAT</td>
                <td>LONG</td>
                <td>AKSI</td>
            </tr>
            <?php
            while($row=mysql_fetch_row($hasil))
            {
            echo "<tr bgcolor=\"#dee4fa\"><td>";
            echo "$row[1]";
            echo "</td><td>";
            echo "$row[3]";
            echo "</td><td>";
            echo "$row[4]";
            echo "</td><td>";
            echo "$row[5]";
            echo "</td><td>";
            echo "<a href=\"edit.php?id=$row[0]\" title=\"Edit\"><img src=\"icon/edit.png\"></a> | <a href=\"hapus.php?id=$row[0]\"onclick=\"return confirm('Apakah Anda yakin akan menghapus?')\" title=\"Hapus\"><img src=\"icon/hapus.png\"></a>";
            echo "</td></tr>";
            ?>
            <?php } ?>
            <?php
            } else {
            echo "<div style=\"border:1px solid #ff6633; width:280px; height:30px; padding-top:7px; padding-left:5px; background-color:white;\"><div style=\"color:#ff6633; \"></div>";
            }
            ?>
        </table>
        <?php
            $banyakHalaman = ceil($banyakData / $limit);
            //echo 'Halaman: ';
            //echo "<td> ";
            for ($i = 1; $i <= $banyakHalaman; $i++){
            if ($page != $i){
            echo '[<a href="index.php?id='.$id.'&hal='.$i.'">'.$i.'</a>]';
            } else {
            echo "[$i] ";
            }
            }
            //echo "</td>";
            ?>
        <div class="cleaner"></div>
        </div><!-- End Of welcome area -->
        </div>
</body>

</html>