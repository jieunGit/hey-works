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
    .sidebar>*{        
        width: 100%;
    }
    .sidebar-title{
    	font-size:23px; 
    	font-weight:bold;
    	margin-left: 15px;
    }
    .sidebar-menu ul{
    	list-style:none; 
    	padding-left:0px; 
    	padding-top:10px;
    }
    .sidebar-menu li{
    	padding-top:15px; 	
    	padding-bottom:10px;
    }
    .sidebar-menu li li:hover{
    	background:rgba(24, 121, 201, 0.2);
    }
    #menu-select{
    	padding-left:45px;
    	font-size:18px;
    }
    #menu-select:hover{
    	background:rgba(24, 121, 201, 0.2);
    }
    .sidebar-menu a{
    	color:black;
    	text-decoration:none;
   	}

</style>
</head>
<body>

    <div class="sidebar">
        <br>
        <div class="sidebar-title">
            <img src="resources/images/2722998.png" style="width:40px; height:40px;"> 근태관리
        </div>

        <div class="sidebar-menu">
            <ul>
                <li style="font-size:19px; padding-left:25px;"><strong>내 근무</strong></li>
                <li id="menu-select"><a href="main.wo">근태현황</a></li>
                <li id="menu-select"><a href="selectMyleave.wo">휴가현황</a></li>

                <!--관리자만-->
             	<c:if test="${ loginUser.adminYn eq 'Y' }">
		             <li style="font-size:19px; padding-left:25px;"><strong>전사 근무관리</strong></li>
		             <li id="menu-select"><a href="allTnaMain.wo">근태현황</a></li>
		             <li id="menu-select"><a href="leaveStatusList.wo">휴가현황</a></li>
		             <li id="menu-select"><a href="leaveApplyList.wo">휴가 신청내역</a></li>
            	</c:if>
            </ul>
        </div>


    </div>
</body>
</html>