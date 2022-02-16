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
    .all-apply{
        margin: auto;
        margin-top:30px;
        margin-left:20px;
        width: 1000px;
    }
    .date-box{font-size:18px; font-weight:500;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="all-apply">

            <div class="title-box">
                <h2>휴가 신청내역</h2>
            </div><br>

            <div class="date-box" style="margin-bottom:70px;">
                <span>&lt; 2022/01/01 &gt;</span>
            </div>

            <form action="" method="Get">
                <select name="search">
                    <option value="name">이름</option>
                    <option value="dept">소속</option>
                </select>

                <input type="text" name="keyword">
                <button type="button">검색</button>
            </form>

            <br><br><br>

            <div class="select-btn" style="margin-left:750px">
                <button>삭제</button>
                <button>승인</button>
            </div>
            <br>

            <table border="1">
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