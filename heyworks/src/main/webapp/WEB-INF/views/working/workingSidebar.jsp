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
        display:inline-block;
    }
    .sidebar>*{margin-left:15px;}
    .sidebar-title{font-size:20px; font-weight:bold;}
    .click-td{text-align:right; border:none;}
    button{margin-top:7px;}
    /*실시간 날짜, 시간*/
    .date{font-size:15px;}
    .time{
        font-size:30px;
    }
    .in-btn, .out-btn{
        width:65px;
        height:37px;
        border-radius:20px;
        border:none;
        background:rgb(63, 145, 213);
        color:white;
        font-size:15px;
        font-weight:600;
    }
    .ot-btn{
        width:147px;
        height:37px;
        border-radius:20px;
        border:none;
        background:lightgrey;
        color:white;
        font-size:15px;
        font-weight:600;
    }
    .in-btn, .out-btn, .ot-btn:hover{cursor:pointer;}
    ul{list-style:none; padding-left:0px; margin-top:10px;}
    a{text-decoration:none; color:black;}
    ul>li{margin-top:10px;}

</style>
</head>
<body>

    <div class="sidebar">
        <br>
        <div class="sidebar-title">
            <img src="resources/images/2722998.png" style="width: 25px; height: 25px;"> 근태관리
        </div><br>

        <div class="sidebar-menu">
            <ul>
                <li style="font-size:15px;"><strong>내 근무</strong>
                    <ul>
                        <li style="margin-left:15px;"><a href="main.wo">근태현황</a></li>
                        <li style="margin-left:15px;"><a href="selectMyleave.wo">휴가현황</a></li>
                    </ul>
                </li><br><br>

                <!--관리자만-->
                <c:if test="${ loginUser.adminYn eq 'Y' }">
	                <li style="font-size:15px;"><strong>근무관리</strong>
	                    <ul>
	                        <li style="margin-left:15px;"><a href="allTnaMain.wo">전사 근태현황</a></li>
	                        <li style="margin-left:15px;"><a href="leaveStatusList.wo">전사 휴가현황</a></li>
	                        <li style="margin-left:15px;"><a href="leaveApplyList.wo">휴가 신청내역</a></li>
	                    </ul>
	                </li>
                </c:if>
            </ul>
        </div>


    </div>
</body>
</html>