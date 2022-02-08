<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
            <p>>> 예약</p>
			<button type="button" class="btn btn-primary">+예약하기</button>
			<br><br>
			<i class="fas fa-star" style="color:rgb(247, 247, 63);  margin-left: 20px;"></i> 
			<span style="font-weight: bold; font-size: 13px;">나의 예약 목록</span><br><br>
			
			
			<ul id="resources">
				<li><i class="fas fa-history"></i> 회의실</li> <br>
				<li><i class="fas fa-history"></i> 차량</li>	<br>
				<li><i class="fas fa-history"></i> 비품</li>
			</ul>
        </div>
		 
	

</body>
</html>