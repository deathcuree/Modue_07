<?php
session_start();
?>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- ================ ICO IMAGE ================ -->
    <link rel="icon" type="image/x-icon" href="assets/img/white_logo.ico" />

    <!-- ============== TITLE OF THE PAGE ================= -->
    <title>Login</title>

    <!--=============== BOXICONS ===============-->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />

    <!-- ================== CSS LINK ===================== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- CSS LINK -->
    <link rel="stylesheet" href="./assets/css/registration.css">
</head>

<body class="bg-light">
    <!--==================== HEADER ====================-->
    <header class="header" id="header">

    </header>
    <!--==================== END OF HEADER ====================-->

    <!-- ================== REGISTRATION FORM =================== -->
    <main>
        <section class="mt-5">
            <div class="container-sm">
                <div class="row justify-content-center">
                    <div class="col-sm-12 col-md-8 col-lg-6">
                        <form action="process.php" method="post" id="form" autocomplete="off" class="bg-white p-4 rounded-lg">

                            <h1 class="mb-4 text-center registration_font">Login</h1>

                            <div class="form-group input-control">
                                <label for="email">Email</label>
                                <input id="email" name="email" type="email" class="form-control">
                                <div class="error"></div>
                            </div>
                            <div class="form-group input-control">
                                <label for="password">Password</label>
                                <input id="password" name="password" type="password" class="form-control">
                                <div class="error"></div>
                            </div>
                            <button type="submit" name="submit" class="btn btn-primary btn-block">Login</button>

                            <p class="text-center mt-3">
                                Don't have an account? <a href="index.php">Register</a>
                            </p>

                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- ================== END OF REGISTRATION FORM =================== -->
</body>

<!-- ====================== SCRIPTS ========================= -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<!-- ====================== END OF SCRIPTS ========================= -->

</html>