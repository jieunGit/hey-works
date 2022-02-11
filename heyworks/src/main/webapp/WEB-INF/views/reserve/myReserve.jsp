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
	
	

   #detail{
		width: 950px;
	   height:800px;
	   display:inline-block;
	   border: 1px solid lightgray;
   }


   #toparea{
	   width: 200px;
	   height: 50px;
	  
	   margin-left: 50px;
	   font-weight: bolder;
   }
   .thead-dark th{
		font-size: 12px;
   }
   
   table>tbody>tr{
	   font-size: 12px;
	   text-align: center;
   }
  #pagingArea{width:fit-content;margin:auto;}

</style>
</head>
<body>

	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
		
		

		<div id="detail">
			<br>
			<div id="toparea"><span>나의예약목록</span></div>
			<br>
			<div class="container">
				<table class="table" style="width: 800px; margin-left: 40px;">
					<thead class="thead-dark" style="text-align: center;">
						<tr>
							<th width="150px">분류</th>
							<th width="150px"> 자원명</th>
							<th width="300px"> 예약시간</th>
							<th width="200px">상태</th>
						</tr>
					</thead>

					<!-- ajax로 상세보기, 예약취소 구현 -->
					<tbody>
					<c:forEach var="r" items="${ list }">
						<tr>
							<td>${ r.categoryName }</td>
							<td>${ r.resourceName }</td>
							<td>${ r.startDate }~${ r.endDate }</td>
							<td>상세보기|취소</td>
						</tr>
					</c:forEach>
					
						
					
					</tbody>
				</table>
			</div><br><br>

			<div id="pagingArea">
                <ul class="pagination pagination-sm">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link " href="#"><i class="fa-solid fa-angles-left"></i> </a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage-1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage+1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
           





		</div>
	
	</div>
	

	
</body>
</html>