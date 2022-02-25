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
    .all-status{
       width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
    }

    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:15%;}
    .text{width:25%;}
    .searchBtn{Width:10%;}

    .date-box{font-size:25px; font-weight:700;}

    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
    .tb-body tr{height:37px;}
    
    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h3 style="font-size:20px;">전사 근무현황</h3>
            </div><br>

            <div class="date-box" style="margin-bottom:50px;" align="center">
                <label id="sysdate">왜 안나와</label>
            </div>

            <script>
                function setSysdate(){
                    var today = new Date();

                    var year = today.getFullYear(); // 년도
                    var month = today.getMonth() + 1; // 월
                    var date = today.getDate(); // 일

                    document.getElementById("sysdate").innerHTML = year + "-" + 0 + month + "-" + date;
                }
            </script>

			<div id="search-area">
	            <form id="searchForm" action="allTnaSearch.wo" method="Get" style="margin-left:520px">
	            	<input type="hidden" name="cpage" value="1">
	                <div class="select">
	                    <select class="custom-select" name="condition" >
	                        <option value="userName">이름</option>
	                        <option value="tnaStatus">근태상태</option>
	                    </select>
	                </div>
	                <div class="text">
	                    <input type="text" class="form-control" name="keyword" value="${ keyword }">
	                </div>
	                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
	            </form>
            </div>
			<c:if test="${ not empty condition }">
				<script>
					$(function(){
						$("#search-area option[value=${condition}]").attr("selected", true);
					})
				</script>
			</c:if>
			
            <br><br><br><br>

            <table class="table-bordered">
                <thead class="tb-head">
                    <tr height="40px">
                        <th colspan="4">사원 정보</th>
                        <th colspan="6">근무 정보</th>
                    </tr>
                    <tr height="43px">
                        <th width="100px">사번</th>
                        <th width="95px">이름</th>
                        <th width="95px">소속</th>
                        <th width="95px">직급</th>
                        <th width="87px">출근시각</th>
                        <th width="87px">퇴근시각</th>
                        <th width="87px">휴게시간</th>
                        <th width="87px">근무시간</th>
                        <th width="87px">연장근무</th>
                        <th width="95px">근태상태</th>
                    </tr>
                </thead>
                <tbody id="tnaTbody" align="center" class="tb-body">
                	<c:forEach var="w" items="${wlist}">
	                    <tr height="37px">
	                        <td>${ w.userNo }</td>
	                        <td>${ w.userName }</td>
	                        <td>${ w.deptName }</td>
	                        <td>${ w.jobName }</td>
	                        <td>${ w.clockIn }</td>
	                        <td>${ w.clockOut }</td>
	                        <td>01:00</td>
	                        <td>${ w.workTime }시간 </td>
	                        <td>${ w.overTime }시간</td>
                        	<td>
                                <c:if test="${w.tnaStatus eq'연장근무'}">
                                <font color="red">${w.tnaStatus}</font></c:if>
                                <c:if test="${w.tnaStatus eq'정상근무'}">
                                <font color="green">${w.tnaStatus}</font></c:if>
                                <c:if test="${w.tnaStatus eq'휴가'}">
                                <font color="blue">${w.tnaStatus}</font></c:if>
                            </td>
	                    </tr>
                    </c:forEach>
                </tbody>
                
             </table>
             <br>
            
             <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
              			<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="allTnaMain.wo?cpage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="allTnaMain.wo?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="allTnaMain.wo?cpage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
             </div>
             
                

        </div>

        
    </div>
</body>
</html>