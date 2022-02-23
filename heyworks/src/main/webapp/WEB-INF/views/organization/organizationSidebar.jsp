<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도</title>
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
    .sidebar ul{padding: 0px;}
    .sidebar a{
        padding-left: 15px;
        text-decoration: none;
        color: black;
    }
    .sidebar li {
        margin-top:10px;
        margin-bottom: 5px;
    }
    .sidebar .depts>li{
       padding: 11px 0px 11px 30px;
    }
    .sidebar .depts>li:hover {
        cursor: pointer;
        background-color: rgba(24, 121, 201, 0.2);
    }
    .sidebar .samjo  {
        padding: 11px 0px 11px 10px;
        font-size:17px;
        
    }
</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 조직도</i>
        </div>
        <ul>
            <li><a href="list.organ" class="samjo"><i class="fa-solid fa-sitemap"> &nbsp;SAMJO</i></a>
                <ul class="depts">
                    <c:forEach var="d" items="${ dept }">
                        <li class="dept"><p class="deptCode" style="display:none;">${ d.deptCode }</p><a>${ d.deptName }</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
    </div>
    
    <!-- 부서 선택시 부서코드 넘기며 url이동 -->
    <script>
    	$(function(){
    		$(".dept").click(function(){
    			//console.log($(this).children().prev(".deptCode").text());
    			location.href = 'detail.organ?dno=' + $(this).children().prev(".deptCode").text();
    		})
    	})
    </script>
    
	  

    
    
    

</body>
</html>