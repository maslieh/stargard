<!-- Content Header (Page header) -->

<style>
/*
* posisi kontainer inherit dari parent jika belum diprint
*/
.parentprintarea {
    z-index: inherit;
}

.printarea {
    z-index: inherit;
}

/*elemen yang disembunyikan ketika tidak dicetak, tetapi tampil ketika dicetak, contoh <button class="btn printonly"></button>" */
.printonly {
    display: none;
}

/*
*  style ketika di print
*/
@media print {
    body * {
        visibility: hidden;
    }

    .parentprintarea {
        visibility: visible;
        height: initial;
        position: absolute;
        top: 0;
        padding: 0;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    .parentprintarea * {
        visibility: visible;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    /*apabila print area berada di dalam section, maka akan seperti ini <section class="paretprintarea"><div class="printarea"></div></section>*/
    /*apabile element yang dicetak tidak auto width, maka akan seperti ini <section class="paretprintarea"><div class="printarea"><div class="w400px"></div></div></section>*/
    .printarea {
        visibility: visible;
        height: initial;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    .printarea * {
        visibility: visible;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    /*printable area berada di dalam <section class="printarea-single"></section>*/
    .printarea-single {
        visibility: visible;
        height: initial;
        position: absolute;
        top: 0;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    .printarea-single * {
        visibility: visible;
        box-shadow: none !important;
        background-color: white !important;
        background-image: none !important;
    }

    .onecolumn {
        min-width: 51%;
    }

    .w400px {
        width: 400px;
    }

    .scale75 {
        transform: scale(0.85);
        transform-origin: top left;
    }

    /*semua ahref akan ditampilkan link-nya, bukan teks-nya*/
    .showhrefprint::after {
        content: attr(href);
    }

    /*hanya menampilkan teks, bootstrap*/
    .form-control,
    .form-select,
    .input-group-text,
    /*hanya menampilkan teks, select2*/
    .select2-selection--single,
    /*hanya menampilkan teks, selain itu*/
    input,
    select {
        border-width: 0px 0px 1px 0px !important;
        padding: 0;
        overflow: visible;
    }

    fieldset {
        display: block !important;
        visibility: visible !important;
        opacity: 1 !important;
    }

    /*elemen yang tampil ketika tidak dicetak, tetapi disembunyikan ketika dicetak, contoh <button class="btn hideprint"></button>" */
    .hideprint {
        display: none;
    }

    /*elemen yang disembunyikan ketika tidak dicetak, tetapi tampil ketika dicetak, contoh <button class="btn printonly"></button>" */
    .printonly {
        display: block !important;
    }

    /*membuat satu elemen dalam 1 halaman*/
    .keeptogether-team {
        page-break-inside: avoid;
    }

    /*menampilkan border ketika dicetak*/
    .printborder {
        border: thin gray solid !important;
    }

    /*membuat border melengkung ketika dicetak*/
    .printrounded {
        border-radius: 2rem !important;
    }
}


.pembungkus {
    position: relative;
}


h1 {
    color: white;
}

h2 {
    position: absolute;
    left: 730px;
    top: 10px;
    color: white;
}

h3 {
    position: absolute;
    left: 40px;
    top: 150px;
    color: yellow;
}

h4 {
    position: absolute;
    left: 40px;
    top: 170px;
    color: magenta;
}
</style>
</style>
<section class="content-header">
    <h1>
        Data spk detail
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= base_index() ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= base_index() ?>spk">PRINT</a></li>
        <li class="active">SPK</li>
    </ol>
</section>

<!-- Main content -->

<div class="box-body" onload="window.print();">
    <section class="invoice">
        <?php
        $datas = $db->fetch_custom_single(
            "select * from t_transaksi where waranti='$tek'"
        );
        $datas1 = $db->fetch_custom_single(
            "select * from t_garansi where id_data='$tek'"
        );
        $date = date_create();
        ?>
        <section class="parentprintarea">
            <div class="container shadow-lg bg-gradient rounded">
                <div class="row justify-content-center">
                    <div class="col text-center printarea">
                        <img src="<?= base_admin() ?>assets/card.jpeg" width="900" height="450" alt="User Image">
                        <h2>
                            itu asik loh
                        </h2>
                    </div>
                    <div class="col text-center hideprint">
                        <!-- ... -->
                    </div>
                </div>
            </div>
            <!-- ... -->
        </section>



        <br /> <br /> <br /> <br /> <br /> <br /><br /><br /><br /><br />
        <br />
        <br />
        <br />
        <br />
        <button onclick="window.print()" id="printPageButton">Print this page</button>
    </section>
</div>