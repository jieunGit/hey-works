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
    li:hover {
        cursor: pointer;
        background-color: rgba(24, 121, 201, 0.2);
    }

</style>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 쪽지함</i>
        </div>
        <ul>
            <li><i class="fa-solid fa-arrow-right-to-bracket" style='font-size:20px'><a>받은쪽지함</a></i></li>
            <li><i class="fa-solid fa-arrow-right-from-bracket" style='font-size:20px'><a>보낸쪽지함</a></i></li>
            <li><i class="fa-solid fa-layer-group" style='font-size:20px'><a>보관함</a></i></li>
            <li><i class="fa-solid fa-trash-can" style='font-size:20px'><a>휴지통</a></i></li>
        </ul>
    </div>

</body>
</html>