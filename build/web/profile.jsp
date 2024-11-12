<%-- 
    Document   : profile
    Created on : Jul 15, 2024, 9:27:15 PM
    Author     : DELL
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
</head>
<body>
     <%
            Account user = (Account) session.getAttribute("UserAcc");

            int accId = 0;
            String email = "";
            String password = "";
            String userName = "";
            String phoneNumber = "";
            String role = "";
            int aStatusId = 0;
            if (user != null) {
                accId = user.getAccId();
                userName = user.getUserName();
            }
        %>
        <script>
            var user = {
                accid: '<%= accId%>',
                name: '<%= userName%>'
            };
                    </script>
    <script src="./assets/js/header.js"></script>
    <div class=" container-profile">
        <div class="container container-detail-profile">
            <div class="page-content page-container" id="page-content">
                <div class="padding-card">
                    <div class=" row-container row  ">
            <div class=" col-md-12">
                                                            <div class="   user-card-full">
                                                                <div class="row  row-detail-profile ">
                                                                    <div class="cot-img-user col-md-4 bg-c-lite-green user-profile">
                                                                        <div class="  text-center text-white">
                                                                            <div class=" container-img-profile">
                                                                                <img style=" padding: 4px 0; border-radius: 0;" src="https://mir-s3-cdn-cf.behance.net/project_modules/hd/c575d435418291.56f613efddcf7.jpg" class="img-radius" alt="User-Profile-Image">
                                                                            </div>
                                                                            <h6 class="name-user" style="font-size: 2rem; background-color: #000; color: #fff;">${sessionScope.UserAcc.userName}</h6>
                                                                            <p class="role-user">
                                                                                ${sessionScope.UserAcc.role}
                                                                            </p>
                                                                            <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                                                        </div>
                                                                        <div class="plan">
                                                                            <div class="inner">
                                                                                <span class="pricing">
                                                                                    <span>
                                                                                        $49 <small>/ m</small>
                                                                                    </span>
                                                                                </span>
                                                                                <p class="title" style="font-weight: 700;">Premium</p>
                                                                                <p class="info">Receive the earliest promotional, promotional information via email.</p>
                                                                                <ul class="features">
                                                                                    <li>
                                                                                        <span class="icon">
                                                                                            <svg height="24" width="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                                                <path d="M0 0h24v24H0z" fill="none"></path>
                                                                                                <path fill="currentColor" d="M10 15.172l9.192-9.193 1.415 1.414L10 18l-6.364-6.364 1.414-1.414z"></path>
                                                                                            </svg>
                                                                                        </span>
                                                                                        <span>10% discount on all orders.</span>
                                                                                    </li>
                                                                                    <li>
                                                                                        <span class="icon">
                                                                                            <svg height="24" width="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                                                <path d="M0 0h24v24H0z" fill="none"></path>
                                                                                                <path fill="currentColor" d="M10 15.172l9.192-9.193 1.415 1.414L10 18l-6.364-6.364 1.414-1.414z"></path>
                                                                                            </svg>
                                                                                        </span>
                                                                                        <span>Free shipping for all orders.</span>
                                                                                    </li>
                                                                                    <li>
                                                                                        <span class="icon">
                                                                                            <svg height="24" width="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                                                <path d="M0 0h24v24H0z" fill="none"></path>
                                                                                                <path fill="currentColor" d="M10 15.172l9.192-9.193 1.415 1.414L10 18l-6.364-6.364 1.414-1.414z"></path>
                                                                                            </svg>
                                                                                        </span>
                                                                                        <span>Get a free dessert with every order.</span>
                                                                                    </li>
                                                                                </ul>
                                                                                <div class="action">
                                                                                <a class="button" href="#">
                                                                                    Choose plan
                                                                                </a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="cot-desc-user col-md-8">
                                                                        <div class=" ">
                                                                            <h6 class="intro-information m-b-20 p-b-5 b-b-default ">Information</h6>
                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <p class="intro-title m-b-10 f-w-600">Email</p>
                                                                                    <h6 class="intro-description f-w-400">${sessionScope.UserAcc.email}</h6>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <p class="intro-title m-b-10 f-w-600">Phone</p>
                                                                                    <h6 class="intro-description f-w-400">${sessionScope.UserAcc.phoneNumber != null ? sessionScope.UserAcc.phoneNumber : "You have not updated your phone number." }</h6>
                                                                                </div>
                                                                            </div>
                                                                            <h6 class="intro-information m-b-20 m-t-40 p-b-5 b-b-default ">Projects</h6>
                                                                            <div class="row">
                                                                                <div class="col-sm-6">
                                                                                    <p class="intro-title m-b-10 f-w-600">Recent</p>
                                                                                    <h6 class="intro-description f-w-400">Sam Disuja</h6>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                    <p class="intro-title m-b-10 f-w-600">Most Viewed</p>
                                                                                    <h6 class="intro-description f-w-400">Dinoter husainm</h6>
                                                                                </div>
                                                                            </div>
                                                                            <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                                <div>
                                                                                    <h2>Update phone number</h2>
                                                                                    <form action="UpdatePhoneServlet" method="post">
                                                                                        <input name="phone" type="text">
                                                                                        <button type="submit">Update</button>
                                                                                    </form>
                                                                                </div>        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         </div>
                                                            </div>
                                                        </div>
        </div>
    </div>
    <script src="./assets/js/footer.js"></script>
    <style>
        .container-profile{
            padding-top: 136px;
            background: url('https://wellness.mcmaster.ca/app/uploads/2021/10/Untitled-design-17.png') no-repeat;
            /* background-position: center; */
            background-size: cover;
            object-fit: cover;
            /* height: 100vh; */
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        .container-detail-profile{
          
        }
        
        .padding-card { 
            background-color: #f9f9fa;
            padding: 3rem 0;
            border-radius: 10px;
 
            margin-bottom: 2.4rem;
}
.row-container{
 
    margin-left: 0;
    margin-right: 0;
}
.user-card-full {
   
}

.card {
    border-radius: 5px;
    -webkit-box-shadow: 0 1px 20px 0 rgba(69,90,100,0.08);
    box-shadow: 0 1px 20px 0 rgba(69,90,100,0.08);
    border: none;
    margin-bottom: 30px;
    width: 100%;
    
}
.card-block{
    padding: 0;
    
}
.row-detail-profile{
   /* height: 100%; */
}
.user-profile{
    /* height: 100%; */
}
.cot-img-user{
    display: flex;
    /* justify-content: center; */
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
}

.container-img-profile{

}
.container-img-profile img{
    width: 100%;
    height: 150px;
    border-radius: 10px;
    background-size: cover;
    background-position: center;
    object-fit: cover;
}
.name-user{
    color: #000;
    font-size: 1.6rem;
    margin-bottom: 0;
    font-weight: 700;
}
.role-user{
    color: #4f4f4f;
    font-size: 1.4rem;
    margin-bottom: 8px;
}
.intro-information{
    font-size: 2.4rem;
    font-weight: 600;
}
.intro-title{
    font-size: 1.8rem;
}
.intro-description{
    font-size: 1.6rem;
    color: #767676 ;
}
 

@media only screen and (min-width: 1400px){
p {
    font-size: 14px;
}
}

.card-block {
    padding: 1.25rem;
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.m-b-20 {
    margin-bottom: 20px;
}

.p-b-5 {
    padding-bottom: 5px !important;
}

.card .card-block p {
    line-height: 25px;
}

.m-b-10 {
    margin-bottom: 10px;
}

.text-muted {
    color: #919aa3 !important;
}

.b-b-default {
    border-bottom: 1px solid #e0e0e0;
}

.f-w-600 {
    font-weight: 600;
}

.m-b-20 {
    margin-bottom: 20px;
}

.m-t-40 {
    margin-top: 20px;
}

.p-b-5 {
    padding-bottom: 5px !important;
}

.m-b-10 {
    margin-bottom: 10px;
}

.m-t-40 {
    margin-top: 20px;
}

.user-card-full .social-link li {
    display: inline-block;
}

.user-card-full .social-link li a {
    font-size: 20px;
    margin: 0 10px 0 0;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

/* dsadfasdfasd */
.plan {
  border-radius: 16px;
  box-shadow: 0 30px 30px -25px rgba(0, 38, 255, 0.205);
  padding: 10px;
  background-color: #000;
  color: #697e91;
  max-width: 300px;
}

.plan strong {
  font-weight: 600;
  color: #425275;
}

.plan .inner {
  align-items: center;
  padding: 20px;
  padding-top: 40px;
  background-color: #ecf0ff;
  border-radius: 12px;
  position: relative;
}

.plan .pricing {
  position: absolute;
  top: 0;
  right: 0;
  background-color: #bed6fb;
  border-radius: 99em 0 0 99em;
  display: flex;
  align-items: center;
  padding: 0.625em 0.75em;
  font-size: 1.25rem;
  font-weight: 600;
  color: #425475;
}

.plan .pricing small {
  color: #707a91;
  font-size: 0.75em;
  margin-left: 0.25em;
}

.plan .title {
  font-weight: 600;
  font-size: 2rem;
  color: #425675;
  font-weight: 600;
  margin-bottom: 4px;
}

.plan .title + * {
  margin-top: 0rem;
  margin-bottom: 0;
  font-size: 1.4rem;
}

.plan .info + * {
  margin-top: 1rem;
}

.plan .features {
  display: flex;
  flex-direction: column;
  padding-left: 0;
}

.plan .features li {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 1.4rem;
}

.plan .features li + * {
  margin-top: 0.75rem;
}

.plan .features .icon {
  background-color: #1FCAC5;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  border-radius: 50%;
  width: 20px;
  height: 20px;
}

.plan .features .icon svg {
  width: 14px;
  height: 14px;
}

.plan .features + * {
  margin-top: 1.25rem;
}

.plan .action {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: end;
}

.plan .button {
  background-color: #6558d3;
  border-radius: 6px;
  color: #fff;
  font-weight: 500;
  font-size: 1.4rem;
  text-align: center;
  border: 0;
  outline: 0;
  width: 100%;
  padding: 0.625em 0.75em;
  text-decoration: none;
}

.plan .button:hover, .plan .button:focus {
  background-color: #4133B7;
}
@media screen and (max-width:768px) {
    .intro-information:first-child{
        margin-top: 1.5rem;
    }
}
    </style>
</body>
</html>
