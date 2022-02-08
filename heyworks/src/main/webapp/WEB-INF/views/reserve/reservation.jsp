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
 	#resourceContent{
 		width:900px;
 		height:120px;
 		margin-left: 50px;
 		
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
		 border: 1px solid red;
		 margin-left: 20px;
		 font-size: 13px;
		 
	 }
	</style>
</head>
<body>
	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
	
		<div id="detail">
			<br>
			<div id="toparea"><span>회의실 예약</span></div>
			
			
			<div id="resourceContent">
				<div id=resourceImg>이미지</div>
				<div id="content">삼조전자 본사 1층에 위치한 회의실 안내도입니다. 위치를 참조하여 예약 후 이용바랍니다.</div>

			</div>
		
		</div>
		
		
		
	</div>
	
</body>
</html>