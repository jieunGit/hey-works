<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .sidebar ul{padding: 15px;}
    .sidebar img{
    	width:15px;
    	height:15px;
    }
    .sidebar a{
        text-decoration: none;
        color: black;
    }
    .sidebar li{
        margin-bottom: 5px;
    }
    #write{
        width: 150px;
        height: 35px;
        text-align: center;
        line-height: 35px;
        font-size: 15px;
        color: white;
        background-color: rgb(24, 121, 201);
        border-radius: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
</style>
</head>
<body>

    <div class="sidebar">
        <ul>
            <li style="font-size: 22px; font-weight: 700;">
                <img src="resources/images/2722998.png" style="width: 40px; height: 40px;">
                전자결재
            </li>
            <li id="write"><a href="" style="color: white;">작성하기</a></li>
            <li><img src="resources/images/3759325.png">자주쓰는양식
                <ul>
                    <li><a href="">업무기안서</a></li>
                    <li><a href="">비품구매품의서</a></li>
                </ul>
            </li>
            <li><img src="resources/images/3759325.png">진행중인문서
                <ul>
                    <li><a href="">전체</a></li>
                    <li><a href="">결재대기</a></li>
                    <li><a href="">결재예정</a></li>
                    <li><a href="">참조/열람대기</a></li>
                </ul>
            </li>
            <li><img src="resources/images/3759325.png">문서함
                <ul>
                    <li><a href="">전체</a></li>
                    <li><a href="">내 기안함</a></li>
                    <li><a href="">결재완료문서</a></li>
                    <li><a href="">참조/열람문서</a></li>
                    <li><a href="">반려된문서</a></li>
                    <li><a href="">임시저장</a></li>
                </ul>
            </li>
            <li><img src="resources/images/3759325.png">관리자 설정
                <ul>
                    <li><a href="">삭제된문서</a></li>
                    <li><a href="">전자결재관리자</a></li>
                </ul>
            </li>
        </ul>
    </div>

</body>
</html>