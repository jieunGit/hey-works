<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<style>
.outer{
		width:1200px;
		height:1200px;
		margin:auto;
		
	}
.outer>div{float:left;}
	
#center{
	   width: 950px;
	   height:100%;
	   display:inline-block;
	   border: 1px solid lightgray;
	  
   }
#toparea{
	   width: 500px;
	   height: 50px;
	  
	   margin-left: 50px;
	   font-weight: bolder;
}

a.btnAdditional {
	width: 67px;
	height: 32px;
	color: #333;
	font-size: 13px;
	margin: 0 4px 0 0;
	padding: 0 8px;
	cursor: pointer;
}
.search-box{
	margin-right: 20px;
	float: right;
	position: relative;

}
.search-box i{
	color: #a0a5b1;
    position: absolute;
    font-size: 19px;
    top: 8px;
    left: 10px;
}
.search-box input {
    height: 30px;
    border-radius: 20px;
    padding-left: 35px;
    border-color: #ddd;
    box-shadow: none;
}
.addresstable th{
	font-size: 14px;
}
.addresstable td{
	font-size: 13px;
}

#footer{
	width: 800px;
	margin-left:40px;
}
#footer a{
	color: black;
	font-size: 13px;
}
  #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

    
    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../address/addressMenubar.jsp" />
		
		
		<div id="center" style=" display:inline">

            <br>
			<!-- 제목영역 -->
			<div id="toparea">
				<span>삭제된 주소록</span>
				<span style="font-size: 11px; color: grey;"> in 삭제된주소록 전체 ${listCount}개</span>
			</div>
			<br>


            <!-- 검색영역 -->
			<div class="search-box">
				<i class="fa-solid fa-magnifying-glass"></i>
				<input type="text" class="form-control" placeholder="Search…">
			</div>
			
			<!-- 테이블영역 정렬기능구현! -->
			<div class="container" style="width: 900px;">
				
				<table class="table addresstable">
				<thead>
					<tr>
					
						<th width=10px; ><input type="checkbox"></th>
						<th width=80px;>이름</th>
						<th width=150px;>전화번호</th>
						<th width=150px;>이메일</th>
						<th width=100px;>회사명</th>
						<th width=70px;>부서</th>
						<th width=70px;>직위</th>
						<th width=70px;>그룹</th>
						<th width=70px;></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="d" items="${ dlist }">
					<tr>
						
						<td><input type="checkbox"></td>
						<td>${d.addressName }</td>
						<td>${d.addressPhone }</td>
						<td>${d.addressEmail }</td>
						<td>${d.companyName }</td>
						<td>${d.deptTitle }</td>
						<td>${d.jobTitle }</td>
						<td>${d.groupName }</td>
						<td><!-- 상세보기 -->
                            <a href=""  data-toggle="modal" data-target="#addressDetail"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>
                        </td>
					</tr>
				</c:forEach>
			
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</tbody>
				</table>
			</div>
		
				
				<!-- footer부분 -->
			<div id="footer">
					<a href="">영구삭제</a> |
					<a href="">복구</a> |
		
			</div>

			
				<div id="pagingArea">
				<ul class="pagination pagination-sm">

					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link "
								href="#"><i class="fa-solid fa-angles-left"></i> </a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="deleteAdList.ad?cpage=${ pi.currentPage-1 }"><i
									class="fa-solid fa-angles-right"></i></a></li>
						</c:otherwise>
					</c:choose>


					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item"><a class="page-link"
							href="deleteAdList.ad?cpage=${ p }">${ p }</a></li>
					</c:forEach>


					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#"><i
									class="fa-solid fa-angles-right"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="deleteAdList.ad?cpage=${ pi.currentPage+1 }"><i
									class="fa-solid fa-angles-right"></i></a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			
		
			
			
			
				
			
			
        </div>

    

        </div>

    </div>
    
</body>
</html>