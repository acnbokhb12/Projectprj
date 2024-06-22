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
    <script src="./assets/js/header.js"></script>
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
    <script>
        const calendar = document.querySelector('.calendar__weekly'),
            date = document.querySelector('.date__month'),
            daysContainer = document.querySelector('.calender-days'),
            prev = document.querySelector('.prev-month'),
            next = document.querySelector('.next-month'),
            todayBtn = document.querySelector('.today-btn'),
            gotoBtn = document.querySelector('.goto-btn'),
            dateInput = document.querySelector('.date-input');

        // date 2 event
        const eventDay = document.querySelector('.event-day'),
            eventDate = document.querySelector('.event-date');

        let today = new Date();
        let activeDay;
        let month = today.getMonth();
        let year = today.getFullYear();

        const months = [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ];
        const eventsArr = [
            {
                day: 20,
                month: 6,
                year: 2024,

                events: [
                    {
                        id: "4",
                        img: "https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg",
                        name: "Amish bread",
                        cate: "Bread"
                    },
                    {
                        id: "5",
                        img: "",
                        name: "Amish bread",
                        cate: "Bread"
                    }
                ]
            },
            {
                day: 30,
                month: 5,
                year: 2024,
                events: [
                    {
                        id: "1",
                        img: "https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg",
                        name: "Amish bread",
                        cate: "Bread"
                    },
                    {
                        id: "3",
                        img: "https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg",
                        name: "Amish bread",
                        cate: "Bread"
                    }
                ]
            }
        ];
        // function to add days
        function initCalendar() {
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const prevLastDay = new Date(year, month, 0);
            const prevDays = prevLastDay.getDate();
            const lastDate = lastDay.getDate();
            const day = firstDay.getDate();
            const firstDayIndex = firstDay.getDay();
            const lastDayIndex = lastDay.getDay();
            const nextDays = 7 - lastDay.getDay() - 1;

            eventsContainer = document.querySelector('.events');


            // update day top of calendar
            date.innerHTML = months[month] + " " + year;

            // add the days
            let days = "";
            // pre monthdays
            for (let x = firstDayIndex; x > 0; x--) {
                days += `<div class="day-item prev-date">${prevDays - x + 1}</div>`;
            }
            for (let i = 1; i <= lastDate; i++) {

                // check if event present on current day
                let event = false;
                eventsArr.forEach((eventObj) => {
                    if (

                        eventObj.day === i &&
                        eventObj.month === month + 1 &&
                        eventObj.year === year
                    ) {
                        event = true;
                    }
                });

                // if is today add class
                if (
                    i === new Date().getDate() &&
                    year === new Date().getFullYear() &&
                    month === new Date().getMonth()
                ) {
                    activeDay = i;
                    getActiveDay(i);
                    updateEvents(i);
                    // if event found also add event class
                    //add active on today and at starup
                    if (event) {
                        days += `<div class="day-item today-item calendar-event active  ">${i}</div>`;

                    } else {
                        days += `<div class="day-item today-item active  ">${i}</div>`;

                    }
                }
                //  add remaining
                else {
                    // days += `<div class="day-item">${i}</div>`;
                    if (event) {
                        days += `<div class="day-item calendar-event ">${i}</div>`;

                    } else {
                        days += `<div class="day-item ">${i}</div>`;

                    }
                }
            }
            for (let j = 1; j <= nextDays; j++) {
                days += `<div class="day-item next-date">${j}</div>`;
            }

            daysContainer.innerHTML = days;

            //add listner after calendar initcalendar
            addListner();

        }
        initCalendar();

        // pre month
        function prevMonth() {
            month--;
            if (month < 0) {
                month = 11;
                year--;
            }
            initCalendar();
        }
        // next month
        function nextMonth() {
            month++;
            if (month > 11) {
                month = 0;
                year++;
            }
            initCalendar();
        }

        // add eventlist
        prev.addEventListener('click', prevMonth);
        next.addEventListener('click', nextMonth);

        // today btn
        todayBtn.addEventListener('click', () => {
            today = new Date();
            month = today.getMonth();
            year = today.getFullYear();
            initCalendar();
        });

        dateInput.addEventListener("input", (e) => {

            // Xóa các ký tự không phải là số
            dateInput.value = dateInput.value.replace(/[^0-9/]/g, "");

            // Thêm dấu gạch chéo sau 2 chữ số
            if (dateInput.value.length === 2) {
                dateInput.value += "/";
            }

            // Giới hạn độ dài của chuỗi nhập vào
            if (dateInput.value.length > 7) {
                dateInput.value = dateInput.value.slice(0, 7);
            }
            if (e.inputType === "deleteContentBackward") {
                if (dateInput.value.length === 3) {
                    dateInput.value = dateInput.value.slice(0, 2);
                }
            }
        });

        gotoBtn.addEventListener('click', gotoDate);
        function gotoDate() {
            const dateArr = dateInput.value.split("/");
            if (dateArr.length === 2) {
                if (dateArr[0] > 0 && dateArr[0] < 13 && dateArr[1].length === 4) {
                    month = dateArr[0] - 1;
                    year = dateArr[1];
                    initCalendar();
                    return;
                }
            }
            alert("Invalid date");
        }


        // create func to add listner on days after render

        function addListner() {
            const days = document.querySelectorAll('.day-item');
            days.forEach((day) => {
                day.addEventListener('click', (e) => {
                    //set current day as active day
                    activeDay = Number(e.target.innerHTML);

                    // callactive day after click
                    getActiveDay(e.target.innerHTML);
                    updateEvents(Number(e.target.innerHTML));

                    //remove active from alredy active
                    days.forEach((day) => {

                        day.classList.remove("active");
                    });
                    // if prev month day click go to prev month
                    if (e.target.classList.contains("prev-date")) {
                        prevMonth();
                        setTimeout(() => {
                            // select all day of that month
                            const days = document.querySelectorAll('.day-item');

                            // after go to prev month add active to click
                            days.forEach((day) => {
                                if (!day.classList.contains("prev-date") &&
                                    day.innerHTML === e.target.innerHTML) {
                                    day.classList.add("active");
                                };
                            });
                        }, 100);
                    } else //same to next month
                        if (e.target.classList.contains("next-date")) {
                            nextMonth();
                            setTimeout(() => {
                                // select all day of that month
                                const days = document.querySelectorAll('.day-item');

                                // after go to prev month add active to click
                                days.forEach((day) => {
                                    if (!day.classList.contains("next-date") &&
                                        day.innerHTML === e.target.innerHTML) {
                                        day.classList.add("active");
                                    };
                                });
                            }, 100);
                        } else //cai nay cho nhung nut trong thang click
                        {
                            e.target.classList.add("active");
                        }

                });
            });
        };

        // let show active day events and day at top

        function getActiveDay(date) {
            const day = new Date(year, month, date);
            const dayName = day.toString().split(" ")[0];
            eventDay.innerHTML = dayName;
            eventDate.innerHTML = date + " " + months[month] + " " + year;
        }

        // func show event of day
        function getActiveDay(date) {
            const day = new Date(year, month, date);
            const dayName = day.toString().split(" ")[0];
            eventDay.innerHTML = dayName;
            eventDate.innerHTML = date + " " + months[month] + " " + year;
        }


        //function update events when a day is active
        function updateEvents(date) {
            let events = "";

            eventsArr.forEach((event) => {
                if (
                    date === event.day &&
                    month + 1 === event.month &&
                    year === event.year
                ) {

                    event.events.forEach((event) => {
                        events += `
                    
                        <div class="event">
                        <div class="id-food">${event.id}</div>
                        <img class="img-food-weekly" src="${event.img}" alt="">
                        <div class="link-food-weekly">
                            <a href="Product.html" class="name-food-weekly">${event.name}</a>
                            <h5 class="cate-food-wekkly">
                                <p>${event.cate}</p>
                            </h5>
                            
                        </div>
                    </div>`;
                    });
                }
            });
            if (events === "") {
                events = `<div class="no-event">
            <h3>No Events</h3>
        </div>`;
            }

            eventsContainer.innerHTML = events;
        }
        // eventsContainer.addEventListener("click", (e) => {
        //     e.target.classList("event")
        // })

        // const btndelete = document.querySelectorAll('.delete-food-weekly');

        eventsContainer.addEventListener("click", (e) => {
            if (e.target.classList.contains("event")) {

                if (confirm("Are you sure you want to delete this event?")) {
                    const eventId = e.target.children[0].innerHTML;

                    eventsArr.forEach((event) => {
                        if (
                            event.day === activeDay &&
                            event.month === month + 1 &&
                            event.year === year
                        ) {
                            event.events.forEach((item, index) => {
                                if (item.id === eventId) {
                                    event.events.splice(index, 1);
                                }
                            });
                            //if no events left in a day then remove that day from eventsArr
                            if (event.events.length === 0) {
                                eventsArr.splice(eventsArr.indexOf(event), 1);
                                //remove event class from day
                                const activeDayEl = document.querySelector(".day-item.active");
                                if (activeDayEl.classList.contains("calendar-event")) {
                                      activeDayEl.classList.remove("calendar-event");
                                }
                            }
                        }
                    });
                    updateEvents(activeDay);
                }
            }
        });




    </script>

</body>

</html>
