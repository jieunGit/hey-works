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
    .table-hover tr:hover{
    	cursor:pointer;
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
	   	margin-left:350px;
    }
    .pagination>li{
    	border-radius:10px;
    	margin-left:5px;
		font-size:10px;
    }
    .color{background-color:lightgray;}
</style>
</head>
<body>
	
	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">
    
        <a href="#" class="subject">참조/열람대기 문서</a>
        <p class="text-secondary" style="font-size:12px;">*회색으로 표시된 부분은 이미 열람/참조한 글입니다.</p>

        <br>


        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="120">문서번호</th>
                    <th width="120">작성팀</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="350">제목</th>
                    <th width="70">등급</th>
                    <th width="100">기안일</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${!empty rrList}">
            			<c:forEach var="rr" items="${rrList}" varStatus="i">
	            			<c:choose>
	            				<c:when test="${ loginUser.userNo eq rr.read and rr.readStatus eq 'Y' or loginUser.userNo eq rr.reference and rr.referenceStatus eq 'Y'  }">
				                	<tr class="color">
				                </c:when>
				                <c:otherwise>
				                	<tr>
				                </c:otherwise>
				            </c:choose>
					                    <td class="ano">${rr.approvalNo}</td>
					                    <td>${rr.writeDept}</td>
					                    <td>${rr.userNo}</td>
					                    <td>
					                    	<c:if test="${!empty rr.emergancy}">
					                        	<img src="resources/images/emergancy.png" style="width: 25%; height: 45%;" >
					                        </c:if>
					                    </td>
					                    <td>${rr.approvalTitle}</td>
					                    <td>${rr.grade}</td>
					                    <td>${rr.createDate}</td>
			                	</tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<td colspan="8">참조/열람 할 문서가 없습니다.</td>
                	</c:otherwise>
                </c:choose>
            </tbody>
        </table>

    </div>
		
		<div id="pagingArea">
        <ul class="pagination">
        	<c:choose>
        		<c:when test="${rrpi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">◀ PREV</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="readNref.el?cpage=${rrpi.currentPage-1}">이전</a></li>
            	</c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${rrpi.startPage}" end="${rrpi.endPage}">
            	<li class="page-item"><a class="page-link" href="readNref.el?cpage=${p}">${p}</a></li>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${rrpi.currentPage eq rrpi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">NEXT ▶</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="readNref.el?cpage=${rrpi.currentPage+1}">NEXT ▶</a></li>
            	</c:otherwise>
           	</c:choose>
        </ul>
    </div>
    
    <div style="display:none;">
    	
    </div>
	
		
	</div>
	
	<script>
		/*
		const loginNo = '${loginUser.userNo}';
		
		// 열람,참조가 완료된 tr은 회색으로 변경
		var i = 0;
		
		$(".table-hover tr").each(function(){
			
			$(".table-hover tr>td>input").each(function(){
				
				if(($("input[name='read"+i+"']").val() == loginNo && $("input[name='readyn"+i+"']").val() == 'Y') || ($("input[name='reference"+i+"']").val() == loginNo && $("input[name='referenceyn"+i+"']").val() == 'Y')){
					
					$(this).parent().parent().addClass("color");
					
				}
				
				})
			console.log(i);
			i++;
				
		})
		*/
	
		// 클릭시 상세페이지 이동
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>