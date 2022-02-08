<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	  
	   width: 900px;
	   height:100%;
	   display:inline-block;
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
					<tbody>
						<tr>
							<td>회의실</td>
							<td>회의실1</td>
							<td>2022-01-20 09:10~2022-01-20 13:10</td>
							<td>수정|상태</td>
						</tr>
						<tr>
							<td>차량</td>
							<td>셀토스</td>
							<td>2022-01-20 09:10~2022-01-20 13:10</td>
							<td>수정|상태</td>
						</tr>
					
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	

	
</body>
</html>