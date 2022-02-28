<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .sidebar li:hover {
        cursor: pointer;
        background-color: rgba(24, 121, 201, 0.2);
    }
    .goUserBtn {
        padding: 550px 10px 20px 10px;
    }
</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 인사관리</i>
        </div>
        <ul>
            <li><i class="fa-solid fa-user-gear" style='font-size:20px'><a href="admin.organ">임직원관리</a></i></li>
            <li><i class="fa-solid fa-sitemap" style='font-size:20px'><a>조직도관리</a></i></li>
        </ul>

        <div class="goUserBtn">
            <button id="goUser" type="button" class="btn btn-success" style="height: 40px;">사용자모드로 변경</button>
        </div>
    </div>

</body>
</html>