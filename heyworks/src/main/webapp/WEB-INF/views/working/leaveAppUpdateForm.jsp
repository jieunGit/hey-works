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
        margin-left:35px;
    }
    .table-bordered th{
        height:40px;
		text-align:center;
		font-size:15px;
		background: rgba(211, 211, 211, 0.336);
    }
    .table-bordered td{
        padding-left:7px;
		font-size:14px;
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
				
				<div class="leave-btn">
					<button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
					
					<c:if test="${l.status eq '대기' }">
						<a href="deleteApplyLeave.wo?leaveAno=${ l.leaveAno }" class="btn btn-danger" style="margin-top:7px; margin-left:770px;">삭제</a>
					</c:if>
				</div>
				<br>
		
				<!--휴가신청서 내용-->
				<div class="leave-content" style="border:1px solid #cfcfcfd7;"><br>
					
					<h3 align="center" class="title-box">휴가 신청서</h3>
					<br><br>
					<table class="table-bordered">
						<tr>
							<th width="130">신청자</th>
							<td width="300">${loginUser.userName}</td>
						</tr>
						<tr>
							<th>소속</th>
							<td>${loginUser.deptName}</td>
						</tr>
						<tr>
							<th>직급</th>
							<td>${l.jobName}</td>
						</tr>
						<tr>
							<th>신청일</th>
							<td>${l.applyDate}</td>
						</tr>
					</table>
					<br><br>
		
					<table class="table-bordered">
						<tr>
							<th width="130">*구분</th>
							<td width="710">${l.leaveType}</td>
						</tr>
						<tr>
							<th>*휴가기간</th>
							<td>
								 ${l.startDate} ~ ${l.endDate}
								
							</td>
						</tr>
						<tr>
							<th>신청일수</th>
							<td id="leaveUse" readonly style="font-weight:500">
								${l.leaveUse}
							</td>
						</tr>

						<tr>
							<th>*사유</th>
							<td style="height:200px;">							
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