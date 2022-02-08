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
       border: 1px solid lightgray;
   }



</style>
</head>
<body>

    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../address/addressMenubar.jsp" />
		
		
		<div id="detail">
        </div>

    </div>


</body>
</html>