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
	

   #menubar{
  	 border: 1px solid lightgray;
	 width: 180px;
	 height: 800px;
	 display:inline-block;
   }

   #menubar>p {
	   font-weight: 1000;
	   font-size: 16px;
	   margin: 10px 0px 0px 30px;
   }
   .btn-primary{
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
</style>
</head>
<body>

	
		
		 <div id="menubar">
            <p><i class="fas fa-angle-double-right"></i> 예약</p>
			<button type="button" class="btn btn-primary">+예약하기</button>
			<br><br>
			<i class="fas fa-cog" style= "margin-left: 20px;"></i> 
			<span style="font-weight: bold; font-size: 13px;">나의 예약 목록</span><br><br>
			
			<!-- 자원카테고리불러오기 -->
			<ul id="resources">
				<li><i href="" class="fas fa-history"></i> 회의실</li> <br>
				<li><i href=""  lass="fas fa-history"></i> 차량</li>	<br>
				<li><i href="" class="fas fa-history"></i> 비품</li>
			</ul>
        </div>
		 
	

</body>
</html>