<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#mainView{
		margin: auto;
        margin-top:20px;
        width: 1100px;
        height: 900px;
        margin-left:20px;
	}
	#mainView>div{
		float: left; 
		border: 3px solid rgba(24, 121, 201, 0.11);
		
	}
	#employee, #mail, #elec-approval, #book{
		width: 270px;
		height: 330px;
	}
	#tna, #todo{
		width: 270px;
		height: 450px;
	}
	#calendar{
		width: 540px;
		height: 450px;
	}
	#mail, #calendar{margin-left:20px;}
	#profile{
		width: 180px;
		height: 180px;
		margin: auto;
		margin-top: 40px;
		border-radius: 100%;
		border: 1px solid lightgray;	
	}
	#name{
		width: 100%;
		text-align: center;
		margin-top: 10px;
	}
	#name>h5{font-weight: 700;}
	#name>p{color: gray;}
	.title{
		padding: 10px;
		font-weight: 700;
	}
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="common/menubar.jsp" />
		
		<div id="mainView">
			<div id="employee">
				<div id="profile">

				</div>
				<div id="name">
					<h5>강동원 팀장</h5>
					<p>삼조전자 인사팀</p>
				</div>
			</div>
			<div id="mail">
				<div class="title">
					새로온 메일()
					<hr>
				</div>
				<div>

				</div>
			</div>
			<div id="elec-approval">
				<div class="title">
					결재예정문서()
					<hr>
				</div>
				<div>

				</div>
			</div>
			<div id="book">
				<div class="title">
					예약바로가기
					<hr>
				</div>
				<div>

				</div>
			</div>
			<div id="tna">
				<div class="title">
					근태관리
					<hr>
				</div>
				<div>

				</div>
			</div>
			<div id="calendar">
				<div class="title">
					2022년 02월
					<hr>
				</div>
				<div>

				</div>
			</div>
			<div id="todo">
				<div class="title">
					to do list
					<hr>
				</div>
				<div>

				</div>
			</div>
		</div>
		
		
	</div>

	<a href="main.el">전자결재메인</a>
	

</body>
</html>