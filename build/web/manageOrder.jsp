<%-- 
    Document   : manageOrder
    Created on : Jul 12, 2024, 7:59:22 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

                            <h1 class="app-page-title">Orders</h1>
                        </div>
                        <div class="col-auto">
                            <form class="table-search-form row gx-1 align-items-center" action="">
                                <div class="col-auto ">
                                    <input type="text" class="search-order" placeholder="Search..." id="searchInput">
                                    <input type="date" class="search-order" name="" id="searchDate"
                                        style="display: none;">
                                </div>
                                <div class="col-auto contain-btn-select-order">
                                    <select class="contain-btn-select-search" name="searchChoice" id="searchChoice">
                                        <option value="email" selected>Email</option>
                                        <option value="phone">Phone</option>
                                        <option value="date">Date</option>
                                    </select>
                                </div>
                                <div class="col-auto contain-btn-search-order">
                                    <button class="btn-submit-search-order" type="submit">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- end search -->
                    <!-- start title link -->
                    <div class="row row-order-processing">
                        <a class="link-processing-order  ${tagSt == null ? "active" : ""} col-2" href="ControllerServlet?action=OrderManage">All</a>
                        <c:forEach items="${ListStatus}" var="tls">
                            
                        <a class="link-processing-order ${tagSt == tls.idOrderStatus ? "active" : ""} col-2" href="ManageStatusOrderAdminServlet?stid=${tls.idOrderStatus}">${tls.nameOrderStatus}</a>             
                        </c:forEach>
                        
                    </div>
                    <!-- end title link -->
                    <div class="app-content-table">
                        <div class="card-table">
                            <div class="table-responsive">
                                <table class="table app-table-hover text-left">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="cell-col">Order Id</th>
                                            <th scope="col" class="cell-col">Email customer</th>
                                            <th scope="col" class="cell-col">Date</th>
                                                <th scope="col" class="cell-col">Phone</th>
                                            <th scope="col" class="cell-col">Status</th>
                                            <th scope="col" class="cell-col">Total</th>
                                            <th scope="col" class="cell-col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                  
                                        <c:forEach items="${ListOrder}" var="lo">
                                            
                                          <tr class="tr-row-oder">
                                            <td scope="row" class="cell-col">${lo.orderId}</td>
                                            <td class="cell-col"> ${lo.acc.email}</td>
                                            <td class="cell-col">
                                                <span>${lo.orderDate}</span>
                                                <span class="note-processing">12:19</span>
                                            </td>
                                            <td class="cell-col"> ${lo.getPhone()}</td>
                                            <td class="cell-col">
                                                <c:forEach items="${ListStatus}" var="ls">
                                                    <c:if test="${ls.idOrderStatus == lo.orderStatus}">                                                        
                                                    <div class="badge ${lo.orderStatus == 1 ? "badge-secondary" :( lo.orderStatus == 2 ? "badge-primary" : ( lo.orderStatus == 3 ? "badge-warning": (lo.orderStatus==4 ? "badge-success" : (lo.orderStatus==5 ? "badge-danger" : '') )))}">
                                                            ${ls.nameOrderStatus}
                                                    </div>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td class="cell-col cell-col-price">${lo.total}</td>
                                            <td class="cell-col">
                                                <a href="ManageOrderDetailAdminServlet?oid=${lo.orderId}" class="btn-sm app-btn-secondary">
                                                    View
                                                </a>
                                            </td>
                                        </tr>
                                     
                                        </c:forEach>
                                       
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
    <style>
        .link-processing-order.active{
    color: #15a362;
    border-bottom: 2px solid #15a362;
}
    </style>
</body>

</html>