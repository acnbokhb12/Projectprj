<%-- 
    Document   : Home
    Created on : Jun 14, 2024, 2:05:09 PM
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
    <title>Make Or Made</title>
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
    <div class="home">
        <div class="home__background"></div>
        <div class="home__script-container">
            <div class="home-title js-header">
                <h1>Welcom to the kitchen of Kahof MaKed<//h1>
            </div>
            <div class="home-script">
                <p>Kahof is a team professional food photographer and recipe developer who writes the food blog "The
                    Kitchen Afhokh" There we shares seasonal recipes based on whole ingredients accompanied by story
                    photographs.</p>
            </div>
            <a href="#content-home" class="home-link">
                <span class="home-link-script">
                    Discover more <i class="fa-solid fa-right-long"></i>
                </span>
            </a>
        </div>
    </div>
    <!-- Most popular recipe -->
    <div id="content-home" class="content">
        <section class="content__popular">
            <div class="content__popular-container ">
                <div class="popular-title">
                    <h1>Most Popular Recipes</h1>
                    <p>Explore our most loved and highly rated recipes that everyone is talking about</p>
                </div>
                <div class="popular-list row ">
                    <c:forEach items="${ListTopFood}" var="fn" begin="0" end="1">
                      
                            
                    <div class="popular-list-item col-md-6 ">
                        
                        <a href="DetailFoodServlet?fid=${fn.foodId}" class="popular-link">
                            <div class="img-popular popular-top-second">

                                <img src="${fn.image}"
                                    alt="">
                            </div>
                            <div class="popular-script">

                                <h2>${fn.name}</h2>
                                <p>
                                    <c:forEach items="${fn.categories}" var="cate1">
                                        - ${cate1.categoriesName}
                                    </c:forEach>
                                </p>
                            </div>
                        </a>
                    </div>
                        
                    </c:forEach>
                    
                     <c:forEach items="${ListTopFood}" var="fn" begin="2" end="4">

                    <div class="popular-list-item col-md-4">
                        <a href="DetailFoodServlet?fid=${fn.foodId}" class="popular-link">
                            <div class="img-popular">

                                <img src="${fn.image}"
                                    alt="">
                            </div>
                            <div class="popular-script">

                                <h2>${fn.name}</h2>
                                <p>
                                     <c:forEach items="${fn.categories}" var="cate1">
                                        - ${cate1.categoriesName}
                                    </c:forEach>
                                </p>
                            </div>
                        </a>
                    </div>
                     </c:forEach>

                </div>
            </div>
        </section>
        <!-- Categories -->
        <section class="categories">
            <div class="header-catgories">
                <h1>Our Hottest Category</h1>
                <p>Discover the most popular picks that everyone is talking about!</p>
            </div>
            <div class="categ-container row">
                <c:forEach items="${ListCateGories}" var="lct">                 
                <div class="categ-item custom-col-lg custom-col-md col-sm-6 ">
                    <a href="ManageCategoriesServlet?cid=${lct.categoriesId}#container__myproduct">
                        <div class="categ-img">
                            <img src="${lct.categoriesImg}" alt="">
                        </div>
                        <p class="categ-description">${lct.categoriesName}</p>
                    </a>
                </div>
                </c:forEach>
                

            </div>
        </section>
        <!-- Weekly menu -->
         
        <!-- Advertising -->
        <section class="intro-prod">
            <div class="script-intro-cheaf">
                <h2>Best Service Ever</h2>
                <p>Our 3 Michelin Stars ensure that your experience regarding our cuisine will be one that you will not
                    forget.</p>
                <img src="./assets/img/content/micleing.png" alt="">
            </div>
        </section>
    </div>
    <!-- <div class="footer"></div> -->
    <!-- Footer -->
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
