<%-- 
    Document   : weeklydetail
    Created on : Jul 4, 2024, 1:53:42 PM
    Author     : DELL
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Details</title>
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
                    <div class="header-title-item col-sm-4 col-md-3">
                        <h3>Breakfast</h3>
                    </div>
                    <div class="header-title-item col-sm-4 col-md-3">
                        <h3>Lunch</h3>
                    </div>
                    <div class="header-title-item col-sm-4 col-md-3">
                        <h3>Dinner</h3>
                    </div>
                </div>
                <div class="weekly-body-menu">
                    <div class="contain-food-weekly">
                         
                        
                        <c:forEach items="${hashMenu}" var="entry">
                            
                         
                        <!-- cai the row nay contain 1 day va bao gom 3 bua -->
                        <div class="weekly-body-header-menu row">
                             <!-- The dau nay la cho Day 1,2,3... -->
                            <div class="container-infor-fooditem col-md-3" >
                                <a href="#" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">                       
                                            <p class="title" style="height: auto; line-height: normal; font-size: 3rem;">Day <span>${entry.key}</span></p>                              
                                        </div>
                                        <div class="flip-card-back">
                                            <p class="title">Total</p>
                                            <c:set var="totalPriceDay" value="0"></c:set>
                                            <c:forEach items="${entry.value}" var="fp" >
                                               <c:set var="totalPriceDay" value="${totalPriceDay+ fp.price}"></c:set>
                                            </c:forEach>

                                            <p class="price-detailfood-date">${totalPriceDay}</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                             <!-- 3 the voi col-md-3 nay la 3 bua breakfast , luch,...-->
                             <c:forEach items="${entry.value}" var="f" >
                                 
                             <div class="container-infor-fooditem col-sm-4 col-md-3" >
                                <a href="ControllerServlet?action=foodDe&fid=${f.foodId}" class="flip-card">
                                    <div class="flip-card-inner">
                                        <div class="flip-card-front">
                                            <img src="${f.image}" alt="">
                                            <p class="title">${f.name}</p>
                                            <!-- <p>Hover Me</p> -->
                                        </div>
                                        <div class="flip-card-back">
                                            <c:forEach items="${f.categories}" var="cat">
                                                
                                            <p class="title">-${cat.categoriesName} </p>
                                            </c:forEach>
                                                
                                            
                                            <p class="price-detailfood-date">${f.price}</p>
                                        </div>
                                    </div>
                                </a>
                             </div>
                             </c:forEach>
                             
                            <!-- dong 3 the  -->   
                        </div>
                       </c:forEach>

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