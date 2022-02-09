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
					<tr>
						
						<td><input type="checkbox"></td>
						<td>김부장</td>
						<td>010-1111-2222</td>
						<td>kkkk@naver.com</td>
						<td>카카오</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>거래처</td>
						<td><!-- 상세보기 -->
                            <a href=""  data-toggle="modal" data-target="#addressDetail"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>
                        </td>
					</tr>
					<tr>
						
						<td><input type="checkbox"></td>
						<td>김부장</td>
						<td>010-1111-2222</td>
						<td>kkkk@naver.com</td>
						<td>카카오</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>거래처</td>
						<td><!-- 상세보기 -->
                            <a href=""  data-toggle="modal" data-target="#addressDetail"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>
                        </td>
					</tr>
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

			
				
			
			
        </div>

    

        </div>

    </div>
    
</body>
</html>