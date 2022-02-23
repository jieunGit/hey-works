<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .status-outer{
	   width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
	}

    /*캘린더*/
    * {
    margin: 0;
    padding: 0;
    list-style: none;
    box-sizing: border-box;
    }
    .days{background:rgba(63, 145, 213, 0.295);}

    .calendar {
    width: 700px;
    margin: 20px;
    }

    .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    }

    .year-month {
    font-size: 35px;
    }

    .nav {
    display: flex;
    border: 1px solid #333333;
    border-radius: 5px;
    }

    .nav-btn {
    width: 28px;
    height: 30px;
    border: none;
    font-size: 16px;
    line-height: 34px;
    background-color: transparent;
    cursor: pointer;
    }

    .go-today {
    width: 75px;
    border-left: 1px solid #333333;
    border-right: 1px solid #333333;
    }

    .days {
    display: flex;
    margin: 25px 0 10px;
    }

    .day {
    width: calc(100% / 7);
    text-align: center;
    font-size:15px;
    }

    .dates {
    display: flex;
    flex-flow: row wrap;
    height: 500px;
    border-top: 1px solid #333333;
    border-right: 1px solid #333333;
    }

    .date {
    width: calc(100% / 7);
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #333333;
    border-left: 1px solid #333333;
    }

    .day:nth-child(7n + 1),
    .date:nth-child(7n + 1) {
    color: #D13E3E;
    }

    .day:nth-child(7n),
    .date:nth-child(7n) {
    color: #396EE2;
    }

    .other {
    opacity: 0.3;
    }
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>
        <br><br>

        <div class="status-outer">

            <div class="wide-menu"> 

                <div class="calendar">
                    <div class="header">
                    <div class="year-month"></div>
                    <div class="nav">
                        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                        <button class="nav-btn go-today" onclick="goToday()">Today</button>
                        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                    </div>
                    </div>
                    <div class="main">
                    <div class="days">
                        <div class="day">일</div>
                        <div class="day">월</div>
                        <div class="day">화</div>
                        <div class="day">수</div>
                        <div class="day">목</div>
                        <div class="day">금</div>
                        <div class="day">토</div>
                    </div>
                    <div class="dates"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        let date = new Date();

        const renderCalender = () => {
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();

        document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

        const prevLast = new Date(viewYear, viewMonth, 0);
        const thisLast = new Date(viewYear, viewMonth + 1, 0);

        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();

        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];

        if (PLDay !== 6) {
            for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
            }
        }

        for (let i = 1; i < 7 - TLDay; i++) {
            nextDates.push(i);
        }

        const dates = prevDates.concat(thisDates, nextDates);
        const firstDateIndex = dates.indexOf(1);
        const lastDateIndex = dates.lastIndexOf(TLDate);

        dates.forEach((date, i) => {
            const condition = i >= firstDateIndex && i < lastDateIndex + 1
                            ? 'this'
                            : 'other';
            dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
        });

        document.querySelector('.dates').innerHTML = dates.join('');

        const today = new Date();
        if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
            for (let date of document.querySelectorAll('.this')) {
                if (+date.innerText === today.getDate()) {
                    date.classList.add('today');
                    break;
                }
            }
        }
        };

        renderCalender();
        // 이전달
        const prevMonth = () => {
        date.setMonth(date.getMonth() - 1);
        renderCalender();
        };
        // 다음달
        const nextMonth = () => {
        date.setMonth(date.getMonth() + 1);
        renderCalender();
        };
        // 현재 달로 돌아가기 
        const goToday = () => {
        date = new Date();
        renderCalender();
        };


    </script>
</body>
</html>