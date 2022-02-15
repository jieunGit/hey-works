<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
	<style>
	.outer{
		width:1200px;
		height:1200px;
		margin:auto;
	}
	.outer>div{float:left;}
	
	#detail{
	    width: 950px;
	   height:100%;
	   display:inline-block;
	   border: 1px solid lightgray;
   }
	#toparea{
	   width: 200px;
	   height: 50px;
	   margin-left: 30px;
	   font-weight: bolder;
   }
 	#resourceContent{
 		width:900px;
 		height:120px;
 		margin-left: 30px;
 		
		background-color: rgba(211, 211, 211, 0.233);
 	
 	}

	 #resourceImg{
		 width: 120px;
		 height: 120px;
		 border: 1px solid red;
		 display:inline-block;
	 }
	 #content{
		 display: inline-block;
		 text-align: center;
		 width: 700px;
		 height: 120px;
		 margin-left: 20px;
		 font-size: 13px;
		 
	 }
	 #datearea{
		width: 900px;		
		 margin-left: 30px;
		 font-size: 18px;
		 font-weight: bolder;
		 text-align: center;
		 
	 }
	 #reserve{
		width: 940px;
		 margin-left: 4px;
	 }

	 table th{
		 width: 30px;
		 height: 30px;
		 font-size: 6px;

	 }
	</style>
</head>
<body>
	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
	
		<div id="detail">
			<br>
			<div id="toparea"><span>${rc.categoryName} 예약</span></div>
			
			
			<div id="resourceContent">
				<div id=resourceImg>이미지</div>
				<div id="content">
					
					${rc.categoryContent}
				</div>

			</div>
			<br><br>

			<div id="resourceList">

				<a href="" style="color: black">회의실1</a>&nbsp;&nbsp;
                <a href="" style="color: black;">회의실2</a>

			</div>

			<div class="line"></div>
			<br>


			<div id="datearea">
				<i class="fas fa-angle-left"></i>
				<span> 2020-01-20(목) </span>
				<i class="fas fa-angle-right"></i></span>
			</div>
			<br>
			<div id="reserve">
				<table class="table table-bordered">
					<thead style="background: lightgrey;"> 
					  <tr>
						<th style="width: 100px;" ></th>
						<th>7:00</th>
						<th>8:00</th>
						<th>9:00</th>
						<th>10:00</th>
						<th>11:00</th>
						<th>12:00</th>
						<th>13:00</th>
						<th>14:00</th>
						<th>15:00</th>
						<th>16:00</th>
						<th>17:00</th>
						<th>18:00</th>
						<th>19:00</th>
						<th>20:00</th>
						<th>21:00</th>
						<th>22:00</th>
						<th>23:00</th>
						
					  </tr>
					</thead>
					<tbody>
					  <tr>
						<td style="font-size: 12px; text-align: center;">회의실1</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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
					  <tr>
						<td style="font-size: 12px;">회의실2</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
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
			
		</div>
		
	
	</div>
	
	
	
</body>
</html>