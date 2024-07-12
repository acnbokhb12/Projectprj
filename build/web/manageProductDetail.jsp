<%-- 
    Document   : manageProductDetail
    Created on : Jul 12, 2024, 7:58:32 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff</title>
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
    <link rel="stylesheet" href="./assets/css/staffhome.css">
    <link rel="stylesheet" href="./assets/css/detail.css">
</head>

<body>
    <div id="db-wrapper">
        <div class="left-navbar-staff-manage  vh-100 simplebar-scrollable-y ">
            <div class="left-navbar-detail  ">
                <a href="dashboard.jsp" class="navbar-brand contain-img-navbar">
                    <img src="./assets/img/logo/LogoImg.png" alt="">
                </a>
                <ul class=" navbar-desc-function">
                    <li class="nav-header-desc">overview </li>
                    <li class="navbar-desc-function-detail">
                        <a href="dashboard.jsp" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fas fa-home icon-navbar-staff"></i>Dash Board
                        </a>

                    </li>

                    <li class="navbar-desc-function-detail">
                        <a href="manageUser.jsp" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-user icon-navbar-staff"></i> User
                        </a>

                    </li>


                    <li class="navbar-desc-function-detail">
                        <a href="manageProduct.jsp" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-bowl-food icon-navbar-staff"></i>product
                        </a>

                    </li>


                    <li class="navbar-desc-function-detail">
                        <a href="manageOrder.jsp" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-cart-shopping icon-navbar-staff"></i> Order
                        </a>
                    </li>
                </ul>
                <div class="helloadmin">
                    <div class="card">Khanhhn</div>
                </div>
            </div>
        </div>
        <div id="page-content-staff" class="right-navbar-staff-manage">
            <div class="header">

                <div class="navbar-right-page">
                    <div class="row navbar-right-page-row">
                        <div class="hambu-icon-contain col-auto">
                            <i class="fa-solid fa-bars hambu-icon-detail"></i>
                        </div>
                        <div class="app-search-box col">
                            <form class="app-search-form ">
                                <input type="text" placeholder="Search..." name="search"
                                    class="form-control search-input">
                                <button type="submit" class="btn search-btn btn-primary" value="Search"><i
                                        class="fa-solid fa-magnifying-glass"></i></button>
                            </form>
                        </div>
                        <div class="col-auto app-box-admin">
                            <div class="box-admin">

                                <div class="welcome-admin">
                                    <i class="fa-solid fa-user"></i> Khanhhn
                                </div>
                            </div>
                            <div class="modal-more-info">
                                <ul class="modal-more-info-list">
                                    <li class="modal-more-info-items">
                                        <a href="#">Account</a>
                                    </li>
                                    <li class="modal-more-info-items">
                                        <a href="#">Log out</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end headerr -->
            <div class="app-content  ">
                <div class="container-xl container-content-admin">
                    <div class="row row-order-main">
                        <div class="col-auto">
                            <h1 class="app-page-title">FoodID: 1</h1>


                        </div>
                        <div class="col-auto">
                            <form class="table-search-form row gx-1 align-items-center" action="">
                                <div class="col-auto ">
                                    <!-- <input type="text" class="search-order" placeholder="Search..." id="searchInput"> -->
                                    <div class="status-update">
                                        Status
                                    </div>
                                </div>
                                <div class="col-auto contain-btn-select-order">

                                    <select class="contain-btn-select-search" name="searchChoice" id="searchChoice">
                                        <option value="onhold">On hold</option>
                                        <option value="processing">Processing</option>
                                        <option value="Delivering">Delivering</option>
                                        <option value="success">Success</option>
                                        <option value="cancel">Cancle</option>

                                    </select>
                                </div>
                                <div class="col-auto contain-btn-search-order">
                                    <button class="btn-submit-search-order" type="submit">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- end search -->
                   
                    <!-- end title link -->
                    <div class="order-informationC">
                        <div class="table-card-detail">
                            <div class="table-responsive">
                                <table class="table app-table-hover text-left">
                                    <thead>
                                        <tr class="tr-row-oder-detail">

                                            <th scope="col" class="col-cell-detail col-cell-detail-title"></th>
                                            <th scope="col" class="col-cell-detail">Information</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Name </th>
                                            <td class="col-cell-detail text-capitalize">caesar salad</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Imgage </th>
                                            <td class="col-cell-detail">
                                                https://www.cookingclassy.com/wp-content/uploads/2023/05/sun-dried-tomato-pasta-4.jpg
                                            </td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Description
                                            </th>
                                            <td class="col-cell-detail">This 30-minute sun-dried tomato pasta recipe is
                                                a bright meatless meal that feels a touch luxurious! The creamy sauce
                                                has garlic, spinach, and a dusting of parmesan.</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Recipe</th>
                                            <td class="col-cell-detail">Cook the pasta al dente. Meanwhile, in a
                                                skillet, melt the butter and stir in the flour and garlic until
                                                fragrant. Whisk in the wine, Dijon, lemon juice, and Italian seasoning.
                                                Let it reduce by half. Adding in sun dried tomatoes and cream and
                                                tossing with pasta in a skillet. Add in the sun-dried tomatoes and
                                                cream, then cook for about 5 minutes. Stir in the parmesan, then add in
                                                the spinach and let it wilt. Toss with the drained pasta, and season
                                                with salt & pepper as needed.</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Price </th>
                                            <td class="col-cell-detail price-detail-food-admin">
                                                150000
                                            </td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Status</th>
                                            <td class="col-cell-detail">
                                                <div class="badge badge-success">
                                                    Available
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <div class="app-content-table">
                        <div class="card-table">
                            <div class="table-responsive">
                                <table class="table app-table-hover text-left">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="cell-col">Ingredient Id</th>
                                            <th scope="col" class="cell-col">Ingredient Name</th>
                                            <th scope="col" class="cell-col">Image</th>
                                            <th scope="col" class="cell-col">Quantity</th>
                                            <th scope="col" class="cell-col">Unit</th>
                                            <th scope="col" class="cell-col">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- 1 tr tuonf duong vs 1 han -->
                                        <tr class="tr-row-oder">
                                            <td class="cell-col  ">1</td>
                                            <td class="cell-col text-capitalize">Pasta</td>
                                            <td class="cell-col truncate">
                                                https://www.jessicagavin.com/wp-content/uploads/2020/07/how-to-cook-pasta-3-1200-500x500.jpg
                                            </td>
                                            <td class="cell-col ">60</td>
                                            <td class="cell-col ">g</td>
                                            <td class="cell-col price-ingredient-admin">50000</td>
                                        </tr>
                                        <tr class="tr-row-oder">
                                            <td class="cell-col  ">2</td>
                                            <td class="cell-col text-capitalize">Butter</td>
                                            <td class="cell-col truncate">
                                                https://5.imimg.com/data5/SELLER/Default/2021/4/QI/MW/RX/6975039/butter-500x500.jpg
                                            </td>
                                            <td class="cell-col ">60</td>
                                            <td class="cell-col ">g</td>
                                            <td class="cell-col price-ingredient-admin">30000</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/main.js">

    </script>
    <script>
        let subTotal = parseInt(document.querySelector('.price-detail-food-admin').innerText);
        let formattedsubTotal = subTotal.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
        document.querySelector('.price-detail-food-admin').innerText = formattedsubTotal;

        const priceIngredient = document.querySelectorAll('.price-ingredient-admin');

        priceIngredient.forEach(function (element) {
            let price = parseInt(element.innerText);
            let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            element.innerText = formattedAmount;
        });
    </script>
</body>

</html>