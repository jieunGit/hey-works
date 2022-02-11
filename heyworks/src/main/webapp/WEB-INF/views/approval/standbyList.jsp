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
		height:900px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 700px;
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
    #pagingArea{
	   	width:fit-content;
	   	margin-left:400px;
    }
    .pagination>li{
    	border-radius:10px;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="#" class="subject">내 결재 대기 문서</a>
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
					                    <td>${ap.formNo}</td>
					                    <td>
					                    	<c:if test="${ap.emergancy eq 'Y'}">
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
	
	<div id="pagingArea">
        <ul class="pagination">      
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="ongoing.el?cpage=${pi.currentPage-1}">이전</a></li>
            	</c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link" href="ongoing.el?cpage=${p}">${p}</a></li>
            </c:forEach>
            <c:choose>
        		<c:when test="${pi.currentPage eq pi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="ongoing.el?cpage=${pi.currentPage+1}">다음</a></li>
            	</c:otherwise>
           	</c:choose>
        </ul>
    </div>
	

	</div>
	

</body>
</html>