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
    
    .wide-menu{margin-top:20px;}
    .wide-menu>a{
      text-decoration: none; 
      color:black; 
      font-size:18px;
      margin-right:20px;
      font-weight:600;
    }

</style>
</head>
<body onload="autoReload();">

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>
        <br><br>

        <div class="status-outer">

            <div class="wide-menu">
                <a href="">근무현황</a>
                <a href="selectMyleave.wo">휴가현황</a>
            </div>
            <hr width="920px" align="left">
            <br>

            
            <div align="center">
                <input type = "button" value = "<"/>
                <span class="year-month" style="font-size:17px; font-weight:bold;">
    
                </span>
                <input type = "button" value = ">"/>
                
            </div>
            <br><br>
            

            <table id="calendar" border="1">
                <thead>
                    <tr>
                        <th width="110">날짜</th>
                        <th width="110">휴일구분</th>
                        <th width="130">근무스케줄시간</th>
                        <th width="90">출근시각</th>
                        <th width="90">퇴근시각</th>
                        <th width="90">휴게시간</th>
                        <th width="90">근무시간</th>
                        <th width="90">초과근무</th>
                        <th width="100">근태상황</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                    </tr>
                </tbody>
            </table>
 

            <script>
                const date = new Date();

                const viewYear = date.getFullYear();
                const viewMonth = date.getMonth();

                // 연도-월 출력
                document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;
            </script>




        </div>
    </div>
</body>
</html>