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
        Account user = (Account) session.getAttribute("LoginAcc");
            
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
                <h1>Welcom to the kitchen of Kahof MaKede</h1>
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
        <section class="weekly__container">
            <div class="weekly__container__date">
                <div class="weekly-header">
                    <div class="weekyly-title">
                        <h1>Latest Menu</h1>
                        <p>Enjoy a fusion of Asian and Western cuisine</p>

                    </div>
                </div>
                <div class="weekly-body ">
                    <div class="weekly-section-day">
                        <ul class="weekly__time">
                            <li class="weekly__time-item weekly__time-item-f ">From</li>
                            <li class="weekly__time-item weekly__time-item-s">27/05</li>
                            <li class="weekly__time-item weekly__time-item-f">To <i
                                    class="fa-solid fa-arrow-right-long"></i></li>
                            <li class="weekly__time-item weekly__time-item-s">01/06</li>
                        </ul>
                    </div>
                    <!-- day weekly -->
                    <div class="weekly-title-header-menu row">
                        <div class="header-title-item col-md-2 ">
                            <h3 style="background-image: linear-gradient(109.6deg, rgba(156, 252, 248, 1) 11.2%, rgba(110, 123, 251, 1) 91.1%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; color: transparent; opacity: 1;">Date</h3>
                        </div>
                        <div class="header-title-item col-md-4">
                            <h3>Meal</h3>
                        </div>
                        <div class="header-title-item col-md-3">
                            <h3>Name</h3>
                        </div>
                        <div class="header-title-item col-md-3">
                            <h3>Price</h3>
                        </div>
                    </div>
                    <div class="weekly-body-menu">
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T2</h1>
                                    <h1 class="day-of-month">27/05</h1>
                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T3</h1>
                                    <h1 class="day-of-month">28/05</h1>
                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T4</h1>
                                    <h1 class="day-of-month">29/05</h1>
                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>

                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T5</h1>
                                    <h1 class="day-of-month">30/05</h1>
                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T6</h1>
                                    <h1 class="day-of-month">31/05</h1>
                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">T7</h1>
                                    <h1 class="day-of-month">27/05</h1>

                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://lh3.googleusercontent.com/proxy/GRFW_mwfdfiuOEkF98NiS4dzRehNO79eVk7ozeiUj1-SuIl2f2-skiq03Z02cqf_-185DeZZyBtlxqieAnu_MohcCNROjlAlJ4C2RlBIFNzOlWiqRn4HU8zGaMFw6xmE2Ljp"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                        <a href="" class="contain-food-weekly">
                            <div class="weekly-body-header-menu row">
                                <div class="header-menu-item-date col-md-2">
                                    <h1 class="day-of-week">CN</h1>
                                    <h1 class="day-of-month">01/06</h1>

                                </div>
                                <div class="header-menu-item-img col-md-4">
                                    <img src="https://scontent.fsgn2-3.fna.fbcdn.net/v/t1.6435-9/126823677_691519868469247_6264695699627446969_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=YSxgjotdD9sQ7kNvgF3OBvw&_nc_ht=scontent.fsgn2-3.fna&oh=00_AYB6k4Go_r6OV_oxbQ7OD5AtefyI6krIPs9xteEuTBugOQ&oe=6677A019"
                                        alt="">
                                </div>
                                <div class="header-menu-item-name col-md-3">
                                    <h3>Chinese Cuisine</h3>
                                </div>
                                <div class="header-menu-item-price col-md-3">
                                    <h3>300000 VND</h3>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
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
    <script src="./assets/js/main.js"></script>
</body>

</html>
