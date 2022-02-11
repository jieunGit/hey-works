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
    .elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 900px;
    }
    .table-bordered *{
        height: 40px;
    }
    .table-bordered th{
        background-color: rgb(245, 244, 244);
    }
    .table-bordered td{
        text-align: center;
    }
    .subject{
        color: black;
        font-size: 20px;
        font-weight: 800;
    }
    .subject:hover{
        color: black;
        text-decoration: none;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="" class="subject">결재 대기 문서</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="120">기안일</th>
	                    <th width="170">결재양식</th>
	                    <th width="80">긴급</th>
	                    <th width="380">제목</th>
	                    <th wdith="40">첨부</th>
	                    <th width="110">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:choose>
	            		<c:when test="${empty apList}">
            				<tr align="center">
			            		<td colspan="6">결재 대기중인 문서가 없습니다.</td>
			            	</tr>
			            </c:when>
			            <c:otherwise>
				            <c:forEach var="ap" items="${apList}">
					                <tr>
					                    <td>${ap.createDate}</td>
					                    <td>${ap.approvalTitle}</td>
					                    <td>
					                    	<c:if test="${!empty ap.emergancy}">
					                        	<img src="resources/images/179386.png" style="width: 30%; height: 65%;" >
					                    	</c:if>
					                    </td>
					                    <td>${ap.approvalTitle}</td>
					                    <td>
					                    	<c:if test="${!empty ap.originName}">
					                        	<img src="resources/images/2586886.png" style="width: 80%; height: 70%;" >
					                    	</c:if>
					                    </td>
					                    <td>${ap.userNo}</td>
					                </tr>
	                			</c:forEach>
			            </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div>
	</div>

</body>
</html>