<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    	margin-bottom:5px;
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
    .sidebar button{
    	width:"100%";
    	heigth:100%;
    	border:none;
    	text-align:left;
    	background-color:white;
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
            <li id="write"><a href="approvalFrom.el" style="color: white;">작성하기</a></li>
            <li class="side-list"><img src="resources/images/3759325.png">자주쓰는양식
                <ul>
                    <li><a href="bdEnrollForm.el">업무기안서</a></li>
                    <li><a href="ebEnrollForm.el">비품구매품의서</a></li>
                </ul>
            </li>
            <li class="side-list"><img src="resources/images/3759325.png">내 결재함
                <ul>
                    <li><a href="standby.el">결재대기</a></li>
                    <li><a href="readNref.el">&nbsp;참조/열람대기</a></li>
                    <li><a href="doneConf.el">&nbsp;승인결재문서</a></li>
                </ul>
            </li>
            <li class="side-list"><img src="resources/images/3759325.png">진행중인문서
                <ul>
                	<li><button type="button" class="onsidebtn" value="A">전체</button></li>
                    <li><button type="button" class="onsidebtn" value="D">결재대기</button></li>
                    <li><button type="button" class="onsidebtn" value="P">진행중</button></li>
                </ul>
            </li>
            <li class="side-list"><img src="resources/images/3759325.png">완료된문서
                <ul>
                    <li><button type="button" class="onsidebtn" value="Y">결재완료문서</button></li>
                    <li><button type="button" class="onsidebtn" value="R">반려문서</button></li>
                    <li><button type="button" class="onsidebtn" value="T">임시저장</button></li>
                </ul>
            </li>
            <c:if test="${loginUser.adminYn eq 'Y'}">
	            <li class="side-list"><img src="resources/images/3759325.png">관리자 설정
	                <ul>
	                    <li><a href="deletelist.el">삭제된문서</a></li>
	                    <li><a href="approvalad.el">&nbsp;전자결재관리자</a></li>
	                </ul>
	            </li>
            </c:if>
        </ul>
    </div>
    
    <script>
   		$(".onsidebtn").click(function(){
   			
   			const value = $(this).val();
   			
   			if(value == 'D' || value == 'P' || value == 'A'){
   				location.href="onlist.el?status=" + value;
   			}else{
   				location.href="endlist.el?status=" + value;
   			}
   			
   			console.log(value);
   			
   		});

    </script>

</body>
</html>