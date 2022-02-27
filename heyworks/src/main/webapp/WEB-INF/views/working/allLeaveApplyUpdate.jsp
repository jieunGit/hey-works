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
			<form action="updateApplyLeave.wo" method="post">
		
				<input type="hidden" name="leaveAno" value="${l.leaveAno}">
				
				<div class="leave-btn">
					<button type="submit" class="btn btn-primary">승인</button>
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
				</div>
				<br>
		
				<!--휴가신청서 내용-->
				<div class="leave-content" style="border:1px solid lightgrey;"><br>
					
					<h3 align="center">휴가 상세</h3>
					<br><br>
					<table class="table-bordered">
						<tr>
							<th width="130">신청자</th>
							<td width="650">${l.userName}</td>
						</tr>
						<tr>
							<th>소속</th>
							<td>${l.deptName}</td>
						</tr>
						<tr>
							<th>직급</th>
							<td>${l.jobName}</td>
						</tr>
						<tr>
							<th>신청일</th>
							<td>${l.applyDate}</td>
						</tr>
						<tr>
							<th>구분</th>
							<td>${l.leaveType}</td>
						</tr>
						<tr>
							<th>휴가기간</th>
							<td>
								 ${l.startDate} ~ ${l.endDate}
							</td>
						</tr>
						<tr>
							<th>신청일수</th>
							<td> ${l.leaveUse} </td>
						</tr>
						<tr>
							<th>사유</th>
							<td style="height:100px;">
								
									${l.reason}
								
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>

    </div>
</body>
</html>