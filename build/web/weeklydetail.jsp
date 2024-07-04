<%-- 
    Document   : weeklydetail
    Created on : Jul 4, 2024, 1:53:42 PM
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
      <!-- Font family -->
      <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
      rel="stylesheet">
  <!-- Font icon -->
  <!-- <link rel="stylesheet" href="./assets/font/fontawesome-free-6.5.2-web/css/all.min.css"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 
  <!-- <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> -->
  <link rel="stylesheet" href="./assets/css/base.css">
  <link rel="stylesheet" href="./assets/css/main.css">
  <link rel="stylesheet" href="./assets/css/weeklydetail.css">
</head>
<body>
    <%
        Account user = (Account) session.getAttribute("CustomerAcc");
            
        int accId = 0;
        String email="";
        String password="";
        String userName = "";
        String phoneNumber="";
        String role ="";
        int aStatusId = 0;
        if (user != null) {
            accId = user.getAccId();
            userName = user.getUserName();
        }
    %>
    
    <script>
        var user = {
           accid: '<%= accId %>',
            name: '<%= userName %>'
        };
             
    </script>
    <script src="./assets/js/header.js"></script>
    <section class="weekly__container"  >
        <div class="weekly__container__date">
            <div class="weekly-header">
                <div class="weekyly-title">
                    <h1>Name</h1>
                    <p>Enjoy a fusion of Asian and Western cuisine</p>

                </div>
            </div>
            <div class="weekly-body ">
                 
                <!-- day weekly -->
                <div class="weekly-title-header-menu row"   >
                    <div class="header-title-item col-md-3 ">
                        <h3 style="background-image: linear-gradient(109.6deg, rgba(156, 252, 248, 1) 11.2%, rgba(110, 123, 251, 1) 91.1%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; color: transparent; opacity: 1;">Date</h3>
                    </div>
                    <div class="header-title-item col-md-3">
                        <h3>Breakfast</h3>
                    </div>
                    <div class="header-title-item col-md-3">
                        <h3>Lunch</h3>
                    </div>
                    <div class="header-title-item col-md-3">
                        <h3>Dinner</h3>
                    </div>
                </div>
                <div class="weekly-body-menu">
                    <div class="contain-food-weekly">

                        <!-- cai the row nay contain 1 day va bao gom 3 bua -->
                        <div class="weekly-body-header-menu row">
                             <!-- The dau nay la cho Day 1,2,3... -->
                            <div class="container-infor-fooditem col-md-3" >
                                <a href="#" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">                       
                                            <p class="title" style="height: auto; line-height: normal; font-size: 3rem;">Day <span>1</span></p>                              
                                        </div>
                                        <div class="flip-card-back">
                                            <p class="title">Total</p>
                                            <p class="price-detailfood-date">300000</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                             <!-- 3 the voi col-md-3 nay la 3 bua breakfast , luch,...-->
                             <div class="container-infor-fooditem col-md-3" >
                                <a href="#" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">
                                            <img src="https://www.thespruceeats.com/thmb/t4lCYagGImoWlxPtNTGO9LyzFcE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-chawanmushi-2031018-b28c243bca854d51a259c0ab4ce6e64f.jpg" alt="">
                                            <p class="title">chawanmushi</p>
                                            <!-- <p>Hover Me</p> -->
                                        </div>
                                        <div class="flip-card-back">
                                            <p class="title">soup</p>
                                            <p class="price-detailfood-date">300000</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                             <div class="container-infor-fooditem col-md-3" >
                                <a href="#" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">
                                            <img src="https://www.salepepe.it/files/2014/06/bigoli-sugo-anatra.jpg" alt="">
                                            <p class="title">Bigoli con l'anatra</p>
                                            <!-- <p>Hover Me</p> -->
                                        </div>
                                        <div class="flip-card-back">
                                            <p class="title">pasta</p>
                                            <p class="price-detailfood-date">160000</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                             <div class="container-infor-fooditem col-md-3" >
                                <a href="#" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">
                                            <img src="https://www.jocooks.com/wp-content/uploads/2020/06/chicken-gyros-1-14.jpg" alt="">
                                            <p class="title">Gyros</p>
                                            <!-- <p>Hover Me</p> -->
                                        </div>
                                        <div class="flip-card-back">
                                            <p class="title">appentizer</p>
                                            <p class="price-detailfood-date">200000</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                            <!-- dong 3 the  -->   
                        </div>
                        
                    </div>
                
                </div>
            </div>
        </div>
    </section>
     
    <style>
      
    </style>
    <script src="./assets/js/footer.js"></script>

    <script>
        const priceweekly = document.querySelectorAll('.price-detailfood-date');
   priceweekly.forEach(function (element) {
          let price = parseInt(element.innerText);
          let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
          element.innerText = formattedAmount;
      });
  </script>
</body>
</html> 