<%-- 
    Document   : Login
    Created on : Jun 14, 2024, 2:06:15 PM
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
            <!-- SIGNIN -->
            <div id="sign-in-form" class="user-signin form-container">
                <div class="user-sign-container">

                    <header class="user-signin-header">
                        <h1 class="signin-header-title">Welcome back!</h1>
                        <p class="signin-header-desc">Enter your Information to access your account</p>
                    </header>
                    <div class="signin-user-body">
                        <form action="MainControllerServlet" class="form" id="form1" method="post">
                            <!-- username -->
                            <label for="email-log" class="label-title-infor"><i
                                    class="fa-solid fa-envelope"></i></i>Email</label><br>
                            <input type="email" id="email-log" name="txtemail" class="input-user-signin"
                                   placeholder=" Enter your email" value="<%= request.getAttribute("emailError") !=null ? request.getAttribute("emailError"):"" %>" required><br>
                            <!-- password -->
                            <label for="password-title-signin" class="label-title-infor"><i
                                    class="fa-solid fa-lock"></i>Password</label><br>
                            <input type="password" id="password-title-signin" name="txtpassword"
                                   class="input-user-signin last-child" placeholder=" Enter your password" value="<%= request.getAttribute("passwordError") !=null ? request.getAttribute("passwordError"):"" %>" required /><br>
                            <!-- take error something -->
                            <%
                             String loginError = (String) request.getAttribute("loginError");
                                if (loginError != null) {
                            %>
                                <span id="wrongNameOrPass" class="error-user"><%= loginError %></span><br><br>
                            <%
                                }
                            %>

                            <button type="submit" class="btn btn-info btn-login-user" name="action" value="loginServlet">Sign In</button><br>
                            <a href="#" class="user-forgot">Forgot your password?</a><br>
                        </form>
                        
                    </div>
                    <footer class="user-signin-footer">
                        <p class="dont-have-account">
                            Don't have an account?<a href="register.jsp" class="signup-btn-link" id="come-signup">Sign
                                Up</a>
                        </p>
                    </footer>

                </div>
                <div class="user-signin-img">

                    <div class="signin-img-desc">
                        <h1>Sign In</h1>
                        <p>Happy to see you are a part of our great community.
                            <i class="fa-solid fa-heart"></i>
                        </p>
                        <h3>Make or Made</h3>
                    </div>

                </div>
            </div>


        </div>
    </div>


    <!-- <script src="./assets/js/main.js"></script> -->
</body>

</html>