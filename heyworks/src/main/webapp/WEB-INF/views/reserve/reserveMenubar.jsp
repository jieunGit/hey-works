<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script> -->
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<style>
	

   #menubar{
  	 border: 1px solid lightgray;
	 width: 180px;
	 height: 800px;
	 display:inline-block;
	 position: relative;
   }

   #menubar>p {
	   font-weight: 1000;
	   font-size: 16px;
	   margin: 10px 0px 0px 30px;
   }
  #reservebtn{
	    width: 150px;
		height: 40px;
		margin: 10px 0px 0px 15px;
	}
	
	 #resources{
	list-style-type :none;
	
   }
   #resources>li{
	   font-size: 13px;
	   font-weight: bold;
	  
   }
   #resources a{
	 color: black;
   }
   #adminSetting{
	  float:unset;
	  position: absolute;
	  left:0;
	  bottom: 0px;
	  margin: 0px 0px 20px 40px;
   }
</style>
</head>
<body>

	
		
		 <div id="menubar">
            <p><i class="fas fa-angle-double-right"></i> 예약</p>
			<button type="button" class="btn btn-primary" id="reservebtn">+예약하기</button>
			<br><br>
			<a href="" style="color: black;">
			<i class="fas fa-cog" style= "margin-left: 20px;"></i> 
			<span style="font-weight: bold; font-size: 13px;">나의 예약 목록</span><br><br></a>
			
			<!-- 자원카테고리불러오기 -->
			<ul id="resources">
				<li><a href=""><i class="fas fa-history"></i> 회의실</li></a> <br>
				<li><a href=""><i class="fas fa-history"></i> 차량</li></a>	<br>
				<li><a href=""><i class="fas fa-history"></i> 비품</a></li>
			</ul>


			<!-- 관리자만 보일수있게 -->
			<div id="adminSetting">
				<a href="" style="color: black;"><i class="fa-solid fa-gear"></i> 자원관리</a>
			</div>
        </div>
		 
	

</body>
</html>