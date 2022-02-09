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
        margin-left:300px;
    }
    .year-outer, .week-outer{
        margin: auto;
        margin-top:30px;
        margin-left:20px;
        width: 1000px;
    }
    .working-box-list{
        list-style:none;
        height:100px;
    }
    .working-box-list, .working-box-list>li{
        float:left;
    }
    .working-box>strong{
        position:absolute;
        font-size:16px;
    }
    .working-box-list{
        position:relative;
        top:20px;
    }
    .working-box-list{
        border:1px solid gray;
        border-radius:5px;
        margin-right:20px;
    }
    .working-box-list>li{
        text-align:center;
        margin-top:20px;
        margin-right:15px;
        padding-right:15px;
    }

    /*주간 근무 정보*/
    .week-select{font-size:18px; font-weight:500;}
    .week-tb{
        border:1px solid gray;
        border-collapse:collapse;
    }
    .th, td{
        border:1px solid gray;
    }
    .tb-body tr{height:40px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <!-- 올해 근무 정보 -->
        <div class="year-outer" style=height:300px;>

            <div class="title-box">
                <h2>올해 근무 정보</h2>
            </div><br>

            <div class="working-box">
                <strong><img src="resources/images/time.png" style="width: 20px; height: 20px;">근무시간</strong>
                <ul class="working-box-list" style="width:30%">
                    <li style="border-right:1px solid gray;">
                        <strong>근무일수</strong><br><br>
                        <span>1일</span>
                    </li>
                    <li style="border-right:1px solid gray;">
                        <strong>총근무시간</strong><br><br>
                        <span>0시간</span>
                    </li>
                    <li>
                        <strong>평균근무시간</strong><br><br>
                        <span>0시간</span>
                    </li>
                </ul>

                <strong><img src="resources/images/to-do-list.png" style="width: 20px; height: 20px;">근태현황</strong>
                <ul class="working-box-list" style="width:30%">
                    <li style="border-right:1px solid gray;">
                        <strong>지각</strong><br><br>
                        <span>1회</span>
                    </li>
                    <li style="border-right:1px solid gray;">
                        <strong>조기퇴근</strong><br><br>
                        <span>0회</span>
                    </li>
                    <li style="border-right:1px solid gray;">
                        <strong>결근</strong><br><br>
                        <span>0회</span>
                    </li>
                    <li>
                        <strong>퇴근미체크</strong><br><br>
                        <span>0회</span>
                    </li>
                </ul>

                <strong><img src="resources/images/gift.png" style="width: 20px; height: 20px;">휴가현황</strong>
                <ul class="working-box-list"  style="width:21%">
                    <li style="border-right:1px solid gray;">
                        <strong>잔여휴가</strong><br><br>
                        <span>15일</span>
                    </li>
                    <li style="padding-top:15px;">
                        <button type="button">휴가신청</button>
                    </li>
                </ul>
            </div>

        </div>


        <!--주간 근무 정보-->
        <div class="week-outer" style=height:600px;>

            <div class="title-box">
                <h2>주간 근무 정보</h2>
            </div><br>
            <br>

            <div class="week-select" align="center">
                <span>&lt; 2022/02/07 ~ 2022/02/13 &gt;</span>
            </div><br><br>

            <table class="week-tb" border="1">
                <thead class="tb-head">
                    <tr height="50px">
                        <th width="110">날짜</th>
                        <th width="110">휴일구분</th>
                        <th width="130">근무스케줄시간</th>
                        <th width="100">출근시각</th>
                        <th width="100">퇴근시각</th>
                        <th width="100">휴게시간</th>
                        <th width="100">근무시간</th>
                        <th width="100">초과근무</th>
                        <th width="100">근태상황</th>
                    </tr>
                </thead>
                <tbody align="center" class="tb-body">
                    <tr>
                        <td>02/07(월)</td>
                        <td></td>
                        <td>08:00~17:00</td>
                        <td>07:50</td>
                        <td>18:00</td>
                        <td>01:00</td>
                        <td>08:00</td>
                        <td></td>
                        <td>정상근무</td>
                    </tr>
                    <tr>
                        <td>02/08(화)</td>
                        <td></td>
                        <td>08:00~17:00</td>
                        <td>07:50</td>
                        <td>18:00</td>
                        <td>01:00</td>
                        <td>08:00</td>
                        <td></td>
                        <td>정상근무</td>
                    </tr>
                    <tr>
                        <td>02/09(수)</td>
                        <td></td>
                        <td>08:00~17:00</td>
                        <td>07:50</td>
                        <td>18:00</td>
                        <td>01:00</td>
                        <td>08:00</td>
                        <td></td>
                        <td>정상근무</td>
                    </tr>
                    <tr>
                        <td>02/10(목)</td>
                        <td></td>
                        <td>08:00~17:00</td>
                        <td>07:50</td>
                        <td>18:00</td>
                        <td>01:00</td>
                        <td>08:00</td>
                        <td></td>
                        <td>정상근무</td>
                    </tr>
                    <tr>
                        <td>02/11(금)</td>
                        <td></td>
                        <td>08:00~17:00</td>
                        <td>07:50</td>
                        <td>18:00</td>
                        <td>01:00</td>
                        <td>08:00</td>
                        <td></td>
                        <td>정상근무</td>
                    </tr>
                    <tr>
                        <td>02/12(토)</td>
                        <td>공휴일</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>02/13(일)</td>
                        <td>법정공휴일</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>