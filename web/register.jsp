<%-- 
    Document   : Register
    Created on : Jun 14, 2024, 2:06:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <div class="btn__back-home " style="display: none">
                <a href="home.jsp" class="link-back-home btn ">
                    <div class=" btn__back-detail">
                        <h2><i class="fa-solid fa-reply"></i>Back To Home</h2>
                    </div>
                </a>

            </div>
            <c:if test="${errorRegister != null}">
                
            <div class="error">
                <div class="error__icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" height="24" fill="none"><path fill="#393a37" d="m13 13h-2v-6h2zm0 4h-2v-2h2zm-1-15c-1.3132 0-2.61358.25866-3.82683.7612-1.21326.50255-2.31565 1.23915-3.24424 2.16773-1.87536 1.87537-2.92893 4.41891-2.92893 7.07107 0 2.6522 1.05357 5.1957 2.92893 7.0711.92859.9286 2.03098 1.6651 3.24424 2.1677 1.21325.5025 2.51363.7612 3.82683.7612 2.6522 0 5.1957-1.0536 7.0711-2.9289 1.8753-1.8754 2.9289-4.4189 2.9289-7.0711 0-1.3132-.2587-2.61358-.7612-3.82683-.5026-1.21326-1.2391-2.31565-2.1677-3.24424-.9286-.92858-2.031-1.66518-3.2443-2.16773-1.2132-.50254-2.5136-.7612-3.8268-.7612z"></path></svg>
                </div>
                <div class="error__title">${errorRegister}</div>
                <div class="error__close"><svg xmlns="http://www.w3.org/2000/svg" width="20" viewBox="0 0 20 20" height="20"><path fill="#393a37" d="m15.8333 5.34166-1.175-1.175-4.6583 4.65834-4.65833-4.65834-1.175 1.175 4.65833 4.65834-4.65833 4.6583 1.175 1.175 4.65833-4.6583 4.6583 4.6583 1.175-1.175-4.6583-4.6583z"></path></svg></div>
            </div>
            </c:if>
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
                            <h1 class="signup-header-title">Wellcome to family</h1>
                            <p class="signup-header-desc">Discover more about cusine in the world </p>
                        </header>
                        <div class="signup-user-body">
                            <form action="registerServlet" class="form" id="form2" method="post">
                                <!-- Email -->
                                <div class="form-group">
                                    <i class="fa-solid fa-envelope  icon-signup"></i>
                                    <input type="email" id="email-signup" name="txtemail" class="input-user-signup" value="<%= request.getAttribute("oldEmail") != null ? request.getAttribute("oldEmail") : ""%>"
                                           placeholder="Email" required>
                                    <!-- <label for="email-signup" class="label-title-infor-signup"> Email</label> -->
                                    <span class="error-format-email"><%= request.getAttribute("errorEmail") != null ? request.getAttribute("errorEmail") : 
                                                                            (request.getAttribute("emailExist") != null ? request.getAttribute("emailExist") : "") %></span>
                                </div>

                                <!-- password -->
                                <div class="form-group">
                                    <i class="fa-solid fa-lock icon-signup"></i>
                                    <input type="password" id="password-title-signup" name="txtpassword"
                                           class="input-user-signup" value="<%= request.getAttribute("oldPass") != null ? request.getAttribute("oldPass") : ""%>" placeholder="Password" required />
                                    <!-- <label for="password-title-signup" class="label-title-infor-signup"><i class="fa-solid fa-lock icon-signup"></i> Password</label>  -->
                                    <!-- <span class="error-format-pass">Length from 8 to 20</span> -->
                                </div>
                                <!-- pass wordd again -->
                                <div class="form-group">
                                    <i class="fa-solid fa-lock icon-signup"></i>
                                    <!-- <label for="password-title-signup" class="label-title-infor-signup">Confirm password</label>                       -->
                                    <input type="password" id="password-title-signup" name="txtRepass"
                                           class="input-user-signup" value="<%= request.getAttribute("oldRePass") != null ? request.getAttribute("oldRePass") : ""%>" placeholder="Confirm password" required />

                                    <span class="error-notmatch-pass"> <%= request.getAttribute("errorSamePass") != null ? request.getAttribute("errorSamePass") : ""%> </span>

                                </div>
                                <!-- UserName -->
                                <div class="form-group">
                                    <i class="fa-solid fa-user icon-signup"></i>
                                    <!-- <label for="username-title-logup" class="label-title-infor-signup">UserName</label>                       -->
                                    <input type="text" id="username-title-logup" name="txtusername"
                                           class="input-user-signup" value="<%= request.getAttribute("oldUserName") != null ? request.getAttribute("oldUserName") : ""%>" placeholder="UserName" required />
                                    <span class="error-username"> <%= request.getAttribute("errorUserName") != null ? request.getAttribute("errorUserName") : ""%> </span>

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
    <style>
        .error {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  width: 320px;
  padding: 12px;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: start;
  background: #EF665B;
  border-radius: 8px;
  box-shadow: 0px 0px 5px -3px #111;
  margin-bottom: 30px;
  align-self: end;
  margin-right: 20px;
}

.error__icon {
  width: 20px;
  height: 20px;
  transform: translateY(-2px);
  margin-right: 8px;
}

.error__icon path {
  fill: #fff;
}

.error__title {
  font-weight: 500;
  font-size: 14px;
  color: #fff;
}

.error__close {
  width: 20px;
  height: 20px;
  cursor: pointer;
  margin-left: auto;
}

.error__close path {
  fill: #fff;
}
    </style>

</body>

</html>
