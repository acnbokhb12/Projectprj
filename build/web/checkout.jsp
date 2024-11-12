<%-- 
    Document   : Checkout
    Created on : Jun 14, 2024, 2:09:23 PM
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
    <title>Check out</title>
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
<body  >
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
    <script src="./assets/js/header.js"></script>
    <div class="checkout-page-main container" >
        <header class="checkout-page-main-introheader">
          <h2 class="checkout-page-main-header col-12">Checkout form</h2>
            <p class="text-intro-checkout col-12">Complete the form with your billing and shipping information. Double-check your details before submitting.</p>  
        </header>  

          
        <div class="row form__checkout-main">
          <div class="form__checkout-infor-cast col-md-5 order-md-2 ">
             <h4 class="checkout-infor-cast-title">
                <span>Your Cart</span>
                <span><a href="cart.jsp">Edit Cart</a></span>
             </h4>
             <ul class="list__product">
                  <c:set var="TotalProduct" value="0"></c:set>
                  <c:set var="CountProduct" value="0"></c:set>
                 <c:forEach items="${sessionScope.cart}" var="entry">
                     
                 <li class="list-group-item">
                  <div class="item-detail-desc">
                    <div class="contain-img-product">
                      <img src="${entry.key.image}" alt="">
                    </div>
                    <div class="description-product">
                      <h4 class="description-product-name">${entry.key.name}</h4>
                      <h4 class="description-product-type">Qty :  <span style="margin-left: 7px;">${entry.value}</span></h4>
                      <h4 class="description-product-type">Type : <span>${entry.key.typeToBuy} </span></h4>
                        <c:choose>


                                            <c:when test="${entry.key.typeToBuy.equalsIgnoreCase('Food')}">
                                                <c:set var="PriceFood" value="${entry.key.price}" />
                                                <c:set var="PriceIngrs" value="${null}" />

                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="PriceFood" value="${null}" />
                                                <c:set var="PriceIngrs" value="0" />
                                                <c:forEach items="${entry.key.listingredients}" var="prIngr">   
                                                    <c:set var="PriceIngrs" value="${PriceIngrs + (prIngr.ingredientPrice) }" />
                                                </c:forEach>                                          
                                            </c:otherwise>
                                        </c:choose>
                      <h4 class="price-item-checkout">${ PriceFood != null ? PriceFood : PriceIngrs }</h4>
                    </div>
                  </div>
                          
                  <div class="subtotal-item">
                      <h4 class="name-price-subtotal">the total amount:</h4>
                      <h4 class="price-subtotal">${PriceFood != null ? PriceFood*entry.value : PriceIngrs*entry.value }</h4>
                  </div>
                </li>
                 </c:forEach> 
                       
            </ul> 
              <div class="list-group-item-total">
                    <h5 style="color: #FFA500;">Order total:</h5>
                    <span class="price-item-checkout">${sessionScope.TOTAL} </span>
                </div>
              
          </div>
          <div class="form__checkout-infor-customer col-md-7 order-md-1">
             <h4>Add a new address</h4>
             <div class="form__checkout-infor-desc">          
                 <form action="CheckOutServlet" method="post">
                <div class="form__checkout-name form-simple">
                    <label for="fullname">
                        Full name (First and Last name)
                    </label>
                    <input id="fullname" type="text" name="cusname" value="${sessionScope.UserAcc.userName !=null ? sessionScope.UserAcc.userName : "" }" required>
                </div>
                <div class="form__checkout-phone form-simple">
                    <label for="phonenumber">
                        Phone number
                    </label>
                    <input id="phonenumber" type="text" name="phone" value="${sessionScope.UserAcc.phoneNumber !=null ? sessionScope.UserAcc.phoneNumber : "" }" required>
                </div>
                <div class="form__checkout-address-street form-simple">
                    <label for="address-street-checkout">
                        Address
                    </label>
                    <input id="address-street-checkout" type="text" name="address" required="" placeholder="Street address">
                </div>
                
                <div class="form__checkout-payment-method">
                    <h4>Payment method</h4> 
                    <div class="container-brn-pay">
                        <div class="custom-radio">
                          <input type="radio" id="radio-1" class="card-tick-cash-byhand" name="tabs" checked="">
                          <label class="radio-label" for="radio-1">
                            <div class="radio-circle"></div>
                            <span class="radio-text"><i class="fa-solid fa-money-bill"></i>Cash before shipment</span>
                          </label>
                          <input type="radio" id="radio-2" name="tabs" class="card__payment-method">
                          <label class="radio-label" for="radio-2">
                            <div class="radio-circle"></div>
                            <span class="radio-text"><i class="fa-solid fa-credit-card"></i> Credit card</span>
                          </label>
                          <input type="radio" id="radio-3" name="tabs" class="card__payment-method">
                          <label class="radio-label" for="radio-3">
                            <div class="radio-circle"></div>
                            <span class="radio-text "><i class="fa-solid fa-credit-card"></i> Debit card</span>
                          </label>
                        </div>
                      </div>                            
                    <!-- <div class="form__checkout-payment">
                        <input type="radio" id="cbs" name="payment" checked required> <label for="cbs">Cash before shipment</label><br>
                        <input type="radio" id="cc" class="card__payment-method" name="payment" required> <label for="cc">Credit card</label><br>
                        <input type="radio" id="dc" class="card__payment-method" name="payment" required> <label for="dc">Debit  card</label><br>
                    </div>   -->
                </div>

                <div class="form__checkout-payment-method-card">
                    <!-- <h2>Add a credit or debit card</h2> -->
                    <section class="add-card page">
                        
                          <label for="name" class="label">
                            <span class="title">Name on card</span>
                            <input
                              class="input-field"
                              type="text"
                              name="input-name"
                              title="Input title"
                              placeholder="Enter your card name"
                            />
                          </label>
                          <label for="serialCardNumber" class="label">
                            <span class="title">Card Number</span>
                            <input
                              id="serialCardNumber"
                              class="input-field"
                              type="number"
                              name="input-name"
                              title="Input title"
                              placeholder="0000 0000 0000 0000"
                            />
                          </label>
                          <div class="split">
                            <label for="ExDate" class="label">
                              <span class="title">Expiry Date</span>
                              <input
                                id="ExDate"
                                class="input-field"
                                type="text"
                                name="input-name"
                                title="Expiry Date"
                                placeholder="01/23"
                              />
                            </label>
                            <label for="cvv" class="label">
                              <span class="title"> CVV</span>
                              <input
                                id="cvv"
                                class="input-field"
                                type="number"
                                name="cvv"
                                title="CVV"
                                placeholder="CVV"
                              />
                            </label>
                          </div>
                          
                         
                      </section>
                      
                    <!-- <div class="card-number fill-in-card">
                        <label for="card__number-input">Card Number</label>
                        <input id="card__number-input" type="text">
                    </div>
                    <div class="card-name fill-in-card">
                        <label for="name__card-input">Name on card</label>
                        <input id="name__card-input" type="text">
                    </div>
                    <div class="card-expiration fill-in-card">
                        <label for="">Expiration date</label>                        
                        <input type="date">

                    </div>
                    <div class="card-security-code fill-in-card">
                         <label for="">Security Code</label>
                         <input type="password">
                    </div> -->
                </div>
                 
                     <button class="form__checkout-btn" type="submit">Complete</button>
            </form>
        </div>
          </div>
        </div>
  
        <footer class="footer-checkout">
          <p class="">2024-2025 Kahof Makede</p>
          <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
          </ul>
        </footer>
        
      </div>
     <script src="./assets/js/footer.js"></script>
       <script>
             const priceItemCheckout = document.querySelectorAll('.price-item-checkout'),
                    priceSubtotal = document.querySelectorAll('.price-subtotal');
              priceItemCheckout.forEach(function (element) {
                let price = parseInt(element.innerText);
                let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                element.innerText = formattedAmount;
            });
            priceSubtotal.forEach(function (element) {
                let price = parseInt(element.innerText);
                let formattedAmount = price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                element.innerText = formattedAmount;
            });

            const tickCardMethods = document.querySelectorAll('.card__payment-method');
            const tickBuyReal = document.querySelector('.card-tick-cash-byhand');  
            const tableCardMethod = document.querySelector('.form__checkout-payment-method-card');
            for(const tickCardSimple of tickCardMethods){
                tickCardSimple.addEventListener('click',function(){
                    tableCardMethod.classList.add('form__checkout-payment-method-card-open');
                });
            };
            tickBuyReal.addEventListener('click',function(){
                tableCardMethod.classList.remove('form__checkout-payment-method-card-open');

            });
       </script>
     
</body>
</html>