<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.applyForm-outer{
	   width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
	}
	.title-box{font-size:23px; font-weight:600;}
    .leave-content{
        height:700px;
    }
    .table-bordered{
        margin-left:60px;
    }
    .table-bordered th{
        height:40px;
		text-align:center;
		font-size:14px;
    }
    .table-bordered td{
        padding-left:7px;
		font-size:13px;
    }
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
		<jsp:include page="workingSidebar.jsp"/>
        <br><br>

		<div class="applyForm-outer">
			<form action="insertLeave.wo" method="post">
		
				<input type="hidden" name="userNo" value="${loginUser.userNo}">
				
				<!--휴가신청 버튼-->
				<div class="leave-btn">
					<button type="submit" class="btn btn-primary">승인요청</button>
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
				</div>
				<br>
		
				<!--휴가신청서 내용-->
				<div class="leave-content" style="border:1px solid lightgrey;"><br>
					
					<h3 align="center" class="title-box">휴가 신청</h3>
					<br><br>
					<table class="table-bordered">
						<tr>
							<th width="130">신청자</th>
							<td width="280">${loginUser.userName}</td>
						</tr>
						<tr>
							<th>소속</th>
							<td>${loginUser.deptName}</td>
						</tr>
						<tr>
							<th>신청일</th>
							<td id="sysdate"></td>
						</tr>
					</table>
					<br><br>

					<!--신청일 : 오늘날짜-->
					<script>
						let today = new Date();

						let year = today.getFullYear();
						let month = today.getMonth() + 1;
						let date = today.getDate();

						month = month >= 10 ? month : '0' + month;
						date = date >= 10 ? date : '0' + date;

						document.getElementById("sysdate").innerHTML = year + "-" + month + "-" + date;
					</script>
		
					<table class="table-bordered">
						<tr>
							<th width="130">*구분</th>
							<td width="650">
								<input type="radio" id="day" name="leaveType" value="연차" checked>
								<label for="day">연차</label>
		
								<input type="radio" id="event" name="leaveType" value="경조">
								<label for="event">경조</label>
		
								<input type="radio" id="sick" name="leaveType" value="병가">
								<label for="sick">병가</label>

								<input type="radio" id="baby" name="leaveType" value="출산휴가">
								<label for="baby">출산휴가</label>
							</td>
						</tr>
						<tr>
							<th>*휴가기간</th>
							<td>
								<input type="date" name="startDate" id="startDate" onchange="datechange()"> ~
								<input type="date" name="endDate" id="endDate" onchange="datechange()">
							</td>
						</tr>
						<tr>
							<th>신청일수</th>
							<td id="leaveUse" readonly></td>
						</tr>
						<input type="hidden" name="leaveUse" id="useDay">

						<script>
							function datechange(){

									var startDate = document.getElementById("startDate").value;
									var startDate_arr = startDate.split("-");
								
									var endDate = document.getElementById("endDate").value;
									var endDate_arr = endDate.split("-");

									if(startDate != 0 && endDate != 0){
										var stDate = new Date(startDate_arr[0], startDate_arr[1]-1, startDate_arr[2]);
										var enDate = new Date(endDate_arr[0], endDate_arr[1]-1, endDate_arr[2]);

										var diffDay = (enDate.getTime() - stDate.getTime())/1000/60/60/24 + 1;
								
										document.getElementById("leaveUse").innerHTML = diffDay; // 화면에 뿌려지는 신청일수
										document.getElementById("useDay").value = diffDay; // 휴가테이블에 insert하는 신청일수 
									}else{
										document.getElementById("leaveUse").innerHTML = 0;
									}								
							}
						</script>

						<tr>
							<th>*사유</th>
							<td style="height:100px;">
								<textarea name="reason" cols="100" rows="12" style="resize:none; border:none;" required></textarea>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>

    </div>
</body>
</html>