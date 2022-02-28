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
	.year-outer{
	   width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
	}

    .title-box{font-size:20px; font-weight:600;}
    .leave-box-list{
        list-style:none;
        height:100px;
    }
    .leave-box-list, .leave-box-list>li{
        float:left;
    }
    .leave-box>strong{
        position:absolute;
        font-size:16px;
    }
    .leave-box-list{
        position:relative;
        top:30px;
    }
    .leave-box-list{
        border:1px solid lightgray;
        border-radius:5px;
        margin-right:20px;
    }
    .leave-box>ul{margin-right:35px;}
    .leave-box-list>li{
        text-align:center;
        margin-top:20px;
        margin-right:20px;
        padding-right:15px;
        font-size:13px;
    }
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="status-outer">

            <div class="year-outer">

                <div class="title-box">
                    올해 휴가 정보
                </div><br>
    
                <div class="leave-box">
                    <strong><img src="resources/images/gift.png" style="width: 20px; height: 20px;"> 휴가현황</strong>
                    <ul class="leave-box-list" style="width:450px">
                        <li style="border-right:1px solid lightgray;">
                            <strong style="margin-left:40px;">총 휴가일수</strong><br><br>
                            <span style="margin-left:35px;">${leStatus.leaveTotal}일</span>
                        </li>
                        <li style="border-right:1px solid lightgray;">
                            <strong>사용일수</strong><br><br>
                            <span>${leStatus.leaveUse}일</span>
                        </li>
                        <li style="border-right:1px solid lightgray;">
                            <strong>잔여일수</strong><br><br>
                            <span>${leStatus.leaveRest}일</span>
                        </li>
                        <li>
                            <a href="leaveApplyForm.wo" class="btn btn-primary" style="font-size:13px; margin-top:13px;">휴가신청</a>
                        </li>
                    </ul>
                </div>
    
            </div>
    
            <br><br><br><br><br>


            <div class="leave-creation" style="margin-left:30px">
                <strong><img src="resources/images/page.png" style="width: 20px; height: 20px;"> 휴가생성내역</strong>
                
                <table class="table-bordered" style="margin-top:15px;">
                    <tr style="height:40px;">
                        <th width="150px">생성일</th>
                        <th width="120px">생성 내역</th>
                        <th width="150px">내용</th>
                        <th width="450px">비고</th>
                    </tr>
                    <tr style="height:37px; text-align:center;">
                        <td>2022-01-01</td>
                        <td>15일</td>
                        <td>정기 휴가</td>
                        <td>연차 (15일 x 8시간 = 120시간)</td>
                    </tr>
                </table>
            </div><br><br><br><br>
        
            <!--최신순 5개까지만-->
            <div class="leave-apply" style="margin-left:30px">
                <strong><img src="resources/images/tick.png" style="width: 20px; height: 20px;"> 휴가신청내역</strong>

                <table class="table-bordered" style="margin-top:15px;">
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
                        <tr style="height:37px; text-align:center;">
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