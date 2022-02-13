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
    margin-left:300px;
    }
    .wide-menu{margin-top:30px;}
    a{
      text-decoration: none; 
      color:black; 
      font-size:18px;
      margin-right:20px;
      font-weight:600;
    }
    .year-select{font-size:18px; font-weight:500;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="wide-menu">
            <a href="">근무현황</a>
            <a href="">휴가현황</a>
        </div>
        <hr width="950px" align="left">
        <br>

        <div class="year-select" align="left">
            <span>&lt; 2022/01/01 ~ 2022/12/31 &gt;</span>
        </div><br><br>
        
        <div class="leave-status">
            <h3>휴가현황</h3>
            <p style="font-size:14px;">총 휴가 : 15일 | 사용 : 0일 | 잔여 : 20일</p>
        </div><br>

        <div class="leave-creation">
            <h3>휴가 생성 내역</h3>

            <table border="1">
                <tr style="height:40px;">
                    <th width="150px">생성일</th>
                    <th width="120px">생성 내역</th>
                    <th width="150px">내용</th>
                    <th width="450px">비고</th>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td>2022/01/01</td>
                    <td>15일</td>
                    <td>정기 휴가</td>
                    <td>연차 (15일 x 8시간 = 120시간)</td>
                </tr>
            </table>
        </div><br><br><br>

        <div class="leave-apply">
            <h3>휴가 신청 내역</h3>

            <button type="button" style="margin-left:820px;">휴가신청</button>
            <br>
            <br>

            <table border="1">
                <tr style="height:40px;">
                    <th width="120">신청일</th>
                    <th width="90">신청자</th>
                    <th width="90">소속</th>
                    <th width="70">신청일수</th>
                    <th width="300">신청기간</th>
                    <th width="90">구분</th>
                    <th width="90">상태</th>
                </tr>
                <tr style="height:30px; text-align:center;">
                    <td>2022/01/03</td>
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>1</td>
                    <td>2022/01/05 ~ 2022/01/06</td>
                    <td>경조사</td>
                    <td>대기</td>
                </tr>
            </table>
        </div>
        
    </div>
</body>
</html>