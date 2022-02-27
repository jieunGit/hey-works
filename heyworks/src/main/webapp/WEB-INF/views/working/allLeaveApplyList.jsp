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
    .all-apply{
       width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
    }
    .date-box{font-size:25px; font-weight:600;}
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
    #tb-reason:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-apply">

            <div class="title-box">
                <h3 style="font-size:20px;">휴가 신청내역</h3>
            </div><br>

            <div class="date-box" style="margin-bottom:50px;" align="center">
                <span> 2022-01-01 ~ 2022-12-31 </span>
            </div>

            <br>

            <table class="table-bordered">
                <tr style="height:43px;">
                    <th width="125">신청일</th>
                    <th width="95">이름</th>
                    <th width="95">소속</th>
                    <th width="95">직급</th>
                    <th width="80">신청일수</th>
                    <th width="240">휴가기간</th>
                    <th width="95">구분</th>
                    <th width="90">상태</th>
                </tr>
                <c:forEach var="la" items="${leApplist}">
                	<input type="hidden" name="leaveAno" value="${la.leaveAno}">
	                <tr style="height:37px; text-align:center;">          	
	                    <td width="100">${ la.applyDate }</td>
	                    <td>${ la.userName }</td>
	                    <td>${ la.deptName }</td>
	                    <td>${ la.jobName }</td>
	                    <td>${ la.leaveUse }</td>
	                    <td>${ la.startDate } ~ ${ la.endDate }</td>
	                    <td id="tb-reason">${ la.leaveType }</td>
	                    <td><a href="leaveApplyUpdateForm.wo?leaveAno=${ la.leaveAno }" class="btn btn-primary btn-sm">
	                    	${ la.status }</a>
	                    </td>
	                </tr>
                </c:forEach>
            </table>
            <br>

            
            <div id="pagingArea">
               <ul class="pagination">
               	<c:choose>
             			<c:when test="${ pi.currentPage eq 1 }">
                   		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="leaveApplyList.wo?cpage=${ pi.currentPage-1 }">Previous</a></li>
                   	</c:otherwise>
                   </c:choose>
                   
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   	<li class="page-item"><a class="page-link" href="leaveApplyList.wo?cpage=${ p }">${ p }</a></li>
                   </c:forEach>
                   
                   <c:choose>
                   	<c:when test="${ pi.currentPage eq pi.maxPage }">
                   		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                   	</c:when>
                   	<c:otherwise>
                   		<li class="page-item"><a class="page-link" href="leaveApplyList.wo?cpage=${ pi.currentPage+1 }">Next</a></li>
                   	</c:otherwise>
                   </c:choose>
               </ul>
            </div>

        </div>
    </div>
</body>
</html>