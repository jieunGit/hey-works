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
	.status-outer{
	   width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
	}
    .year-select{font-size:18px; font-weight:500;}
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="status-outer">
    
            <div class="year-select" align="left">
                <span>2022-01-01 ~ 2022-12-31</span>
            </div><br><br>
            
            <div class="leave-status">
                <h3 style="font-size:20px;">휴가현황</h3>
                <p style="font-size:14px; margin-top:25px;">총 휴가 : 15일 | 사용 : 0일 | 잔여 : 15일</p>
            </div><br><br>
    
            <div class="leave-creation">
                <h3 style="font-size:20px;">휴가 생성 내역</h3><br>
    
                <table class="table-bordered">
                    <tr style="height:40px;">
                        <th width="150px">생성일</th>
                        <th width="120px">생성 내역</th>
                        <th width="150px">내용</th>
                        <th width="450px">비고</th>
                    </tr>
                    <tr style="height:30px; text-align:center;">
                        <td>2022-01-01</td>
                        <td>15일</td>
                        <td>정기 휴가</td>
                        <td>연차 (15일 x 8시간 = 120시간)</td>
                    </tr>
                </table>
            </div><br><br><br>
    
            <!--최신순 3개까지만-->
            <div class="leave-apply">
                <h3 style="font-size:20px;">휴가 신청 내역</h3>
    
                <br>
                <a href="leaveApplyForm.wo" class="btn btn-primary" style="font-size:13px; margin-left:790px;">휴가신청</a>
                <br>
                <br>
    
                <table class="table-bordered">
                    <tr style="height:40px;">
                        <th width="120">신청일</th>
                        <th width="90">이름</th>
                        <th width="90">소속</th>
                        <th width="90">신청일수</th>
                        <th width="300">휴가기간</th>
                        <th width="90">구분</th>
                        <th width="90">상태</th>
                    </tr>
                    <c:forEach var="l" items="${leList}">
	                    <tr style="height:30px; text-align:center;">
	                        <td>${l.applyDate}</td>
	                        <td>${loginUser.userName}</td>
	                        <td>${l.deptName}</td>
	                        <td>${l.leaveUse}</td>
	                        <td>${l.startDate} ~ ${l.endDate}</td>
	                        <td>${l.leaveType}</td>
	                        <td>${l.status}</td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        
    </div>
</body>
</html>