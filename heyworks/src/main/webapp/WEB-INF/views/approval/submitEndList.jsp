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
        font-size: 13px;
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
	   	margin-left:400px;
    }
    .pagination>li{
    	border-radius:10px;
    }
</style>
</head>
<body>
	
	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">
    
        <a href="" class="subject">내 문서함</a>
        <br><br>

        <div id="btnNsearch">
            <div id="btns">
                <button type="button" class="btn btn-sm">결재완료문서</button>
                <button type="button" class="btn btn-sm">참조/열람문서</button>
                <button type="button" class="btn btn-sm">반려문서</button>
                <button type="button" class="btn btn-sm">임시저장</button>
            </div>

            <form>
                <div align="right">
                    <input type="text" name="" value="" placeholder="검색하기">
                    <button type="submit" class="btn btn-sm">검색</button>
                </div>
            </form>
        </div>
        <br>

        <br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="120">문서번호</th>
                    <th width="120">문서종류</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="275">제목</th>
                    <th wdith="70">첨부</th>
                    <th width="80">결재상태</th>
                    <th width="100">기안일</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${!empty edList}">
            			<c:forEach var="ed" items="${edList}">
		                <tr>
		                    <td class="ano">${ed.approvalNo}</td>
		                    <td>${ed.formNo}</td>
		                    <td>${ed.userNo}</td>
		                    <td>
		                    	<c:if test="${!empty ed.emergancy}">
		                        	<img src="resources/images/179386.png" style="width: 25%; height: 45%;" >
		                        </c:if>
		                    </td>
		                    <td>${ed.approvalTitle}</td>
		                    <td>
		                    	<c:if test="${!empty ed.originName}">
		                        	<img src="resources/images/2586886.png" style="width: 85%; height: 70%;" >
		                        </c:if>
		                    </td>
		                    <td>
		                    	<c:choose>
		                    		<c:when test="${ed.status eq 'Y'}">
		                        		<button class="btn btn-sm" style="background-color: lightgray;">완료</button>
									</c:when>
									<c:when test="${ed.status eq 'R'}">
				                        <button class="btn btn-sm" style="background-color: red; color: white;">반려</button>
									</c:when>
									<c:otherwise>
		                        		<button class="btn btn-sm">임시저장</button>
									</c:otherwise>	                    		
		                        </c:choose>
		                    </td>
		                    <td>${ed.createDate}</td>
		                </tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<td colspan="8">진행이 끝난 문서가 없습니다.</td>
                	</c:otherwise>
                </c:choose>
            </tbody>
        </table>

    </div>
		
		<div id="pagingArea">
        <ul class="pagination">
        	<c:choose>
        		<c:when test="${pi.listCount == 0}">
        			<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
        			<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
        			<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
        		</c:when>
        		<c:otherwise>
		        	<c:choose>
		        		<c:when test="${pi.currentPage eq 1}">
		            		<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li class="page-item"><a class="page-link" href="endlist.el?cpage=${pi.currentPage-1}&status=${status}">이전</a></li>
		            	</c:otherwise>
		            </c:choose>
		            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		            	<li class="page-item"><a class="page-link" href="endlist.el?cpage=${p}&status=${status}">${p}</a></li>
		            </c:forEach>
		            
		            <c:choose>
		        		<c:when test="${pi.currentPage eq pi.endPage}">
		            		<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li class="page-item"><a class="page-link" href="endlist.el?cpage=${pi.currentPage+1}&status=${status}">다음</a></li>
		            	</c:otherwise>
		           	</c:choose>
		        </c:otherwise>
		    </c:choose>
        </ul>
    </div>
	
		
	</div>
	
	<script>
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>