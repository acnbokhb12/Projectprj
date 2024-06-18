<%-- 
    Document   : Cart
    Created on : Jun 14, 2024, 2:07:42 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Font icon -->
    <!-- <link rel="stylesheet" href="./assets/font/fontawesome-free-6.5.2-web/css/all.min.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/cart.css">
</head>

<body style="color: #e5e7eb">
    <!-- nhung header -->
    <script src="./assets/js/header.js"></script>
    <!-- view cart -->
    <div class="cart__main container">
        <div class="cart__container__title">
            <div class="cart__title-description row">
                <div class="cart__title-img col-md-3">Dishes</div>
                <div class="cart__title-description-information col-md-9">
                    <div class="row">
                        <div class="cart__title-infor-desc col-md-6">Description</div>
                        <div class="cart__title-price col-md-3">Price</div>
                        <div class="cart__title-total col-md-3">Total</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- section order cart -->
        <section class="cart__about__property">
            <div class="cart__about__property-desc row">
                <!-- img -->
                <div class="cart__about__property-img col-6 col-md-3">
                    <a href="Product.html" class="cart__about__property-img-link">
                        <img src="https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg"
                            alt="">
                    </a>
                </div>
                <div class="cart__about__property-infor-container col-6 col-md-9">
                    <div class="row cart__about__property-infor-row ">
                        <!-- desc namr-->
                        <div class="cart__about__property-infor-desc col-md-6">
                            <div class="cart__about__property-name">
                                <h3>Amish White Bread</h3>
                            </div>
                            <div class="cart__about__property-quantity ">
                                <h3>QUANTITY: <span>10</span></h3>
                            </div>
                            <div class="cart__about__property-update-delete">
                                <button type="button" class="cart__property-update">Edit</button>
                                <button type="button" class="cart__property-delete">
                                    <a href="#">Delete</a>
                                </button>
                            </div>
                        </div>
                        <!-- price -->
                        <div class="cart__about__property-price col-md-3">
                            <h3 class="property-price-cart">100000</h3>
                        </div>
                        <!-- total -->
                        <div class="cart__about__property-total col-md-3">
                            <h3 class="property-total-cart">1000000</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="cart__about__property">
            <div class="cart__about__property-desc row">
                <!-- img -->
                <div class="cart__about__property-img col-6 col-md-3">
                    <a href="Product.html" class="cart__about__property-img-link">
                        <img src="https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg"
                            alt="">
                    </a>
                </div>
                <div class="cart__about__property-infor-container col-6 col-md-9">
                    <div class="row cart__about__property-infor-row ">
                        <!-- desc namr-->
                        <div class="cart__about__property-infor-desc col-md-6">
                            <div class="cart__about__property-name">
                                <h3>Amish White Bread</h3>
                            </div>
                            <div class="cart__about__property-quantity ">
                                <h3>QUANTITY: <span>10</span></h3>
                            </div>
                            <div class="cart__about__property-update-delete">
                                <button type="button" class="cart__property-update">Edit</button>
                                <button type="button" class="cart__property-delete">
                                    <a href="#">Delete</a>
                                </button>
                            </div>
                        </div>
                        <!-- price -->
                        <div class="cart__about__property-price col-md-3">
                            <h3 class="property-price-cart">100000</h3>
                        </div>
                        <!-- total -->
                        <div class="cart__about__property-total col-md-3">
                            <h3 class="property-total-cart">1000000</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="cart__about__property">
            <div class="cart__about__property-desc row">
                <!-- img -->
                <div class="cart__about__property-img col-6 col-md-3">
                    <a href="Product.html" class="cart__about__property-img-link">
                        <img src="https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg"
                            alt="">
                    </a>
                </div>
                <div class="cart__about__property-infor-container col-6 col-md-9">
                    <div class="row cart__about__property-infor-row ">
                        <!-- desc namr-->
                        <div class="cart__about__property-infor-desc col-md-6">
                            <div class="cart__about__property-name">
                                <h3>Amish White Bread</h3>
                            </div>
                            <div class="cart__about__property-quantity ">
                                <h3>QUANTITY: <span>10</span></h3>
                            </div>
                            <div class="cart__about__property-update-delete">
                                <button type="button" class="cart__property-update">Edit</button>
                                <button type="button" class="cart__property-delete">
                                    <a href="#">Delete</a>
                                </button>
                            </div>
                        </div>
                        <!-- price -->
                        <div class="cart__about__property-price col-md-3">
                            <h3 class="property-price-cart">100000</h3>
                        </div>
                        <!-- total -->
                        <div class="cart__about__property-total col-md-3">
                            <h3 class="property-total-cart">1000000</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!-- order total price -->
        <div class="cart__about__check-subtotal">
            <div class="cart__about__check-subtotal-container">
                <div class="row cart__about__check-subtotal-container-row">
                    <div class="check-subtotal-quantity-total-item col-md-4">
                        <h3>Subtotal ( <span>2 Items</span> ):</h3>
                    </div>
                    <div class="check-subtotal-quantity-price-item col-md-4">
                        <h3 id="subtotal-quantity-price-item">2000000 </h3>
                    </div>
                    <div class="cart__about__checkout-btn col-md-4">
                        <a class="checkout-btn" href="checkout.html">Check Out </a>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal__cart__product">
        <div class="modal__cart__product-container">
            <div class="modal__cart__product-grid">

                <div class="modal__cart__product-body ">
                    <div class="modal__product-body-img  ">
                        <img src="https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg"
                            alt="">
                    </div>
                    <div class="modal__product-body-desc  ">
                        <div class="modal__cart__product-header">
                            <i class="fa-solid fa-xmark"></i>
                        </div>
                        <h1 class="modal__product-body-name">
                            Amissh bread
                        </h1>
                        <div class="modal__product-body-update-quantity">
                            <form action="" method="post">
                                <div class="product__detail-form-desc">
                                    <h1>Quantity</h1>
                                    <div class="product__detail-quantity-btn">
                                        <button type="button" class="minus-btn-quantity"><i
                                                class="fa-solid fa-minus"></i></button>
                                        <input type="number" min="1" id="quantity-input" value="1">
                                        <button type="button" class="plus-btn-quantity"><i
                                                class="fa-solid fa-plus"></i></button>
                                    </div>
                                    <!-- submit buy product -->
                                    <div class="product__btnbuy-ing-pro">
                                        <button type="submit" name="acction" value="buyProduct"
                                            class="product__detail-buybtn ">
                                            <i class="fa-solid fa-circle-check"></i> Update
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- nhung footer -->
    <script src="./assets/js/footer.js"></script>
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
            const priceElements = document.querySelectorAll('.property-price-cart');
            const totalElements = document.querySelectorAll('.property-total-cart');

            priceElements.forEach(function (element) {
                let price = parseInt(element.innerText);
                let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                element.innerText = formattedAmount;
            });
            totalElements.forEach(function (element) {
                let total = parseInt(element.innerText);
                let formattedTotal = total.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                element.innerText = formattedTotal;
            });

            let subTotal = parseInt(document.getElementById('subtotal-quantity-price-item').innerText);
            let formattedsubTotal = subTotal.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            document.getElementById('subtotal-quantity-price-item').innerText = formattedsubTotal;


            });
            
                    const closeUpadte = document.querySelector('.modal__cart__product-header i');
                    const openEditProducts = document.querySelectorAll('.cart__property-update');
            
                    const modalProduct = document.querySelector('.modal__cart__product');
            
                    for (const openeditPr of openEditProducts) {
                        openeditPr.addEventListener('click', function () {
                            modalProduct.classList.add('modal__cart__product-open');
                        });
                    };
            
                    closeUpadte.addEventListener('click',function(){
                        modalProduct.classList.remove('modal__cart__product-open');
            
                    });
        const modalContainer = document.querySelector('.modal__cart__product-container');
        
        modalProduct.addEventListener('click',function(){
            modalProduct.classList.remove('modal__cart__product-open');

        });
        modalContainer.addEventListener('click',function(event){
            event.stopPropagation();
        });
        
        // dung cai nay thay cho cai for cung dc
        // openEditProduct.forEach(function (button) {
        //     button.addEventListener('click', function () {
        //         modalProduct.classList.add('modal__cart__product-open');
        //     });
        // });
    </script>
</body>

</html>