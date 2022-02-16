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
    #tb-name, #tb-dept{
        text-align:center;
        font-weight:600;
    }
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h2>부서 근무현황</h2>
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

            <table border="1">
                <tr style="height:40px;">
                    <th width="100px">이름</th>
                    <th width="100px">소속</th>
                    <th width="100px">02/07(월)</th>
                    <th width="100px">02/08(월)</th>
                    <th width="100px">02/09(수)</th>
                    <th width="100px">02/10(목)</th>
                    <th width="100px">02/11(금)</th>
                    <th width="100px">02/12(토)</th>
                    <th width="100px">02/13(일)</th>
                </tr>
                <tr style="height:100px;">
                    <td id="tb-name">강보람</td>
                    <td id="tb-dept">개발팀</td>
                    <td>
                        출근 08:00 <br>
                        퇴근 18:00 <br><br>
                        근무시간 08:00
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height:100px;">
                    <td id="tb-name">강보람</td>
                    <td id="tb-dept">개발팀</td>
                    <td>
                        출근 08:00 <br>
                        퇴근 18:00 <br><br>
                        근무시간 08:00
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr style="height:100px;">
                    <td id="tb-name">강보람</td>
                    <td id="tb-dept">개발팀</td>
                    <td>
                        출근 08:00 <br>
                        퇴근 18:00 <br><br>
                        근무시간 08:00
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            
            <div class="pagingArea">

            </div>
        </div>

        
    </div>
</body>
</html>