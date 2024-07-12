<%-- 
    Document   : orderHistory
    Created on : Jul 6, 2024, 10:24:51 PM
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
    <title>Order History</title>
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
    <link rel="stylesheet" href="./assets/css/about.css">
</head>

<body>
    <%
            Account user = (Account) session.getAttribute("CustomerAcc");

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
    <script src="./assets/js/header.js"></script>
    <div class="main-order">
        <div class="container container-order-history">
            <div class="row row-title-order" style="padding: 0px 24px;">
                <h1>Order history</h1>
            </div>
            <div class="row">
                <div class="col-xxl-8 col-12">
                    <!-- card -->
                    <div class="card" style="border-radius: 8px;">
                        <!-- card body-->
                        <div class="card-body">
                            <div class="mb-6 title-order-history">
                                <h4 class="mb-0">Your Order</h4>
                                <p>Check the status of recent orders, manage returns, and discover similar products.</p>
                            </div>
                            <c:forEach items="${ListOrderHistory}" var="oa">
                                
                            
                            <!-- mb-8 o day la nhung mon order trong 1 ngay cu the -->
                            <div class="mb-8" style="margin-bottom: 40px;">
                                <!-- text -->
                                 <!--  -->
                                <div
                                    class="border-bottom mb-3 pb-3 d-lg-flex align-items-center justify-content-between ">
                                    <div class="name-order-date d-flex align-items-center justify-content-between">
                                        <h5 class="mb-0">Order ${oa.orderId}</h5>
                                        <span class="ms-2">On ${oa.orderDate}</span>
                                    </div>
                                     <div class="d-flex contain-status-order-detail">
                                     
                                        <h5>Status: </h5>
                                        <h5 class="${oa.orderStatus == 1 ? "status-onhold" :( oa.orderStatus == 2 ? "status-processing" : ( oa.orderStatus == 3 ? "status-delivering": (oa.orderStatus==4 ? "status-success" : (oa.orderStatus==5 ? "status-canceled" : '') )))}">
                                            Delivered
                                        </h5>
                                    </div> 
                                </div>
                                <!-- row -->
                            <c:set var="TotalProduct" value="0"></c:set>
                                <c:forEach items="${oa.orderDetails}" var="ordd">
                                    
                                 
                                <div class="row justify-content-between align-items-center">
                                    <!-- col -->
                                    <div class="col-lg-8 col-12">
                                        <div class="desc-infor-order-product d-md-flex">
                                            <div class="cotain-img-order-detail">
                                                <!-- img -->
                                                <c:if test="${ordd.type.equalsIgnoreCase('Food')}">
                                                    <img src="${ordd.food.image}"
                                                        alt="" class="img-4by3-xl rounded">                                                 
                                                </c:if>
                                                 <c:if test="${ordd.type.equalsIgnoreCase('ingredient')}">
                                                    <c:forEach items="${ordd.food.listingredients}" var="li">
                                                        <img src="${li.ingredientImg}"
                                                            alt="" class="img-4by3-xl rounded">
                                                        
                                                    </c:forEach>
                                                </c:if>    
                                                
                                            </div>
                                            <div class="contain-description-order-detail ms-md-4 mt-2 mt-lg-0">
                                                <!-- heading -->
                                                <h5 class="mb-1">
                                                     ${ordd.food.name}
                                                </h5>
                                                <!-- Type - Qty -->
                                                <c:choose>


                                            <c:when test="${ordd.type.equalsIgnoreCase('Food')}">
                                                <c:set var="PriceFood" value="${ordd.food.price}" />
                                                <c:set var="PriceIngrs" value="${null}" />

                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="PriceFood" value="${null}" />
                                                <c:set var="PriceIngrs" value="0" />
                                                <c:forEach items="${ordd.food.listingredients}" var="prIngr">   
                                                    <c:set var="PriceIngrs" value="${PriceIngrs + (prIngr.ingredientPrice) }" />
                                                </c:forEach>                                          
                                            </c:otherwise>
                                        </c:choose>    
                                                <span>Type: <span class="contain-type-qty text-dark"
                                                        style="text-transform: capitalize;">${ordd.type}</span>,
                                                    Qty:<span class="contain-type-qty text-dark"> ${ordd.orderDetailQuantity}</span>
                                                </span>
                                                <!-- text -->
                                                <div class="contain-price-order-detail">
                                                    <h4 class="price-detail-product">${ PriceFood != null ? PriceFood : PriceIngrs }</h4>
                                                </div>
                                            </div>
                                            <div class="contain-subtotal-order-detail">
                                              <c:set var="TotalProduct" value="${PriceFood != null ? PriceFood*ordd.orderDetailQuantity + TotalProduct : PriceIngrs*ordd.orderDetailQuantity + TotalProduct }" ></c:set>
                                                <h5>Total</h5>
                                                <h5 class="detail-subtotal-order-detail">${PriceFood != null ? PriceFood*ordd.orderDetailQuantity : PriceIngrs*ordd.orderDetailQuantity }</h5>
                                            </div>    
                                                
                                        </div>
                                    </div>
                                    <!-- button -->
                                    <div class="col-lg-3 col-12 d-grid">
                                        <!-- <a href="products.html" class="btn btn-primary mb-2">Buy again</a>
                            <a href="#" class="btn btn-secondary"> Shop similar</a> -->
                                        <button class="btn-buy-again">
                                            <a href="ControllerServlet?action=foodDe&fid=${ordd.orderFoodId}">Buy again</a>
                                        </button>
                                    </div>
                                </div>
                                <hr class="my-4">
                                <!-- row -->
                                 </c:forEach>
                                <div class="grand-total-order">
                                    <div class="grand-total-order-detail">
                                        <h1 class="grand-total-title">Grand total:</h1>
                                        <h1 class="grand-total-price">${TotalProduct}</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- end mon trong 1 ngay cu the -->
                              </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/footer.js"></script>
    <style>
       
    </style>
    <script>
        const priceElements = document.querySelectorAll('.price-detail-product');
        priceElements.forEach(function (element) {
            let price = parseInt(element.innerText);
            let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            element.innerText = formattedAmount;
        });
        const detailTotal = document.querySelectorAll('.detail-subtotal-order-detail');
        detailTotal.forEach(function (element) {
            let price = parseInt(element.innerText);
            let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            element.innerText = formattedAmount;
        });
        const grandTotal = document.querySelectorAll('.grand-total-price');
        grandTotal.forEach(function (element) {
            let price = parseInt(element.innerText);
            let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
            element.innerText = formattedAmount;
        });
    </script>
</body>

</html>