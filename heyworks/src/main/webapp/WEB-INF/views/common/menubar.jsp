<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face {
    font-family: 'KoPubDotumMedium';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/KoPubDotumMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
    * {
      font-family: 'KoPubDotumMedium';
    }
    #header{
        width: 1200px;
        height: 50px;
        margin-top: 20px;
        border: 1px solid lightgray;
        margin:auto;
    }
    #header>div{float: left; height: 100%;}
    #logo{width: 252px;}
    #main{width: 800px;}
    #main *{float: left;}
    #main img{
        margin-top: 15px;
        width: 25px;
        height: 25px;
    }
    #main p{
        margin-top: 10px;
        margin-left: 10px;
        font-size: 24px;
        font-weight: 700;
        color: black;
    }
    #icon{width: 145px;}
    #icon *{float: left;}
    #icon>a{
        width: 50%;
        height: 100%;
    }
    #icon img{
        width: 30px;
        height: 30px;
        margin-top: 10px;
        margin-left: 30px;
    }
    #sidebar{
        width: 70px;
        height: 800px; 
        margin:auto;      
    }
    #sidebar>div{float: left; height: 100%;}
    #mini{
        width: 70px;
        background-color: rgb(63, 145, 213)
    }
    #mini>ul{padding: 0px;}
    #mini li{
        width: 100%;
        height: 65px;
        list-style-type: none;
        padding: 0px;
        margin: 0px;
    }
    #mini img{
        width: 100%;
        height: 100%;
        padding: 18px;        
    }
    
    #logout{
    position: relative;
     width: 100%;
        height: 65px;
        list-style-type: none;
        top:130px;       
    }      
     #logout img{
    	width: 100%;
        height: 100%;
        padding: 13px;  
    }
   
    
 	#profile{
		border-radius:100%; 	
 	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<!-- alert -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>


	<div id="header">
        <div id="logo">
            <a href="main.do">
                <img src="resources/images/LOGO.JPG" width="180px" height="35px" style="margin-left:20px; margin-top: 10px;">
            </a>
        </div>
        <div id="main">
            <a href="">
                <img src="resources/images/dots.png">
                <p>MAIN</p>
            </a>
        </div>
        <div id="icon">
            <a href="list.inMsg">
                <img src="resources/images/miniletter.png" id="letter">
            </a>
            <a href="myPage.em">
                <img src="${ emp.image }" id="profile">
            </a>
        </div>
    </div>

    <div id="sidebar">
        <div id="mini">
            <ul>
                <li><a href="">
                    <img src="resources/images/letter.png">
                </a></li>
                <li><a href="main.wo">
                    <img src="resources/images/bag.png">
                </a></li>
                <li id="approval"><a href="main.el">
                    <img src="resources/images/approval.png">
                </a></li>
                <li><a href="">
                    <img src="resources/images/board.png">
                </a></li>
                <li><a href="myCalendar.ca">
                    <img src="resources/images/calendar.png">
                </a></li>
                
                <li>
                	<div id="todoplus">
                		<a href="todolist.to"> <img src="resources/images/todo.png"></a>
                	</div>
                </li>
                
                	
                <li>
                	<div id="reservation">
                	<a href="myReserve.re"> <img src="resources/images/key.png"></a>
                    </div>
                </li>
                
                <li>
                	<div id="addressbook">
               		 <a href="likeAddress.ad"><img src="resources/images/addressbook.png"></a>
                    </div>
                </li>
                <li><a href="list.organ">
                    <img src="resources/images/coperation.png">
                </a></li>         
                
                </ul>
            
            <div id="logout">
                <a href="logout.em">
                    <img src="resources/images/logout1.png">
                </a>
            </div>
        </div>
       
    </div>

</body>
</html>