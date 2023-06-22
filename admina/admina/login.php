<?php
session_start();
include 'inc/config.php';
if (!isset($_SESSION['logins'])) { ?>
<!DOCTYPE html>
<!-- saved from url=(0028)http://sukavid.com/adm/login -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
    <title>STARGARD </title>
    <link media="all" type="text/css" rel="stylesheet" href="assets/login/css/m-styles.min.css">
    <link media="all" type="text/css" rel="stylesheet" href="assets/login/css/login.css">
    <script src="assets/login/js/jquery.js"></script>
    <link rel="shortcut icon" href="assets/icon.ico" />

    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">

    <link rel="stylesheet" href="assets/ionic/css/ionicons.min.css">

    <link rel="stylesheet" href="assets/dist/css/AdminLTE.min.css">

    <script type="text/javascript" src="assets/login/js/jquery.backstretch.min.js"></script>
    <script src="assets/login/js/login.js"></script>
</head>

<body>
    <div class="login-box">

        <form method="POST" action="inc/login.php" accept-charset="UTF-8" id="form" novalidate="novalidate">
            <div class="login-box-body">
                <div class="login-logo">
                    <img src="<?= base_admin() ?>assets/LOGO_BLACK.png" style="max-width:250px; margin-top: -7px;" />
                </div>

                <p class="login-box-msg">Sign in to start your session</p>
                <div class="bad alert alert-danger alert-dismissible">Username or Password is not correct. <p>
                    </p>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" id="username" placeholder="Username" autofocus="autofocused"
                        name="username">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="Your Password" id="txtPassword"
                        name="password" type="password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">


                    <div class="col-xs-4">
                        <input class="btn btn-primary btn-block btn-flat" style="width:90px" type="submit" value="Login"
                            id="login">
                    </div>
                </div>
            </div>
    </div>
</body>

</html>
<?php } else {header('location:index.php/');}
?>