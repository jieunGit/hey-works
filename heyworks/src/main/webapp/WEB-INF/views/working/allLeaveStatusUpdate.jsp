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
        margin-top:70px;
        margin-left:200px;
        width: 1000px;
    }
    table{
        border-spacing:0 20px;
        border-collapse:separate;
        font-size:14px;
    }
    table th{width:150px; height:30px; text-align:left;}
    table td, input{width:200px; height:30px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h2>휴가현황 수정</h2>
            </div><br>

            <form action="">
                <input type="hidden" name="userNo" value="">
                <table >
                    <tr>
                        <th><label for="userName">이름</label></th>
                        <td><input type="text" id="userName" name="userName" value="강보람" required></td>
                    </tr>
                    <tr>
                        <th><label for="department">소속</label></th>
                        <td><input type="text" id="department" name="department" value="개발팀" required></td>
                    </tr>
                    <tr>
                        <th><label for="hireDate">입사일</label></th>
                        <td><input type="text" id="hireDate" name="hireDate" value="2015/05/05" required></td>
                    </tr>
                    <tr>
                        <th><label for="length">근속연수</label></th>
                        <td><input type="number" id="length" name="length" value="3"></td>
                    </tr>
                    <tr>
                        <th><label for="totalLeave">총 연차</label></th>
                        <td><input type="number" id="totalLeave" name="totalLeave" value="15"></td>
                    </tr>
                    <tr>
                        <th><label for="useLeave">사용 연차</label></th>
                        <td><input type="number" id="useLeave" name="useLeave" value="1"></td>
                    </tr>
                    <tr>
                        <th><label for="restLeave">잔여 연차</label></th>
                        <td><input type="number" id="restLeave" name="restLeave" value="14"></td>
                    </tr>

                </table>

                <div style="margin-left:150px;">
                    <button type="button">취소</button>
                    <button type="submit">수정</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>