<%-- 
    Document   : Product
    Created on : Jun 14, 2024, 2:08:36 PM
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
  <link rel="stylesheet" href="./assets/css/product.css">
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
  <!-- header web -->
  <!-- <div id="header-container"></div> -->
  <script src="./assets/js/header.js"></script>
  <!-- Product_item -->
  <div class="product__content__detail-main">
    <div class="product__content__detail-container container">
      <div class="product__content_grid">
        <div class="row">
          <!-- info img -->
          <div class="product__content__detail-info-img col-md-6">
            <img
              src="${Food.image}"
              alt="">
          </div>
          <!-- info product detail  -->
          <div class="product__content__detail-sumary col-md-6">
            <h1 class="product__content__detail-title">${Food.name}</h1>
            <div class="product__content__detail-rating">
              <div class="rating">
                <input type="radio" id="star5" name="rate" value="5" />
                <label for="star5" title="text"></label>
                <input type="radio" id="star4" name="rate" value="4" />
                <label for="star4" title="text"></label>
                <input type="radio" id="star3" name="rate" value="3" />
                <label for="star3" title="text"></label>
                <input type="radio" id="star2" name="rate" value="2" />
                <label for="star2" title="text"></label>
                <input checked="" type="radio" id="star1" name="rate" value="1" />
                <label for="star1" title="text"></label>
              </div>

              <div class="product__content__detail-rating-customer">
                <p>
                  <a href="#">

                    (100 Customer Reviews)
                  </a>
                </p>
              </div>
            </div>
            <div class="product__content__detail-desc">
              <p>
                 ${Food.description}
              </p>
            </div>
            <p class="product__content__detail-price">
              <span id="product__detail-price-id" class="product__detail-price">${Food.price}</span>
            </p>
            <!-- quantity buy product -->
            <div class="product__content__detail-form">
              <form action="addToCartServlet" method="post">
                <div class="product__detail-form-desc">
                  <h1>Quantity</h1>
                  <div class="product__detail-quantity-btn">
                    <button type="button" class="minus-btn-quantity"><i class="fa-solid fa-minus"></i></button>
                    <input type="number" min="1" id="quantity-input" name="quantityF" value="1">
                    <button type="button" class="plus-btn-quantity"><i class="fa-solid fa-plus"></i></button>
                  </div>
                  <input type="hidden" name="idfood" value="${Food.foodId}">
                  <!-- submit buy product -->
                  <div class="product__btnbuy-ing-pro">
                    <button type="submit" name="btnAdd" value="BuyFood" class="product__detail-buybtn ">
                      <i class="fa-solid fa-cart-shopping"></i> Add product to cart
                    </button>
                    <button type="submit" name="btnAdd" value="BuyIngredient" class="product__detail-buybtn ">
                      <i class="fa-solid fa-cart-shopping"></i> Add ingredient to cart
                    </button>
                  </div>
                </div>
              </form>
            </div>
            <!-- Add Food to weeklyfood -->
            <div class="contain-btn-add-weekly">
              <form action="#" method="post">
                <input type="date" id="dateInput">
                <button class="btn-add-weekly" type="submit">
                  Add Product to weekly menu
                  <div class="star-1">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                  <div class="star-2">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                  <div class="star-3">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                  <div class="star-4">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                  <div class="star-5">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                  <div class="star-6">
                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1"
                      style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                      viewBox="0 0 784.11 815.53" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <defs></defs>
                      <g id="Layer_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"></metadata>
                        <path class="fil0"
                          d="M392.05 0c-20.9,210.08 -184.06,378.41 -392.05,407.78 207.96,29.37 371.12,197.68 392.05,407.74 20.93,-210.06 184.09,-378.37 392.05,-407.74 -207.98,-29.38 -371.16,-197.69 -392.06,-407.78z">
                        </path>
                      </g>
                    </svg>
                  </div>
                </button>
              </form>
            </div>
            <!-- extra  -->
            <div class="product__content__extra">
              <div class="product__content__extra-info">
                <ul class="product__content__extra-info-list">
                  <li>Free global shipping on all orders</li>
                  <li>30 days easy returns if you change your mind</li>
                  <li>Order before noon for same day dispatch</li>
                </ul>
              </div>
              <div class="product__content__extra-brand">
                <h5>Guaranteed Safe Checkout</h5>
                <img src="./assets/img/content/brand.png" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="product__content_ingredient-grid">
        <div class="product__content-ingredient-recipe">
          <ul class="link-ingredient-recipe">
            <li class="description-ingredient ">
              <a href="#" id="link-ingredient">Ingredients</a>
            </li>
            <li class="description-recipe">
              <a href="#" id="link-recipe">Recipe</a>
            </li>
          </ul>
          <!-- Price all ingredient -->
          <div class="totalPrice-ingredient">
            <h5 class="title-price-ingr">Total:</h5>
            <h5 id="price-detial-ingrs">${TotalPriceIng}</h5>
          </div>
          <!-- List ingredient -->
          <div class="product_ingredient-img-list row ">
              <c:forEach items="${ListIngr}" var="dIng">
                  
            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="${dIng.ingredientImg}"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>${dIng.ingredientName}</h3>
                <div class="ingredient__quantity-element">
                  <h2>${dIng.ingredientQuantity}</h2>
                  <h2>${dIng.ingredientUnit}</h2><br>
                </div>
                <h2 class="price-detail-ingre">${dIng.ingredientPrice}</h2>
              </div>
              <!-- quantity unit -->
            </div>
              </c:forEach>


          </div>
          <!-- About recipe -->
          <div class="product__content-recipe ">
            <div class="product__content-recipe-descripion">
              <h5>
                  ${Food.recipe}
              </h5>
            </div>
          </div>


        </div>
      </div>
    </div>
  </div>

  <!-- footer  -->
  <script src="./assets/js/footer.js"></script>
  <!--script chen header  -->
  <script>


    document.addEventListener('DOMContentLoaded', function () {
      const minusBtn = document.querySelector('.minus-btn-quantity');
      const plusBtn = document.querySelector('.plus-btn-quantity');
      const quantityInput = document.getElementById('quantity-input');

      minusBtn.addEventListener('click', function () {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
          quantityInput.value = currentValue - 1;
        }
      });

      plusBtn.addEventListener('click', function () {
        let currentValue = parseInt(quantityInput.value);
        quantityInput.value = currentValue + 1;

      });

      const linkIngredients = document.getElementById('link-ingredient');
      const linkRecipe = document.getElementById('link-recipe');
      const ingredientImages = document.querySelector('.product_ingredient-img-list');
      const recipeContent = document.querySelector('.product__content-recipe');
      const liLinkIngredients = document.querySelector('.description-ingredient');
      const liLinkRecipe = document.querySelector('.description-recipe');
      linkIngredients.classList.add('description-ingredient-open');

      linkIngredients.addEventListener('click', function (event) {
        event.preventDefault();
        linkIngredients.classList.add('description-ingredient-open');
        linkRecipe.classList.remove('description-recipe-open');
        ingredientImages.style.display = 'flex';
        recipeContent.style.display = 'none';
      });

      linkRecipe.addEventListener('click', function (event) {
        event.preventDefault();
        linkIngredients.classList.remove('description-ingredient-open');
        linkRecipe.classList.add('description-recipe-open');
        ingredientImages.style.display = 'none';
        recipeContent.style.display = 'block';
      });
    });

      // ingredient - recipe

      let amount = parseInt(document.getElementById('product__detail-price-id').innerText),
        totalIngre = parseInt(document.getElementById('price-detial-ingrs').innerText);

          const priceIngr = document.querySelectorAll('.price-detail-ingre');


      let formattedAmount = amount.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }),
        formattedTotalInge = totalIngre.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
         

      document.getElementById('product__detail-price-id').innerText = formattedAmount;
      document.getElementById('price-detial-ingrs').innerText = formattedTotalInge;
      
      priceIngr.forEach(function (element) {
      let price = parseInt(element.innerText);
      let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
      element.innerText = formattedAmount;
    });

      const today = new Date();

      // Get the current year, month, and day with leading zeros if needed
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');

      // Format the date as YYYY-MM-DD
      const formattedDate = year + '-' + month + '-' + day;

      // Set the value of the date input
      document.getElementById('dateInput').value = formattedDate;
      
      const dateInput = document.getElementById('dateInput');

  </script>

</body>

</html>
