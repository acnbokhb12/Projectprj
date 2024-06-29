<%-- 
    Document   : contact
    Created on : Jun 29, 2024, 10:28:48 AM
    Author     : DELL
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Font icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- style css -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
	<link rel="stylesheet" href="./assets/css/about.css">
</head>
<body style="background: #000;">
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
    <script src="./assets/js/header.js"></script>

    <div class="main-contact">
        <div class="container-infor-contact">
            <!-- img -->
            <div class="img-contact-intro">
                <img src="https://podbaranem.com/wp-content/uploads/2017/05/IMG_2724.jpg" alt="">
            </div>
            <!-- desc - fill in -->
            <div class="contact-detail-dest">
                <h2>Contact us</h2>
                <div class="row fill-description-map">
                    <div class="col-md-12 col-lg-6 fill-infor-self">
                        <h2>Get In Touch</h2>
                        <p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
                        <div class="contain-form-contact">
                            <form action="" method="post">
                                <div class="item-contact">
                                    <label>First Name</label><br>
                                    <input type="text">
                                </div>
        
                                
                            
                                <div class="item-contact">
                                    <label>E-Mail</label><br>
                                    <input type="email">
                                </div>
                            
                                
                            
                                <div class="item-contact">
                                    <label>Message</label><br>
                                    <textarea type="text" class=""></textarea>
                                </div>
                            
                                <span>
                                    <button type="submit" class="btn-sub-contact">SEND NOW</button>
                                </span>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-6 img-map-our">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.6100105370224!2d106.8073080748579!3d10.84112758931161!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1719624859782!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="./assets/js/footer.js"></script>
    <style> 
        .header{
            position: relative;
        }
    </style>
</body>
</html>