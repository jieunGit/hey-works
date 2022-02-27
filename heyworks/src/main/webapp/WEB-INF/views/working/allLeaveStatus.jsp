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
    .title-box{font-size:20px; font-weight:600;}
    .date-box{font-size:25px; font-weight:600;}
    .table-bordered th{font-size:14px; text-align:center;}
    .table-bordered td{font-size:13px;}
    #pagingArea{width:fit-content;margin:auto;}
    
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:10%;}
    .text{width:25%;}
    .searchBtn{Width:10%;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <div class="all-status">

            <div class="title-box">
                <h3 style="font-size:20px;">전사 휴가현황</h3>
            </div><br>

            <div class="date-box" style="margin-bottom:50px;" align="center">
                <span> 2022-01-01 ~ 2022-12-31 </span>
            </div>

			<div id="search-area">
	            <form id="searchForm" action="allLeaveSearch.wo" method="Get" style="margin-left:560px">
	            	<input type="hidden" name="cpage" value="1">
	                <div class="select">
	                    <select class="custom-select" name="condition" >
	                        <option value="userName">이름</option>
	                        <option value="deptName">소속</option>
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
                <tr style="height:43px;">
                    <th width="95px">이름</th>
                    <th width="95px">소속</th>
                    <th width="95px">직급</th>
                    <th width="120px">입사일</th>
                    <th width="85px">근속연수</th>
                    <th width="85px">총 연차</th>
                    <th width="85px">사용 연차</th>
                    <th width="85px">잔여 연차</th>
                    <th width="85px">상태</th>
                    <th width="85px">상세</th>
                </tr>
                <c:forEach var="a" items="${alist}">
                	<input type="hidden" name="userNo" value="${a.userNo}">
	                <tr style="height:37px; text-align:center">
	                    <td>${ a.userName }</td>
	                    <td>${ a.deptName }</td>
	                    <td>${ a.jobName }</td>
	                    <td>${ a.hireDate }</td>
	                    <td>${ a.lengthYears }</td>
	                    <td>${ a.leaveTotal }</td>
	                    <td>${ a.leaveUse }</td>
	                    <td>${ a.leaveRest }</td>
	                    <td>${ a.status }</td>
	                    <td><a href="leaveUpdateForm.wo?userNo=${a.userNo}"><img src="resources/images/edit.png" style="width: 15px; height: 20px;"></a></td>
	                </tr>
                </c:forEach>
            </table>
			
			<br><br>
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
              			<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="leaveStatusList.wo?cpage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="leaveStatusList.wo?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="leaveStatusList.wo?cpage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

        </div>
    </div>
</body>
</html>