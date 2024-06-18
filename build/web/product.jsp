<%-- 
    Document   : Product
    Created on : Jun 14, 2024, 2:08:36 PM
    Author     : DELL
--%>

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
              src="https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg"
              alt="">
          </div>
          <!-- info product detail  -->
          <div class="product__content__detail-sumary col-md-6">
            <h1 class="product__content__detail-title">Amish White Bread</h1>
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
                Iced coffee is a type of coffee beverage served chilled, brewed variously with the fundamental division
              </p>
            </div>
            <p class="product__content__detail-price">
              <span id="product__detail-price-id" class="product__detail-price">100000</span>
            </p>
            <!-- quantity buy product -->
            <div class="product__content__detail-form">
              <form action="" method="post">
                <div class="product__detail-form-desc">
                  <h1>Quantity</h1>
                  <div class="product__detail-quantity-btn">
                    <button type="button" class="minus-btn-quantity"><i class="fa-solid fa-minus"></i></button>
                    <input type="number" min="1" id="quantity-input" value="1">
                    <button type="button" class="plus-btn-quantity"><i class="fa-solid fa-plus"></i></button>
                  </div>
                  <!-- submit buy product -->
                  <div class="product__btnbuy-ing-pro">
                    <button type="submit" name="acction" value="buyProduct" class="product__detail-buybtn ">
                      <i class="fa-solid fa-cart-shopping"></i> Add product to cart
                    </button>
                    <button type="submit" name="action" value="buyIngredient" class="product__detail-buybtn ">
                      <i class="fa-solid fa-cart-shopping"></i> Add ingredient to cart
                    </button>
                  </div>
                </div>
              </form>
            </div>
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
          <!-- List ingredient -->
          <div class="product_ingredient-img-list row ">

            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="https://amandascookin.com/wp-content/uploads/2009/06/homemade-amish-white-bread-SQ-680.jpg"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>Pan </h3>
                <div class="ingredient__quantity-element">
                  <h2>100</h2>
                  <h2>Gram</h2>
                </div>
              </div>
              <!-- quantity unit -->
            </div>
            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="https://amandascookin.com/wp-content/uploads/2009/06/homemade-amish-white-bread-SQ-680.jpg"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>Pan </h3>
                <div class="ingredient__quantity-element">
                  <h2>100</h2>
                  <h2>Gram</h2>
                </div>
              </div>
              <!-- quantity unit -->
            </div>
            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="https://amandascookin.com/wp-content/uploads/2009/06/homemade-amish-white-bread-SQ-680.jpg"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>Pan </h3>
                <div class="ingredient__quantity-element">
                  <h2>100</h2>
                  <h2>Gram</h2>
                </div>
              </div>
              <!-- quantity unit -->
            </div>
            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="https://amandascookin.com/wp-content/uploads/2009/06/homemade-amish-white-bread-SQ-680.jpg"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>Pan </h3>
                <div class="ingredient__quantity-element">
                  <h2>100</h2>
                  <h2>Gram</h2>
                </div>
              </div>
              <!-- quantity unit -->
            </div>
            <div class="product_ingredient-img-item col-lg-3 col-md-4 col-sm-6">
              <!-- img ingr -->
              <div class="product_ingredient-img-element">
                <img src="https://amandascookin.com/wp-content/uploads/2009/06/homemade-amish-white-bread-SQ-680.jpg"
                  alt="">
              </div>
              <!-- name ing -->
              <div class="product_ingredient-description-element">
                <h3>Pan </h3>
                <div class="ingredient__quantity-element">
                  <h2>100</h2>
                  <h2>Gram</h2>
                </div>
              </div>
              <!-- quantity unit -->
            </div>

          </div>
          <!-- About recipe -->
          <div class="product__content-recipe ">
            <div class="product__content-recipe-descripion">
              <h5>Gather the ingredients.

                In a large bowl, mix warm water and yeast.

                Add milk, sugar, salt, and lard. Stir.

                Add 4 cups of flour and mix well. Add in enough remaining flour to make a dough that follows the spoon
                around the bowl.

                Turn dough out onto a lightly floured surface and knead for 10 minutes, adding more flour as needed
                until the dough is firm and smooth to the touch.

                Place dough in a medium greased bowl. Turn dough over in bowl so that the top is also lightly greased.
                Cover with a clean cloth and let rise in a warm, draft-free place for 1 hour.

                Punch down dough. Turn dough out onto a lightly floured board and knead for 5 minutes or until the
                bubbles are out of the bread.

                Divide dough into 2 equal parts. Shape each dough half into a loaf.

                Place each loaf in greased, 9 X 5-inch bread pan. Cover and let rise in a warm, draft-free place for 45
                minutes or until doubled in size.
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

    let amount = parseInt(document.getElementById('product__detail-price-id').innerText);
    let formattedAmount = amount.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    document.getElementById('product__detail-price-id').innerText = formattedAmount;


  </script>

</body>

</html>
