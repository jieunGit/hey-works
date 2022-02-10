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
		height:750px;
	    margin:auto;
	}
	.outer>div{float:left;}
	.elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 650px;
    }
    #btnNsearch>*{float: left;}
    #btns{width: 640px;}
    .table-hover *{
        height: 40px;
        font-size: 12px;
    }
    .table-hover th{background-color: rgb(245, 244, 244);}
    .table-hover td{text-align: center;}
    .table-hover button{
        font-size: 10px;
        width: 65px;
        height: 25px;
    }
    .subject{
        color: black;
        font-size: 20px;
        font-weight: 800;
    }
    .subject:hover{
        color: black;
        text-decoration: none;
    }
    #pagingArea{
    	width:fit-content;
    	margin: auto;
    }
</style>
</head>
<body>
	
	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">
        <!-- 진행중인문서 -->
        <a href="" class="subject">진행중인문서</a>
        <br><br>

        <div id="btnNsearch">
            <div id="btns">
                <button type="button" class="btn btn-sm">전체</button>
                <button type="button" class="btn btn-sm">결재대기</button>
                <button type="button" class="btn btn-sm">결재예정</button>
                <button type="button" class="btn btn-sm">참조/열람대기</button>
            </div>

            <form>
                <div align="right">
                    <input type="text" name="" value="" placeholder="검색하기">
                    <button type="submit" class="btn btn-sm">검색</button>
                </div>
            </form>
        </div>
        <br><br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="120">문서번호</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="200">제목</th>
                    <th wdith="70">첨부</th>
                    <th width="100">현재결재자</th>
                    <th width="100">최종결재자</th>
                    <th width="80">결재상태</th>
                    <th width="100">기안일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="ap" items="${apList}">
                <tr>
                    <td>${ap.approvalNo}</td>
                    <td>${ap.userNo}</td>
                    <td>
                    	<c:if test="${ap.emergency eq 'Y'}">
                        	<img src="resources/images/179386.png" style="width: 25%; height: 45%;" >
                        </c:if>
                    </td>
                    <td>${ap.approvalTitle}</td>
                    <td>
                    	<c:if test="${!empty ap.originName}">
                        	<img src="resources/images/2586886.png" style="width: 85%; height: 70%;" >
                       	</c:if>
                    </td>
                    <td>공유</td>
                    <td>강보람</td>
                    <td>
                        <button class="btn btn-sm" style="background-color: rgb(241, 196, 15);">결재대기</button>
                    </td>
                    <td>${ap.createDate}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:forEach var="b" items="${list}">
	                    <tr>
	                        <td class="bno">${b.boardNo}</td>
	                        <td>${b.boardTitle}</td>
	                        <td>${b.boardWriter}</td>
	                        <td>${b.count}</td>
	                        <td>${b.createDate}</td>
	                        
	                        <td>
		                        <c:if test="${!empty b.originName}">
		                       		★
		                        </c:if>
		                    </td>
		                    
	                    </tr>
                    </c:forEach>

    	</div>
	</div>
	
	<div id="pagingArea">
        <ul class="pagination">
        
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="onAllList.el?cpage=${pi.currentPage-1}">Previous</a></li>
            	</c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link" href="onAllList.el?cpage=${p}">${p}</a></li>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${pi.currentPage eq pi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="onAllList.el?cpage=${pi.currentPage+1}">Next</a></li>
            	</c:otherwise>
           	</c:choose>
        </ul>
    </div>
	
</body>
</html>