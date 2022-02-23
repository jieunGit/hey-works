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
    .table-borderless td, .table-borderless input{width:300px; height:30px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-status">
				
           <form action="leaveUpdate.wo" method="Get">
           		
            	<div class="update-btn">
                   <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
                   <button type="submit" class="btn btn-primary">수정</button>
                </div>
                <br>
           
                <div class="status-content" style="border:1px solid lightgrey;"><br>
                
                	<h3 align="center">휴가현황 수정</h3>
                	<br><br>
                	<input type="hidden" name=userNo value="${al.userNo}">
	                <table class="table-borderless">
	                   <tr>
	                       <th><label for="userName">이름</label></th>
	                       <td><input type="text" id="userName" name="userName" value="${ al.userName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="deptName">소속</label></th>
	                       <td><input type="text" id="deptName" name="deptName" value="${ al.deptName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="jobName">직급</label></th>
	                       <td><input type="text" id="jobName" name="jobName" value="${ al.jobName }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="hireDate">입사일</label></th>
	                       <td><input type="text" id="hireDate" name="hireDate" value="${ al.hireDate }" readonly></td>
	                   </tr>
	                   <tr>
	                       <th><label for="length">근속연수</label></th>
	                       <td><input type="number" id="length" name="lengthYears" value="${ al.lengthYears }"></td>
	                   </tr>
	                   <tr>
	                       <th><label for="totalLeave">총 연차</label></th>
	                       <td><input type="number" id="totalLeave" name="leaveTotal" value="${ al.leaveTotal }"></td>
	                   </tr>
	                   <tr>
	                       <th><label for="useLeave">사용 연차</label></th>
	                       <td><input type="number" id="useLeave" name="leaveUse" value="${ al.leaveUse }"></td>
	                   </tr>
	                   <tr>
	                       <th><label for="restLeave">잔여 연차</label></th>
	                       <td><input type="number" id="restLeave" name="leaveRest" value="${ al.leaveRest }"></td>
	                   </tr>
	
	                </table>
	            </div>

          </form>
        </div>
    </div>
</body>
</html>