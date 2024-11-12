<%-- 
    Document   : manageUserDetail
    Created on : Jul 12, 2024, 7:56:41 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
                <a href="DashboardAdminServlet" class="navbar-brand contain-img-navbar">
                    <img src="./assets/img/logo/LogoImg.png" alt="">
                </a>
                <ul class=" navbar-desc-function">
                    <li class="nav-header-desc">overview </li>
                    <li class="navbar-desc-function-detail">
                        <a href="DashboardAdminServlet" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fas fa-home icon-navbar-staff"></i>Dash Board
                        </a>

                    </li>

                    <li class="navbar-desc-function-detail">
                        <a href="ControllerServlet?action=UserManage" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-user icon-navbar-staff"></i> User
                        </a>

                    </li>


                    <li class="navbar-desc-function-detail">
                        <a href="ControllerServlet?action=MenuManage" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-bowl-food icon-navbar-staff"></i>product
                        </a>

                    </li>


                    <li class="navbar-desc-function-detail">
                        <a href="ControllerServlet?action=OrderManage" class="nav-link-item-desc" style="text-decoration: none;">
                            <i class="fa-solid fa-cart-shopping icon-navbar-staff"></i> Order
                        </a>
                    </li>   
                    
                        
                       
                </ul>
                <div class="helloadmin">
                    <div class="card">${sessionScope.UserAcc.userName}</div>
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
                                    <i class="fa-solid fa-user"></i> ${sessionScope.UserAcc.userName}
                                </div>
                            </div>
                            <div class="modal-more-info">
                                <ul class="modal-more-info-list">
                                    <li class="modal-more-info-items">
                                        <a href="profile.jsp">Account</a>  
                                    </li>                                    
                                    <li class="modal-more-info-items">
                                        <a href="ControllerServlet?action=logout">Log out</a>  
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
                            <h1 class="app-page-title">AccountId: ${AccountUser.accId}</h1>


                        </div>
                        <div class="col-auto">
                            <form class="table-search-form row gx-1 align-items-center" action="UpdateStatusUserAdminServlet" method="post">
                                <div class="col-auto ">
                                    <!-- <input type="text" class="search-order" placeholder="Search..." id="searchInput"> -->
                                    <a href="#" data-delete-url="/Kahof/DeleteAccountUserAdminServlet?uid=${AccountUser.accId}" id="delete-account" class="status-update" style="background-color: rgb(115, 189, 81); color: #fff;">
                                        Delete Account
                                    </a>
                                </div>
                                <div class="col-auto ">
                                    <!-- <input type="text" class="search-order" placeholder="Search..." id="searchInput"> -->
                                    <div class="status-update"  >
                                        Status
                                    </div>
                                </div>
                                        <input type="hidden" name="txtuid" value="${AccountUser.accId}">        
                                <div class="col-auto contain-btn-select-order">

                                    <select class="contain-btn-select-search" name="updatechoice" id="searchChoice">
<!--                                        <option value="active">Active </option>
                                        <option value="inactive">Inactive </option>
                                        <option value="pending">Pending </option>
                                        <option value="suspended">Suspended </option>
                                        <option value="banned">Banned </option>-->
                                      <c:forEach items="${listStatusAcc}" var="a">
                                        <option value="${a.AStatusId}">${a.nameAStatus}  </option>
                                      </c:forEach>
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
                                            <td class="col-cell-detail">${AccountUser.userName}</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Email </th>
                                            <td class="col-cell-detail">${AccountUser.email}</td>
                                        </tr>
                                         <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Password </th>
                                            <td class="col-cell-detail">${AccountUser.password}</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Phone</th>
                                            <td class="col-cell-detail"> ${AccountUser.phoneNumber}</td>
                                        </tr>
                                        <tr class="tr-row-oder-detail">
                                            <th scope="row" class="col-cell-detail col-cell-detail-title">Status</th>
                                            <td class="col-cell-detail">
                                                <c:forEach items="${listStatusAcc}" var="a">
                                                    <c:if test="${AccountUser.aStatusId == a.AStatusId}">
                                                    
                                                        <div class="badge ${a.AStatusId == 1 ? "badge-success" : (a.AStatusId == 2 ? "badge-primary" : (a.AStatusId == 3 ? "badge-danger" : "") ) }">
                                                                ${a.nameAStatus}
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${ListOrderOfUser}" var="lou"> 
                    <div class="contain-detal-order-acc">


                        <div class="row row-order-processing">
                            <div class="link-processing-order col-4">OrderId : <span> ${lou.orderId} </span> </div>
                            <div class="link-processing-order col-4">${lou.orderDate}</div>
                            <div class="link-processing-order col-4">

                                <div class="badge badge-primary">
                                    Delivering
                                </div>
                            </div>

                        </div>
                        <div class="app-content-table">
                            <div class="card-table">
                                <div class="table-responsive">
                                    <table class="table app-table-hover text-left">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="cell-col">Food Name</th>
                                                <th scope="col" class="cell-col">Type</th>
                                                <th scope="col" class="cell-col">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lou.orderDetails}" var="ordd">

                                            <tr class="tr-row-oder">
                                                <td scope="row" class="cell-col text-capitalize"> ${ordd.food.name}</td>
                                                <td class="cell-col  ">${ordd.type}</td>
                                                <td class="cell-col"> ${ordd.orderDetailQuantity}</td>
                                            </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/main.js">

    </script>
    <script>
        document.getElementById('delete-account').addEventListener('click', function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

            // Hiển thị hộp thoại xác nhận
            var confirmation = confirm('Are you sure you want to delete this account?');
            if (confirmation) {
                // Nếu người dùng xác nhận, chuyển hướng đến URL của servlet
                var deleteUrl = event.target.getAttribute('data-delete-url');
                window.location.href = deleteUrl;
            } else {
                // Nếu người dùng hủy, không làm gì cả
                console.log('Account deletion cancelled.');
            }
        });
    </script>
    <style>
        .row-order-processing{
            width: 100%;
        }
    </style>
</body>

</html>