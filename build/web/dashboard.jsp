<%-- 
    Document   : dashboard
    Created on : Jul 12, 2024, 7:53:58 PM
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
                                <input type="text" placeholder="Search..." name="search" class="form-control search-input">
                                <button type="submit" class="btn search-btn btn-primary" value="Search"><i class="fa-solid fa-magnifying-glass"></i></button> 
                            </form>
                        </div>
                        <div class="col-auto app-box-admin">
                            <div class="box-admin">
                               
                                <div class="welcome-admin">
                                    <i class="fa-solid fa-user"></i>  Khanhhn
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
                <div class="container-xl">
                    <h1 class="app-page-title">Dash Board</h1>
                    <div class="row g-4 mb-4 contain-row-app-content">
                        <div class="col-6 col-lg-3 item-row-detail">
                            <div class="app-card ">
                                <div class="app-card-body">
                                    <h4 class="title-overview stats-type ">
                                        Total sales
                                    </h4>
                                    <div class="desc-detail-overview stats-figure">
                                        12000000
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-6 col-lg-3 item-row-detail">
                            <div class="app-card ">
                                <div class="app-card-body">
                                    <h4 class="title-overview stats-type ">
                                        Qty Order
                                    </h4>
                                    <div class="desc-detail-overview stats-figure">
                                        30000
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-6 col-lg-3 item-row-detail">
                            <div class="app-card ">
                                <div class="app-card-body">
                                    <h4 class="title-overview stats-type ">
                                       Qty User  
                                    </h4>
                                    <div class="desc-detail-overview stats-figure">
                                        10000
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-6 col-lg-3 item-row-detail">
                            <div class="app-card ">
                                <div class="app-card-body">
                                    <h4 class="title-overview stats-type ">
                                        Qty Order
                                    </h4>
                                    <div class="desc-detail-overview stats-figure">
                                        30000
                                    </div>
                                </div>

                            </div>
                        </div>
                        

                    </div>
                </div>
            </div>
            </div>
        </div>
    <script>
        const hambuguricon = document.querySelector('.hambu-icon-detail');
        const headerLeft = document.querySelector('.left-navbar-staff-manage');
        const RightPage = document.querySelector('.right-navbar-staff-manage');

        let c = false;

        hambuguricon.addEventListener('click', function () {
            if (c == false) {
                headerLeft.classList.add('left-navbar-staff-manage-close');
                RightPage.classList.add('right-navbar-staff-manage-big');
                c = true;
            } else {
                headerLeft.classList.remove('left-navbar-staff-manage-close');
                RightPage.classList.remove('right-navbar-staff-manage-big');
                c = false;
            }
        });
        const boxAdmin = document.querySelector('.box-admin'),
      modalAdminInfor = document.querySelector('.modal-more-info');

boxAdmin.addEventListener('click', function(event) {
    event.stopPropagation(); // Prevent the event from bubbling up to the document
    modalAdminInfor.classList.add('modal-more-info-open');
});

document.addEventListener('click', (event) => {
    // Check if the click is outside the modal and the boxAdmin
    if (!boxAdmin.contains(event.target) && !modalAdminInfor.contains(event.target)) {
        modalAdminInfor.classList.remove('modal-more-info-open');
    }
});

    modalAdminInfor.addEventListener('click', function (event) {
        event.stopPropagation();
    })

        let subTotal = parseInt(document.querySelector('.desc-detail-overview').innerText);
            let formattedsubTotal = subTotal.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            document.querySelector('.desc-detail-overview').innerText = formattedsubTotal;
    </script>
    <style>
        
    </style>
</body>

</html>