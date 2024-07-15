<%-- 
    Document   : Menu
    Created on : Jun 14, 2024, 2:07:08 PM
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
        <title>Menu</title>
        <!-- Font family -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
              rel="stylesheet">
        <!-- Font icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <!-- <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="./assets/css/base.css">
        <link rel="stylesheet" href="./assets/css/main.css">
    </head>

    <body> <!-- style="background-color: rgb(10, 10, 10);"-->
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
        <!-- header web -->
        <script src="./assets/js/header.js"></script>
        <!--Slider  -->
        <div class="slider-menu-f">


            <div class="slider-menu">
                <div class="lists-slide-menu-item">
                    <div class="slider-item-menu">
                        <img src="https://caverta.matchthemes.com/steakhouse/wp-content/uploads/sites/3/2023/02/steak-menu1.jpg"
                             alt="">
                        <div class="desc-slider">
                            <h1>Menu</h1>
                            <p>Explore our menu's signature dishes, from premium cuts of beef to fresh seafood dishes, all prepared with
                                love and flair.</p>
                            <a href="#container__myproduct" class=" scroll_link_a_menu">
                                Discover more <i class="fa-solid fa-tag"></i>
                            </a>

                        </div>
                    </div>
                    <div class="slider-item-menu">
                        <img src="https://webdesign-finder.com/kruton/wp-content/uploads/2018/12/slide_03.jpg" alt="">
                        <div class="desc-slider">
                            <h1>Cooking is easy, we will
                                prove it to you!</h1>
                            <!-- <p>Celebrated name in the North Indian culinary realm,The wafting aroma of spices and sizzling chicken dishes will leave you salivating.</p> -->
                            <a href="#container__myproduct" class=" scroll_link_a_menu">
                                Discover more <i class="fa-solid fa-tag"></i>
                            </a>

                        </div>
                    </div>
                    <div class="slider-item-menu">
                        <img src="https://webdesign-finder.com/kruton/wp-content/uploads/2018/11/service-05.jpg" alt="">
                        <div class="desc-slider">
                            <h1>What you expect</h1>
                            <p>Kahof is a restaurant, bar and coffee roastery located on a busy corner site in Farringdon’s Exmouth
                                Market. The market and in certain circumstances and owing to the claims.</p>
                            <a href="#container__myproduct" class=" scroll_link_a_menu">
                                Discover more <i class="fa-solid fa-tag"></i>
                            </a>

                        </div>
                    </div>
                    <div class="slider-item-menu">
                        <img src="https://webdesign-finder.com/kruton/wp-content/uploads/2018/11/04-1024x683.jpg" alt="">
                        <div class="desc-slider">
                            <h1>Our Latest News</h1>
                            <p>Join us for exclusive food events and taste experiences that you won't forget. Reserve your spot now!</p>
                            <a href="#container__myproduct" class=" scroll_link_a_menu">
                                Discover more <i class="fa-solid fa-tag"></i>
                            </a>

                        </div>
                    </div>
                    <div class="slider-item-menu">
                        <img src="https://recipes.net/wp-content/uploads/2024/02/what-is-black-food-1707296726.jpeg" alt="">
                        <div class="desc-slider">
                            <h1>Full & Rich flavour & hot cereals</h1>
                            <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
                            <a href="#container__myproduct" class=" scroll_link_a_menu">
                                Discover more <i class="fa-solid fa-tag"></i>
                            </a>

                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <button id="prev-btn-menu">
                        <i class="fa-solid fa-caret-left"></i>
                    </button>
                    <button id="next-btn-menu">
                        <i class="fa-solid fa-caret-right"></i>
                    </button>
                </div>
                <!-- dot tuong ung -->
                <ul class="dots">
                    <li class="active-menu"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>
        <!-- Container__slider-menu -->
        <div id="container__myproduct" class="container__slider-menu ">
            <div class="container__slider-menu-heading">
                <h1>
                    Menus Of The Day
                </h1>
                <p>
                    Enjoy a variety of daily specials crafted with fresh, seasonal ingredients.
                </p>
            </div>
            <div class="container__slider-menu-search">
                <div class="menu-search-item">


                    <form action="ManageMenuServlet" method="post">
                        <input type="text" value="${txtS}" class="menu-search-find-input" name="txtnamesearch" placeholder="Search">
                        <button type="submit" class="menu-search-find-btn"><i class="fas fa-search"></i> </button>
                    </form>

                </div>
            </div>
            <div class="grid grid-container-menu">
                <div class="row">
                    <!-- row categories -->
                    <div class="col-lg-3">
                        <nav class="category__menu">
                            <h3 class="category__menu-heading">
                                <a href="ControllerServlet?action=menu#container__myproduct" >
                                    <i class="category__menu-heading-icon fa-solid fa-list"></i>Categories
                                </a>
                            </h3>
                            <ul class="category-list row">
                                <c:forEach items="${ListCate}" var="lc">  
                                    <li class="category-item col-lg-12 col-custom-cate category-item--active ${tagCate == lc.categoriesId ? "active":""}">
                                        <a href="ManageCategoriesServlet?cid=${lc.categoriesId}#container__myproduct" class="category-item__link active">${lc.categoriesName}</a>
                                    </li>
                                </c:forEach>

                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-9">
                        <div class="home-product">
                            <!-- row chua element  -->
                            <div class="row">                 
                                <c:forEach items="${ListFood}" var="f" >               
                                    <div class="col-lg-4 col-6 product-item">
                                        <a href="ControllerServlet?action=foodDe&fid=${f.foodId}" class="home-product-item__link">
                                            <div class="home-product-item-container">

                                                <!-- product item -->
                                                <div class="home-product-item__img">
                                                    <img
                                                        src="${f.image}"
                                                        alt="">
                                                </div>
                                                <div class="home-product-item__des-detail">
                                                    <!-- title -->
                                                    <h4 class="home-product-item__name">${f.name}</h4>
                                                    <!-- descript -->
                                                    <p class="home-product-item__desc">
                                                        ${f.description}
                                                    </p>
                                                    <!-- price- category -->
                                                    <div class="contain-cat-price">
                                                        <div class="row">                            
                                                            <span class="col-md-12  home-product-item__price">${f.price}</span>
                                                            <c:forEach items="${ListFoodStatus}" var="entry">
                                                                <c:if test="${f.fStatusId == entry.key}">
                                                                    <span class="col-md-12 home-product-item__fstatus" style="margin-bottom: 4px;">
                                                                        Status: <span style="background-color: #000; color: #fff; padding: 0 10px; border-radius: 4px; font-size: 1.8rem">${entry.value}</span>
                                                                    </span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                        <h5 class="home-product-item__category">
                                                            <p class="home-product-item__category-item">
                                                                <c:forEach items="${f.categories}" var="fc">
                                                                    - ${fc.categoriesName}

                                                                </c:forEach>

                                                            </p>
                                                        </h5>
                                                    </div>
                                                    <!-- rating -->
                                                    <div class="home-product-item__action">
                                                        <span class=" home-product-item__like home-product-item__like--liked">
                                                            <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                            <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                        </span>
                                                        <div class="home-product-item__rating">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <!-- nguong goc va thuong hieu -->
                                                    <div class="home-product-item__origin">
                                                        <span class="home-product-item__brand">Kahof</span>
                                                        <span class="home-product-item__origin-name">Viet Nam</span>
                                                    </div>
                                                </div>

                                            </div>

                                        </a>
                                    </div>

                                </c:forEach> 


                            </div>
                        </div>
                    </div>
                </div>
                <!-- finish row -->
            </div>
        </div>

        <!-- footer -->
        <script src="./assets/js/footer.js"></script>
        <!--script chen header  -->
        <script>


              // Slider
              let list = document.querySelector('.slider-menu .lists-slide-menu-item');
              let items = document.querySelectorAll('.slider-menu .lists-slide-menu-item .slider-item-menu');
              let dots = document.querySelectorAll('.slider-menu .dots li');
              let prev = document.getElementById('prev-btn-menu');
              let next = document.getElementById('next-btn-menu');

              let activeMenu = 0;
              let lengthItems = items.length - 1;
              // click next
              next.onclick = function () {
                  if (activeMenu + 1 > lengthItems) {
                      activeMenu = 0;
                  } else {
                      activeMenu += 1;
                  }
                  reloadSlider();
              };
              // click prevous
              prev.onclick = function () {
                  if (activeMenu - 1 < 0) {
                      activeMenu = lengthItems;
                  } else {
                      activeMenu -= 1;
                  }
                  reloadSlider();
              };
              // auto reload
              // let refreshSlider =setInterval(()=>{next.click()},4000);

              // Reload
              function reloadSlider() {
                  let checkLeft = items[activeMenu].offsetLeft;
                  list.style.left = -checkLeft + 'px';

                  let lastActiveDot = document.querySelector('.slider-menu .dots .active-menu');
                  lastActiveDot.classList.remove('active-menu');
                  dots[activeMenu].classList.add('active-menu');
                  // ngat auto chueyn slide, xoa hanh vi lap lai
                  // clearInterval(refreshSlider);
                  // refreshSlider =setInterval(()=>{next.click()},4000);
              }

              dots.forEach((li, key) => {
                  li.addEventListener('click', function () {
                      activeMenu = key;
                      reloadSlider();
                  });
              });

              //       document.addEventListener('DOMContentLoaded', function() {
              //   const links = document.querySelectorAll('.category-item__link');

              //   links.forEach(link => {
              //     link.parentElement.addEventListener('click', function(event) {
              //       event.preventDefault(); // Prevent the default link behavior

              //       // Remove the active class from all links
              //       links.forEach(l => l.classList.remove('category-item__link--active'));

              //       // Add the active class to the clicked link
              //       link.classList.add('category-item__link--active');
              //     });
              //   });
              // });
              document.querySelectorAll('.scroll_link_a_menu').forEach(anchor => {
                  anchor.addEventListener('click', function (e) {
                      e.preventDefault();

                      const targetId = this.getAttribute('href').substring(1);
                      const targetElement = document.getElementById(targetId);
                      const headerOffset = 116; // Chiều cao của header hoặc offset bạn muốn
                      const elementPosition = targetElement.getBoundingClientRect().top;
                      const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                      window.scrollTo({
                          top: offsetPosition,
                          behavior: 'smooth'
                      });
                  });
              });
              // tien vnd
              const priceElements = document.querySelectorAll('.home-product-item__price');
              priceElements.forEach(function (element) {
                  let price = parseInt(element.innerText);
                  let formattedAmount = price.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                  element.innerText = formattedAmount;
              });

              function scrollToProductContainer() {
                  var productContainer = document.getElementById('container__myproduct');
                  if (productContainer) {
                      productContainer.scrollIntoView({behavior: 'smooth'});
                  }
              }

              // Gọi hàm scrollToProductContainer khi trang được tải xong
              window.onload = function () {
                  var searchInput = document.querySelector('.menu-search-find-input');
                  if (searchInput && searchInput.value.trim() !== "") {
                      scrollToProductContainer();
                  }
              };
        </script>
        
        <!-- <script src="./assets/js/main.js"></script> -->
        
    </body>

</html>