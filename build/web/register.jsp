<%-- 
    Document   : Register
    Created on : Jun 14, 2024, 2:06:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Font family -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <!-- Font icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
</head>

<body>
    <div class="screen__info__user">
        <div class="btn__back-home ">
            <a href="home.jsp" class="link-back-home btn ">
                <div class=" btn__back-detail">
                    <h2><i class="fa-solid fa-reply"></i>Back To Home</h2>
                </div>
            </a>

        </div>
        <div class="info__user-container container">

            <!-- SIGNUP  -->
            <div id="sign-up-form" class="user-signup form-container">
                <div class="user-signup-img">
                    <div class="signup-img-desc">
                        <h1>Sign Up</h1>
                        <p>Please enter your details to sign up and be part of our community. <i
                                class="fa-solid fa-heart"></i></p>
                        <h3>Make or Made</h3>
                    </div>
                </div>
                <div class="user-sign-container">

                    <header class="user-signup-header">
                        <h1 class="signup-header-title">Wellcom to family</h1>
                        <p class="signup-header-desc">Discover more about cusine in the world </p>
                    </header>
                    <div class="signup-user-body">
                        <form action="#" class="form" id="form2" method="post">
                            <!-- Email -->
                            <div class="form-group">
                                <i class="fa-solid fa-envelope  icon-signup"></i>
                                <input type="email" id="email-signup" name="txtemail" class="input-user-signup"
                                    placeholder="Email" required>
                                <!-- <label for="email-signup" class="label-title-infor-signup"> Email</label> -->
                                <span class="error-format-email">Wrong format email : abc@gmail.com</span>
                            </div>

                            <!-- password -->
                            <div class="form-group">
                                <i class="fa-solid fa-lock icon-signup"></i>
                                <input type="password" id="password-title-signup" name="txtpassword"
                                    class="input-user-signup" placeholder="Password" required />
                                <!-- <label for="password-title-signup" class="label-title-infor-signup"><i class="fa-solid fa-lock icon-signup"></i> Password</label>  -->
                                <span class="error-format-pass">Length from 8 to 20</span>
                            </div>
                            <!-- pass wordd again -->
                            <div class="form-group">
                                <i class="fa-solid fa-lock icon-signup"></i>
                                <!-- <label for="password-title-signup" class="label-title-infor-signup">Confirm password</label>                       -->
                                <input type="password" id="password-title-signup" name="txtconfirmpassword"
                                    class="input-user-signup" placeholder="Confirm password" required />

                                <span class="error-notmatch-pass">passwords are not the same</span>

                            </div>
                            <!-- UserName -->
                            <div class="form-group">
                                <i class="fa-solid fa-user icon-signup"></i>
                                <!-- <label for="username-title-logup" class="label-title-infor-signup">UserName</label>                       -->
                                <input type="text" id="username-title-logup" name="txtusername"
                                    class="input-user-signup" placeholder="UserName" required />
                                <span class="error-username">username must be words</span>

                            </div>
                            <!-- Phone -->
                            <!-- <div class="form-group">
                                <i class="fa-solid fa-phone icon-signup"></i>
                                <input type="text" id="phonenumber-signup" name="txtphone" class="input-user-signup"
                                    placeholder="Phone number" required />
                                <span class="error-format-number">Start number with 0 </span>
                            </div> -->
                            <!-- Submit -->
                            <button class="btn btn-info btn-signup-user">Sign Up</button><br>

                        </form>
                    </div>
                    <footer class="user-signup-footer">
                        <p class="have-account">
                            Already have an account?<a href="login.jsp" class="signin-btn-link" id="come-signin">Sign
                                In</a>
                        </p>
                    </footer>

                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- <script src="./assets/js/main.js"></script> -->
</body>

</html>
