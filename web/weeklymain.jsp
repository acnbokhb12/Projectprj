<%-- 
    Document   : weeklymain
    Created on : Jul 4, 2024, 1:47:28 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <section class="weekly__container" >
        <div class="weekly__container__date">
            <div class="weekly-header">
                <div class="weekyly-title">
                    <h1>Latest Menu</h1>
                    <p>Enjoy a fusion of Asian and Western cuisine</p>

                </div>
            </div>
            <div class="container__slider-menu-search">
                <div class="menu-search-item">
                  <form action="ManageWeeklyMenuServlet" method="post">
                      <input type="text" class="menu-search-find-input" name="txtmenuweeklySearch" value="${NameWeekSearch}" placeholder="Search...">
                    <button type="submit" class="menu-search-find-btn"><i class="fas fa-search"></i> </button>
                  </form>
                </div>
              </div>
            <div class="weekly-body ">
                <div class="weekly-section-day" style="display: none;">
                    <ul class="weekly__time">
                        <li class="weekly__time-item weekly__time-item-f ">From</li>
                        <li class="weekly__time-item weekly__time-item-s">27/05</li>
                        <li class="weekly__time-item weekly__time-item-f">To <i
                                class="fa-solid fa-arrow-right-long"></i></li>
                        <li class="weekly__time-item weekly__time-item-s">01/06</li>
                    </ul>
                </div>
                <!-- day weekly -->
                <div class="weekly-title-header-menu row"   >
                    
                    <div class="header-title-item col-md-4">
                        <h3>Meal</h3>
                    </div>
                    <div class="header-title-item col-md-4">
                        <h3>Name</h3>
                    </div>
                    <div class="header-title-item col-md-4">
                        <h3>Price</h3>
                    </div>
                </div>
                <div class="weekly-body-menu">
                     <c:forEach items="${WeekMenu}" var="wm">
                        
                    <a href="ManageWeeklyDetailServlet?mid=${wm.menuId}" class="contain-food-weekly">
                        <div class="weekly-body-header-menu row">
                           
                            <div class="header-menu-item-img col-md-4">
                                <img src="${wm.menuImg}"
                                    alt="">
                            </div>
                            <div class="header-menu-item-name col-md-4">
                                <h3>${wm.menuName}</h3>
                            </div>
                            <div class="header-menu-item-price col-md-4">
                                <h3 class="price-food-weekly">${wm.priceTotalWeek}</h3>
                            </div>
                        </div>
                    </a>               
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
        <script src="./assets/js/footer.js"></script>
        <script>
              const priceweekly = document.querySelectorAll('.price-food-weekly');
         priceweekly.forEach(function (element) {
                let price = parseInt(element.innerText);
                let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                element.innerText = formattedAmount;
            });
        </script>
</body>
</html>