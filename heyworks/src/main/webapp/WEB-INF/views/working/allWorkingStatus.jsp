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
    .all-status{
        margin: auto;
        margin-top:30px;
        margin-left:20px;
        width: 1000px;
    }
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h2>전사 근무현황</h2>
            </div><br><br>

            <div class="date-box" style="margin-bottom:70px;">
                <input type="date">
                <button type="submit" class="btn btn-primary">조회</button>
            </div>

            <form action="" method="Get" style="margin-left:650px">
                <select name="search">
                    <option value="name">이름</option>
                    <option value="dept">소속</option>
                </select>

                <input type="text" name="keyword">
                <button type="button">검색</button>
            </form>

            <br><br>

            <table class="table-bordered" border="1">
                <tr>
                    <th colspan="5">사원 정보</th>
                    <th colspan="5">출퇴근 정보</th>
                </tr>
                <tr>
                    <th width="100px">날짜</th>
                    <th width="90px">사번</th>
                    <th width="80px">이름</th>
                    <th width="80px">소속</th>
                    <th width="70px">직급</th>
                    <th width="90px">출근시각</th>
                    <th width="90px">퇴근시각</th>
                    <th width="90px">휴게시간</th>
                    <th width="90px">근무시간</th>
                    <th width="80px">근태상태</th>
                </tr>
                <tr>
                    <td>2022-02-20</td>
                    <td>210302030</td>
                    <td>배배배</td>
                    <td>개발팀</td>
                    <td>과장</td>
                    <td>08:00</td>
                    <td>17:00</td>
                    <td>01:00</td>
                    <td>08:00</td>
                    <td>정상근무</td>
                </tr>
            </table>
            
            <div class="pagingArea">

            </div>
        </div>

        
    </div>
</body>
</html>