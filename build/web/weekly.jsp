<%-- 
    Document   : weekly
    Created on : Jun 22, 2024, 6:21:30 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- <link rel="stylesheet" href="./assets/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/calendar.css">
</head>

<body>
    <!-- nhung header -->
    <!--<script src="./assets/js/header.js"></script>-->
    <div class="calendar__main">


        <div class="container container__weekly">
            <!-- <div class="row row__weekly"> -->

            <div class="calendar-left   ">
                <div class="calendar__weekly">
                    <div class="calendar-month">
                        <i class="fa-solid fa-chevron-left prev-month"></i>
                        <div class="date__month"></div>
                        <i class="fa-solid fa-chevron-right next-month"></i>

                    </div>
                    <!-- thu ngay trong tuan -->
                    <div class="calendar-weekly-days">
                        <div class="date-item-weekly">sun</div>
                        <div class="date-item-weekly">mon</div>
                        <div class="date-item-weekly">tue</div>
                        <div class="date-item-weekly">wed</div>
                        <div class="date-item-weekly">thu</div>
                        <div class="date-item-weekly">fri</div>
                        <div class="date-item-weekly">sat</div>
                    </div>
                    <!-- days -->
                    <div class="calender-days">

                    </div>
                    <!-- go to day -->
                    <div class="calendar-goto-today">
                        <div class="goto">
                            <input type="text" placeholder="mm/yy" class="date-input">
                            <button class="goto-btn">Go</button>
                        </div>
                        <button class="today-btn">Today</button>
                    </div>
                </div>
            </div>
            <div class="favorite-right ">
                <div class="today-date">
                    <div class="event-day">Wed</div>
                    <div class="event-date">16 November 2022</div>
                </div>
                <div class="name-of-event">

                </div>
                <div class="events">


                </div>
            </div>

            <!-- </div> -->
        </div>
    </div>
    <script src="./assets/js/footer.js"></script>
    <script src="./assets/js/calendar.js">
        
    </script>

</body>

</html>
