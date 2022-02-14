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
    .date-box{font-size:18px; font-weight:500;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h2>전사 휴가현황</h2>
            </div><br>

            <div class="date-box" style="margin-bottom:70px;">
                <span>&lt; 2022/01/01 ~ 2022/12/31 &gt;</span>
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
            <!--5개까지-->
            <table border="1">
                <tr style="height:40px;">
                    <th width="100px">이름</th>
                    <th width="100px">소속</th>
                    <th width="130px">입사일</th>
                    <th width="90px">근속연수</th>
                    <th width="90px">총 연차</th>
                    <th width="90px">사용 연차</th>
                    <th width="90px">잔여 연차</th>
                    <th width="90px">상태</th>
                    <th width="90px">상세</th>
                </tr>
                <tr style="height:30px; text-align:center">
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>2015/07/11</td>
                    <td>6</td>
                    <td>15</td>
                    <td>3</td>
                    <td>12</td>
                    <td>Y</td>
                    <td><a href="">>></a></td>
                </tr>
                <tr style="height:30px; text-align:center">
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>2015/07/11</td>
                    <td>6</td>
                    <td>15</td>
                    <td>3</td>
                    <td>12</td>
                    <td>Y</td>
                    <td><a href="">>></a></td>
                </tr>
                <tr style="height:30px; text-align:center">
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>2015/07/11</td>
                    <td>6</td>
                    <td>15</td>
                    <td>3</td>
                    <td>12</td>
                    <td>Y</td>
                    <td><a href="">>></a></td>
                </tr>
                <tr style="height:30px; text-align:center">
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>2015/07/11</td>
                    <td>6</td>
                    <td>15</td>
                    <td>3</td>
                    <td>12</td>
                    <td>Y</td>
                    <td><a href="">>></a></td>
                </tr>
                <tr style="height:30px; text-align:center">
                    <td>강보람</td>
                    <td>개발팀</td>
                    <td>2015/07/11</td>
                    <td>6</td>
                    <td>15</td>
                    <td>3</td>
                    <td>12</td>
                    <td>Y</td>
                    <td><a href="">>></a></td>
                </tr>
            </table>

            <div class="pagingArea">

            </div>

        </div>
    </div>
</body>
</html>