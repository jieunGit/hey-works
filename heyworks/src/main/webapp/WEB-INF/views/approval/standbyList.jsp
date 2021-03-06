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
    .table-hover *{
        height: 40px;
        font-size:13px;
        border:white;
    }
    .table-hover th{
        background-color: rgb(245, 244, 244);
    }
    .table-hover td{
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
	   	margin-left:380px;
    }
    .pagination>li{
    	border-radius:10px;
    	margin-left:5px;
		font-size:10px;
    }
    .table-hover tr:hover{
    	cursor:pointer;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="#" class="subject">결재대기</a>
	        <br><br>
	        
        <br>
	
	        <table align="center" class="table-hover">
	            <thead>
	                <tr align="center">
	                    <th width="120">기안일</th>
	                    <th width="120">문서번호</th>
	                    <th width="120">문서종류</th>
	                    <th width="80">작성팀</th>
	                    <th width="80">긴급</th>
	                    <th width="250">제목</th>
	                    <th width="50">첨부</th>
	                    <th width="85">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:choose>
	            		<c:when test="${empty apList}">
            				<tr align="center">
			            		<td colspan="8">결재 대기중인 문서가 없습니다.</td>
			            	</tr>
			            </c:when>
			            <c:otherwise>
				            <c:forEach var="ap" items="${apList}">
					                <tr>
					                    <td>${ap.createDate}</td>
					                	<td class="ano">${ap.approvalNo}</td>
					                    <td>${ap.formNo}</td>
					                    <td>${ap.writeDept}</td>
					                    <td>
					                    	<c:if test="${ap.emergancy eq 'Y'}">
					                        	<img src="resources/images/emergancy.png" style="width: 25%; height: 55%;" >
					                    	</c:if>
					                    </td>
					                    <td>${ap.approvalTitle}</td>
					                    <td>
					                    	<c:if test="${!empty ap.originName}">
					                        	<img src="resources/images/attachment.png" style="width: 80%; height: 70%;" >
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
		<c:if test="${pi.endPage > 0}">
        <ul class="pagination">
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">◀ PREV</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="standby.el?cpage=${pi.currentPage-1}">◀ PREV</a></li>
            	</c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link" href="standby.el?cpage=${p}">${p}</a></li>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${pi.currentPage eq pi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">NEXT ▶</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="standby.el?cpage=${pi.currentPage+1}">NEXT ▶</a></li>
            	</c:otherwise>
           	</c:choose>
        </ul>
        </c:if>
    </div>
	

	</div>
	
	<script>
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>