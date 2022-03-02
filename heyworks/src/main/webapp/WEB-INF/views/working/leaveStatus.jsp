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
       padding-left:40px;
       padding-top:30px;
	}

    .title-box{font-size:21px; font-weight:600;}
    .leave-box-list{
        list-style:none;
        height:100px;
    }
    .leave-box-list, .leave-box-list>li{
        float:left;
    }
    .leave-box>strong{
        position:absolute;
        font-size:17px;
    }
    .leave-box-list{
        position:relative;
        top:30px;
    }
    .leave-box-list{
        border:1px solid lightgray;
        border-radius:5px;
        margin-right:15px;
    }
    .leave-box>ul{margin-right:10px;}
    .leave-box-list>li{
        text-align:center;
        margin-top:22px;
        margin-right:25px;
        padding-right:30px;
        font-size:16px;
        padding-bottom:10px;
    }
    .table-bordered th, .thead-light th{font-size:15px; text-align:center;}
    .table-bordered td, .thead-light td{font-size:14px;}
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
                    <ul class="leave-box-list" style="width:520px; margin-top:10px; height:120px;">
                        <li style="border-right:1px solid lightgray;">
                            <strong>총 휴가일수</strong><br><br>
                            <span>${leStatus.leaveTotal}일</span>
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
                            <a href="leaveApplyForm.wo" class="btn btn-primary" style="font-size:15px; margin-top:18px; margin-right:-10px;">휴가신청</a>
                        </li>
                    </ul>
                </div>
    
            </div>
    
            <br><br><br><br><br>


            <div class="leave-creation" style="margin-left:40px">
                <strong><img src="resources/images/page.png" style="width: 20px; height: 20px;"> 휴가 생성 내역</strong>
                
                <table class="table-bordered" style="margin-top:15px;">
                	<thead>
	                    <tr style="height:43px;">
	                        <th width="150px">생성일</th>
	                        <th width="120px">생성 내역</th>
	                        <th width="150px">내용</th>
	                        <th width="480px">비고</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr style="height:40px; text-align:center;">
	                        <td>2022-01-01</td>
	                        <td>15일</td>
	                        <td>정기 휴가</td>
	                        <td>연차 (15일 x 8시간 = 120시간)</td>
	                    </tr>
	                </tbody>
                </table>
            </div><br><br><br><br>
        
            <!--최신순 5개까지만-->
            <div class="leave-apply" style="margin-left:40px">
                <strong><img src="resources/images/tick.png" style="width: 20px; height: 20px;"> 휴가 신청 내역</strong>

                <table class="table-bordered" style="margin-top:15px;">
                	<thead>
	                    <tr style="height:43px;">
	                        <th width="120">신청일</th>
	                        <th width="90">이름</th>
	                        <th width="90">소속</th>
	                        <th width="80">신청일수</th>
	                        <th width="280">휴가기간</th>
	                        <th width="90">구분</th>
	                        <th width="90">상태</th>
	                        <th width="60">상세</th>
	                    </tr>
	                </thead>
	                </tbody>
	                    <c:forEach var="l" items="${leList}">
	                        <tr style="height:40px; text-align:center;">
	                            <td>${l.applyDate}</td>
	                            <td>${loginUser.userName}</td>
	                            <td>${l.deptName}</td>
	                            <td>${l.leaveUse}</td>
	                            <td>${l.startDate} ~ ${l.endDate}</td>
	                            <td>${l.leaveType}</td>
	                            <td>${l.status}</td>
	                            <td><a href="leaveAppUpdateForm.wo?leaveAno=${l.leaveAno}"><img src="resources/images/file.png" style="width: 20px; height: 20px;"></a></td>
	                        </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
    </div>
</body>
</html>