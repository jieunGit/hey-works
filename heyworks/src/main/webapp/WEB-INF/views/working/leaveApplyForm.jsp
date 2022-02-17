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
        margin-left:400px;
    }
    .leave-content{
        margin-top:30px;
        margin-right:400px;
        height:700px;
    }
    .info-tb, .content-tb{
        margin-left:45px;
    }
    table th{
        height:30px;
    }
    td{
        padding-left:7px;
    }
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <br><br>

		<form action="" method="post">
		
			<input type="hidden" name="userNo" value="">
			
	        <!--휴가신청 버튼-->
	        <div class="leave-btn">
	            <button type="submit">승인요청</button>
	            <button type="button">취소</button>
	        </div>
	
	        <!--휴가신청서 내용-->
	        <div class="leave-content" style="border:1px solid black"><br>
	            
	            <h2 align="center">휴가 신청</h2><br><br>
	            <table class="info-tb" border="1">
	                <tr>
	                    <th width="120">신청자</th>
	                    <td width="260">강보람</td>
	                </tr>
	                <tr>
	                    <th width="120">소속</th>
	                    <td width="260">개발팀</td>
	                </tr>
	                <tr>
	                    <th width="120">신청일</th>
	                    <td width="260">2022/02/10</td>
	                </tr>
	            </table>
	            <br><br>
	
	            <table class="content-tb" border="1">
	                <tr>
	                    <th width="120">구분</th>
	                    <td width="570">
	                        <input type="radio" id="leave1" name="division" value="day" checked>
	                        <label for="leave1">연차</label>
	
	                        <input type="radio" id="leave2" name="division" value="half">
	                        <label for="leave2">반차</label>
	
	                        <input type="radio" id="leave3" name="division" value="event">
	                        <label for="leave3">경조</label>
	
	                        <input type="radio" id="leave4" name="division" value="sick">
	                        <label for="leave4">병가</label>
	                    </td>
	                </tr>
	                <tr>
	                    <th width="120">휴가기간</th>
	                    <td width="560">
	                        <input type="date"> ~
	                        <input type="date">
	                    </td>
	                </tr>
	                <tr>
	                    <th width="120">연차일수</th>
	                    <td width="560">
	                        	잔여연차 : 
	                        <input type="text" style="width:50px; background:lightgrey; border:none; height:20px;" readonly>
	                       	        신청연차 : 
	                        <input type="text" style="width:50px; background:lightgrey; border:none; height:20px;" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <th width="120">사유</th>
	                    <td width="560" height="200">
	                        <textarea name="reason" cols="75" rows="15" style="resize:none; border:none;"></textarea>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </form>
    </div>
</body>
</html>