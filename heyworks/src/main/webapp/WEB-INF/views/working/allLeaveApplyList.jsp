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
    .all-apply{
       width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
    }
    .date-box{font-size:18px; font-weight:500;}
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-apply">

            <div class="title-box">
                <h2>휴가 신청내역</h2>
            </div><br>

            <div class="date-box" style="margin-bottom:70px;" align="center">
                <span>&lt; 2022/01/01 &gt;</span>
            </div>

            <br><br><br>

            <div class="select-btn" style="margin-left:750px">
                <button>삭제</button>
                <button>승인</button>
            </div>
            <br>

            <table class="table-bordered">
                <tr style="height:40px;">
                    <th width="30"></th>
                    <th width="100">이름</th>
                    <th width="100">소속</th>
                    <th width="80">신청일수</th>
                    <th width="300">휴가기간</th>
                    <th width="100">구분</th>
                    <th width="80">상태</th>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td><input type="checkbox"></td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>대기</td>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td><input type="checkbox"></td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>대기</td>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td><input type="checkbox"></td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>승인</td>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td><input type="checkbox"></td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>승인</td>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td><input type="checkbox"></td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>승인</td>
                </tr>
            </table>

        </div>
    </div>
</body>
</html>