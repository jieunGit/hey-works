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

	/*근태관리 버튼*/
	.in-btn, .out-btn{
		width:110px;
        height:42px;
        border-radius:20px;
        border:none;
        background:rgb(63, 145, 213);
        color:white;
        font-size:17px;
        font-weight:500;
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
				<div class="tna-content" align="center">
					<p id="live-date" class="live-date" style="font-size:22px;"></p>
					<strong id="live-time" class="live-time" style="font-size:35px;"></strong><br><br>
					<br>
					<table class="click-time">
						<tr>
							<th style="font-size:15px; border:none;">출근시간</th>
							<td class="click-td" id="click-td1" style="text-align:right;" width="120px"></td>
						</tr>
						<tr>
							<th style="font-size:15px; border:none;">퇴근시간</th>
							<td class="click-td" id="click-td2" style="text-align:right;" width="120px"></td>
						</tr>
					</table>
					<hr style="margin:10px;"><br>
					
					<button class="in-btn" id="in-btn" style="margin-right:15px;">출근</button> 
					<button class="out-btn" id="out-btn">퇴근</button><br>
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

	
	<script>
		// 근태관리 - 실시간 날짜, 시간 
		function setClock(){
			var dateInfo = new Date(); 
			var hour = modifyNumber(dateInfo.getHours());
			var min = modifyNumber(dateInfo.getMinutes());
			var sec = modifyNumber(dateInfo.getSeconds());
			var year = dateInfo.getFullYear();
			var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해줌
			var date = dateInfo.getDate();
			document.getElementById("live-time").innerHTML = hour + ":" + min + ":" + sec;
			document.getElementById("live-date").innerHTML = year + "년 " + month + "월 " + date + "일";
		}
		function modifyNumber(time){
			if(parseInt(time)<10){
				return "0"+ time;
			}
			else
				return time;
		}
		window.onload = function(){
			setClock();
			setInterval(setClock,1000); //1초마다 setClock 함수 실행
		}

		// 근태관리 -출퇴근 버튼 클릭시 이벤트
		document.getElementById("in-btn").onclick = function(i){

			// 출근버튼 비활성화, 출근 alert
			i.target.style.backgroundColor = "lightgrey";
			alert("출근하였습니다.");
			i.target.disabled = true;
			// 출근시간 옆에 누른 시간 찍힘
			let t = new Date().toTimeString().split(" ")[0];
			document.getElementById("click-td1").innerHTML = t;

			// 출근시간 insert 
			$.ajax({
			url:"clockin.wo",
			success:function(result){
			console.log("통신 성공");
			},error:function(){
				console.log("출근 인서트 ajax 통신 실패");
			}
		  })

		}

		document.getElementById("out-btn").onclick = function(e){

			if(confirm("정말 퇴근하시겠습니까?") == true){

				e.target.style.backgroundColor = "lightgrey";
				e.target.disabled = true;

				let t = new Date().toTimeString().split(" ")[0];

				document.getElementById("click-td2").innerHTML = t;

				// 퇴근시간 update
				$.ajax({
				url:"clockout.wo",
				success:function(result){
					console.log("통신 성공");
				},error:function(){
					console.log("퇴근 업데이트 ajax 통신 실패");
				}
			  })
			
			}else{
				return false;
			}
		}
	</script>

</body>
</html>