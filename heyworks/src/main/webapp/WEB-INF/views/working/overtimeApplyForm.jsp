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
	.applyForm-outer{
	   width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
	}
    .ot-content{
        height:700px;
    }
    .table-bordered{
        margin-left:60px;
    }
    .table-bordered th{
        height:40px;
		text-align:center;
		font-size:14px;
    }
    .table-bordered td{
        padding-left:7px;
		font-size:13px;
    }
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>
        <br><br>

        <div class="applyForm-outer">

            <form action="" method="post">

                <!--연장근무 신청 버튼-->
                
				<div class="apply-btn">
					<button type="submit" class="btn btn-primary">승인요청</button>
					<button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
				</div>
				<br>

                <!--연장근무 신청 내용-->
                <div class="ot-content" style="border:1px solid lightgrey;"><br>

                    <h3 align="center">연장근무 신청</h3>
                    <br><br>

                    <table class="table-bordered">
                        <tr>
                            <th width="130">신청자</th>
                            <td width="280">강보람</td>
                        </tr>
                        <tr>
                            <th>소속</th>
                            <td>개발팀</td>
                        </tr>
                        <tr>
                            <th>신청일</th>
                            <td id="sysdate"></td>
                        </tr>
                    </table>
                    <br><br>

                    <!--신청일 : 오늘날짜-->
					<script>
						let today = new Date();

						let year = today.getFullYear();
						let month = today.getMonth() + 1;
						let date = today.getDate();

						month = month >= 10 ? month : '0' + month;
						date = date >= 10 ? date : '0' + date;

						document.getElementById("sysdate").innerHTML = year + "-" + month + "-" + date;
					</script>

                    <table class="table-bordered">
                        <tr>
                            <th width="130">구분</th>
                            <td width="650">
                                <input type="radio" id="leave1" name="division" value="day" checked>
                                <label for="leave1">연장</label>

                                <input type="radio" id="leave2" name="division" value="half">
                                <label for="leave2">야간</label>

                                <input type="radio" id="leave3" name="division" value="event">
                                <label for="leave3">휴일</label>
                            </td>
                        </tr>
                        <tr>
                            <th>근무일시</th>
                            <td>
                                <!-- 해당 달 까지만 입력받을 수 있도록 -->
                                <input type="date" name="">
                                <input type="time"> ~ <input type="time">
                            </td>
                        </tr>
                        <tr>
                            <th>근무시간</th>
                            <td> 
                                <input type="text" style="width:50px; background:lightgrey; border:none; height:20px;" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th>사유</th>
                            <td style="height:100px;">
                                <textarea name="reason" cols="100" rows="12" style="resize:none; border:none;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            
        </div>


    </div>
</body>
</html>