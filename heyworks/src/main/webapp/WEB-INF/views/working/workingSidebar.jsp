<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sidebar{
        border:1px solid lightgray;
	    width:180px;
	    height:800px;
        margin-left:70px;
    }
    .sidebar>*{margin-left:15px;}
    td{text-align:right;}
    button{margin-top:7px;}

    ul{list-style:none; padding-left:0px; margin-top:10px;}
    a{text-decoration:none; color:black;}
    ul>li{margin-top:10px;}

</style>
</head>
<body>

    <div class="sidebar">

        <h2>>> 근태관리</h2>

        <p>2022-02-11(금)</p>
        <strong style="font-size:25px;">10:20:30</strong><br><br>

        <table class="click-time">
            <tr>
                <th>출근시간</th>
                <td width="85px">08:00:00</td>
            </tr>
            <tr>
                <th>퇴근시간</th>
                <td>미등록</td>
            </tr>
        </table>
        <hr style="margin-right:15px;">

        <button style="margin-left:35px;">출근</button> 
        <button>퇴근</button><br>

        <button style="margin-left:35px;">연장근무신청</button>
        <br><br><br><br><br>

        <div class="sidebar-menu">
            <ul>
                <li style="font-size:15px;"><strong>내 근무</strong>
                    <ul>
                        <li style="margin-left:15px;"><a href="">근무/휴가</a></li>
                        <li style="margin-left:15px;"><a href="">근무/휴가현황</a></li>
                        <li style="margin-left:15px;"><a href="">부서 근무현황</a></li>
                    </ul>
                </li><br><br>

                <!--관리자만-->
                <li style="font-size:15px;"><strong>근무관리</strong>
                    <ul>
                        <li style="margin-left:15px;"><a href="">전사 휴가현황</a></li>
                        <li style="margin-left:15px;"><a href="">휴가 신청내역</a></li>
                        <li style="margin-left:15px;"><a href="">연장근무 신청내역</a></li>
                    </ul>
                </li>
            </ul>
        </div>


    </div>
</body>
</html>