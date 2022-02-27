<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
    .sidebar .calendar  {
        padding: 11px 0px 11px 10px;
        font-size:15px;
        
    }
</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 일정</i>
        </div>
                <ul>
                        <li class="dept"><p class="deptCode" style="display:none;"></p><a>내 일정</a></li>
                </ul>   
                <ul>
                        <li class="dept"><p class="deptCode" style="display:none;"></p><a>팀 일정</a></li>
                </ul>         
    </div>   
	  

    
    
    

</body>
</html>