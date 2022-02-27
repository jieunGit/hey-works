<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>

<style>
    .sidebar{
        width: 180px;
        height: 800px;
        border: 1px solid lightgray;
    }
    .sidebar *{
        width: 100%;
        list-style-type: none;
    }
    .title {
        padding-top: 12px;
        margin: 20px 0px 10px 15px;
        width: 100%;
        height: 50px;
    }
    .sidebar ul { padding: 0px; }
    .sidebar a{
        padding-left: 15px;
        text-decoration: none;
        font-size: 17px;
        font-weight: 540;
        color: rgb(99, 100, 100);
    }
    .sidebar li{
        padding: 13px 0px 13px 15px;
    }
    li:hover {
        cursor: pointer;
        background-color: rgba(24, 121, 201, 0.2);
    }
    .sidebar button {
    	text-align: center;
    	width: 80%;
    	height: 35px;
    	margin: 5px 0px 13px 0px;
    }

</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 쪽지함</i>
        </div>
        <div align="center">
        	<button type="button" id="goWrite" class="btn btn-primary">쪽지쓰기</button>
        </div>
        <ul>
            <li><i class="fa-solid fa-arrow-right-to-bracket" style='font-size:20px'><a href="list.inMsg">받은쪽지함</a></i></li>
            <li><i class="fa-solid fa-arrow-right-from-bracket" style='font-size:20px'><a href="list.outMsg">보낸쪽지함</a></i></li>
            <li><i class="fa-solid fa-layer-group" style='font-size:20px'><a href="list.keepMsg">보관함</a></i></li>
            <li><i class="fa-solid fa-trash-can" style='font-size:20px'><a href="list.delMsg">휴지통</a></i></li>
        </ul>
    </div>
    
    <!-- 쪽지작성 넘어가기 -->
    <script>
    	$(function(){
    		$("#goWrite").click(function(){
    			console.log("클릭");
    			location.href="insert.form";
    		})
    	})
    </script>

</body>
</html>