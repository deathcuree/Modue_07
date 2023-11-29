<?php
// Include your database connection file or create a PDO connection here
include('connection.php');

// Initialize variables
$loginErrors = [];

// Check if the form is submitted
if (isset($_POST['submit'])) {
    // Include the process.php file to handle form processing
    include('login-process.php');
}

session_start();
?>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- ================ ICO IMAGE ================ -->
    <link rel="icon" type="image/x-icon" href="./assets/images/white_logo.ico" />

    <!-- ============== TITLE OF THE PAGE ================= -->
    <title>Login</title>

    <!--=============== BOXICONS ===============-->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />

    <!-- ============== FONT AWESOME ============== -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- ================== Bootstrap Link ===================== -->
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
                        <form action="login-process.php" method="post" id="form" autocomplete="on" class="bg-white p-4 rounded-lg">

                            <h1 class="mb-4 text-center registration_font">Login</h1>

                            <div class="form-group input-control pt-2">
                                <label for="email">Email</label>
                                <input id="email" name="email" type="email" class="form-control">
                                <div class="error_message error" id="email-error"></div>
                            </div>

                            <div class="form-group input-control pt-2">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <input id="password" name="password" type="password" class="form-control">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fas fa-eye toggle-password" id="togglePassword"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="error_message error" id="password-error"></div>
                            </div>

                            <button type="submit" name="login" class="btn btn-primary btn-block">Login</button>

                            <p class="text-center mt-3">
                                Don't have an account? <a href="registration.php">Register</a>
                            </p>

                            <!-- Bootstrap Modal for Success Message -->
                            <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="successModalLabel">Login Successful!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <?= $registrationSuccessMessage; ?>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- ================== END OF REGISTRATION FORM =================== -->
</body>

<!-- ====================== SCRIPTS ========================= -->
<!-- Jquery Script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Bootstrap Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
        // Show/hide password functionality
        $('#togglePassword').on('click', function() {
            var passwordField = $('#password');
            var type = passwordField.attr('type') === 'password' ? 'text' : 'password';
            passwordField.attr('type', type);
            $(this).toggleClass('fa-eye fa-eye-slash');
        });
    });

    $(document).ready(function() {
        $("#form").submit(function(e) {
            e.preventDefault();

            $.ajax({
                type: "POST",
                url: "login-process.php",
                data: $("#form").serialize(),
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    $(".error_message").empty().hide(); // Clear and hide all error messages

                    if (response.success) {
                        $("#successModal .modal-body").html(response.success);
                        $("#successModal").modal('show');
                    } else {
                        // Show errors for each field that failed validation
                        $.each(response, function(key, value) {
                            $("#" + key + "-error").html(value).show();
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    alert("Error logging in.");
                },
            });
        });

        $('#successModal').on('hidden.bs.modal', function() {
            window.location.href = 'dashboard.php';
        });
    });
</script>


<!-- ====================== END OF SCRIPTS ========================= -->

</html>