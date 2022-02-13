<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .sidebar ul{padding: 15px;}
    .sidebar a{
        padding-left: 15px;
        text-decoration: none;
        color: black;
    }
    .sidebar li{
        margin-bottom: 10px;
    }
</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 조직도</i>
        </div>
        <ul>
            <li><i class="fa-solid fa-sitemap" style='font-size:15px'> &nbsp;SAMJO</i>
                <ul>
                    <li><a href="">개발팀</a></li>
                    <li><a href="">인사팀</a></li>
                    <li><a href="">회개팀</a></li>
                    <li><a href="">회개팀</a></li>
                    <li><a href="">경영팀</a></li>
                </ul>
            </li>
        </ul>
    </div>

</body>
</html>