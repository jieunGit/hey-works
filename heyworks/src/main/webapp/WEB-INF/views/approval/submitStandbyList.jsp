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
    	margin-left: 850px;
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
                <button type="button" class="btn btn-sm">진행중</button>
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
            	<c:choose>
            		<c:when test="${!empty sbList}">
		            	<c:forEach var="sb" items="${sbList}">
		                <tr>
		                    <td class="ano">${sb.approvalNo}</td>
		                    <td>${sb.userNo}</td>
		                    <td>
		                    	<c:if test="${sb.emergancy eq 'Y'}">
		                        	<img src="resources/images/179386.png" style="width: 25%; height: 45%;" >
		                        </c:if>
		                    </td>
		                    <td>${sb.approvalTitle}</td>
		                    <td>
		                    	<c:if test="${!empty sb.originName}">
		                        	<img src="resources/images/2586886.png" style="width: 85%; height: 70%;" >
		                       	</c:if>
		                    </td>
		                    <td>${sb.firstUser}</td>
		                    <td>${sb.thirdUser}</td>
		                    <td>
		                    	<c:choose>
		                    		<c:when test="${sb.status eq 'D'}">
		                        		<button class="btn btn-sm" style="background-color: rgb(241, 196, 15);">결재대기</button>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<button class="btn btn-sm" style="background-color: rgb(243, 149, 137);">진행중</button>
		                    		</c:otherwise>
		                    	</c:choose>
		                    </td>
		                    <td>${sb.createDate}</td>
		                </tr>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		            	<tr>
		            		<td colspan="9">결재 진행중인 문서가 없습니다.</td>
		            	</tr>
		            </c:otherwise>
                </c:choose>
            </tbody>
        </table>

    	</div>
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
		            		<li class="page-item"><a class="page-link" href="onlist.el?cpage=${pi.currentPage-1}&status="${sb.status}>이전</a></li>
		            	</c:otherwise>
		            </c:choose>
		            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
		            	<li class="page-item"><a class="page-link" href="onlist.el?cpage=${p}&status="${sb.status}">${p}</a></li>
		            </c:forEach>
		            
		            <c:choose>
		        		<c:when test="${pi.currentPage eq pi.endPage}">
		            		<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li class="page-item"><a class="page-link" href="onlist.el?cpage=${pi.currentPage+1}&status="${sb.status}">다음</a></li>
		            	</c:otherwise>
		           	</c:choose>
		        </c:otherwise>
		    </c:choose>
        </ul>
    </div>
    
    <script>
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
	</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
</body>
</html>