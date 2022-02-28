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
    .all-status{
       width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
    }
    .title-box{font-size:23px; font-weight:600;}
    .table-borderless{
        border-spacing:0 20px;
        border-collapse:separate;
        font-size:14px;
        padding-left:250px;
    }
    .status-content{
        height:700px;
    }
    .table-borderless th{width:120px; height:35px; text-align:left;}
    .table-borderless td, .table-borderless input{width:300px; height:35px;}
    input:read-only{background-color:lightgrey;}
</style>
</head>
<body>
    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-status">
				
           <form action="tnaUpdate.wo" method="Get">
           		
            	<div class="update-btn">      
                   <button type="submit" class="btn btn-primary">수정</button>
                   <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
                </div>
                <br>
           
                <div class="status-content" style="border:1px solid lightgrey;"><br>
                
                	<h3 align="center" class="title-box">근태 상세</h3>
                	<br>
                	<input type="hidden" name="userNo" value="${w.userNo}">
	                <table class="table-borderless">
	                   <tr>
	                       <th><label for="userNo">사번</label></th>
	                       <td><input type="text" class="form-control" id="userNo" name="userName" value="${ w.userNo }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="userName">이름</label></th>
	                       <td><input type="text" class="form-control" id="userName" name="userName" value="${ w.userName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="deptName">소속</label></th>
	                       <td><input type="text" class="form-control" id="deptName" name="deptName" value="${ w.deptName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="jobName">직급</label></th>
	                       <td><input type="text" class="form-control" id="jobName" name="jobName" value="${ w.jobName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="clockIn">출근시각</label></th>
	                       <td><input type="text" class="form-control" id="clockIn" name="clockIn" value="${ w.clockIn }"></td>
	                   </tr>
	                   <tr>
	                       <th><label for="clockOut">퇴근시각</label></th>
	                       <td><input type="text" id="clockOut" class="form-control" name="clockOut" value="${ w.clockOut }"></td>
	                   </tr>
	                   <tr>
	                       <th><label for="rest">휴게시간</label></th>
	                       <td><input type="text" id="rest" class="form-control" name="leaveTotal" value="01:00" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="tnaStatus">근태상태</label></th>
	                       <td><input type="text" id="tnaStatus" class="form-control" name="tnaStatus" value="${ w.tnaStatus }"></td>
	                   </tr>
	                </table>
	            </div>

          </form>
        </div>
    </div>
</body>
</html>