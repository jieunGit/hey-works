<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
	.outer{
		width:1200px;
		height:1200px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 900px;
    }
    .table-bordered *{
        height: 40px;
    }
    .table-bordered th{
        background-color: rgb(245, 244, 244);
    }
    .table-bordered td{
        text-align: center;
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
    .table-bordered tr:hover{
    	cursor:pointer;
    }
    .table-bordered button{
    	width:100%;
    	height:70%;
    	line-height:70%;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="#" class="subject">결재 대기 문서(<span class="text-danger">${apList.size()}</span>)</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="150">문서번호</th>
	                    <th width="100">기안일</th>
	                    <th width="80">긴급</th>
	                    <th width="120">결재양식</th>
	                    <th width="300">제목</th>
	                    <th width="40">첨부</th>
	                    <th width="110">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	               <c:choose>
	            		<c:when test="${empty apList}">
            				<tr align="center">
			            		<td colspan="7">결재 대기중인 문서가 없습니다.</td>
			            	</tr>
			            </c:when>
			            <c:otherwise>
				            <c:forEach var="ap" items="${apList}" begin="0" end="2">
					                <tr>
					                	<td class="ano">${ap.approvalNo}</td>
					                    <td>${ap.createDate}</td>
					                    <td>
					                    	<c:if test="${ap.emergancy eq 'Y'}">
					                        	<img src="resources/images/179386.png" style="width: 30px; height: 30px;" >
					                    	</c:if>
					                    </td>
					                    <td>${ap.formNo}</td>
					                    <td style="text-overflow:ellipsis; overflow:hidden"><nobr>${ap.approvalTitle}</nobr></td>
					                    <td>
					                    	<c:if test="${!empty ap.originName}">
					                        	<img src="resources/images/2586886.png" style="width: 30px; height: 30px;" >
					                    	</c:if>
					                    </td>
					                    <td>${ap.userNo}</td>
					                </tr>
	                			</c:forEach>
			            </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	
	        <!-- 결재 진행 문서 -->
	        <hr>
	        <a href="#" class="subject">참조/열람 문서(${rrList.size()})</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="150">문서번호</th>
	                    <th width="40">등급</th>
	                    <th width="100">기안일</th>
	                    <th width="80">긴급</th>
	                    <th width="300">제목</th>
	                    <th width="110">작성자</th>
	                    <th width="120">작성팀</th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:choose>
            		<c:when test="${!empty rrList}">
            			<c:forEach var="rr" items="${rrList}"  begin="0" end="2">
		                <tr>
		                    <td class="ano">${rr.approvalNo}</td>
		                    <td>${rr.grade}</td>
		                    <td>${rr.createDate}</td>
		                    <td>
		                    	<c:if test="${!empty rr.emergancy}">
		                        	<img src="resources/images/179386.png" style="width: 25%; height: 45%;" >
		                        </c:if>
		                    </td>
		                    <td style="text-overflow:ellipsis; overflow:hidden"><nobr>${rr.approvalTitle}</nobr></td>
		                    <td>${rr.userNo}</td>
		                    <td>${rr.writeDept}</td>
		                </tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<td colspan="7">참조/열람 할 문서가 없습니다.</td>
                	</c:otherwise>
                </c:choose>
	            </tbody>
	        </table>
	
	        <!-- 완료 문서 -->
	        <hr>
	        <a href="#" class="subject">완료 문서(${edList.size()})</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="150">문서번호</th>
	                    <th width="100">기안일</th>
	                    <th width="120">결재양식</th>
	                    <th width="330">제목</th>
	                    <th width="90">상태</th>
	                    <th width="110">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:choose>
            		<c:when test="${!empty edList}">
            			<c:forEach var="ed" items="${edList}" begin="0" end="2">
		                <tr>
		                    <td class="ano">${ed.approvalNo}</td>
		                    <td>${ed.createDate}</td>
		                    <td>${ed.formNo}</td>
		                    <td style="text-overflow:ellipsis; overflow:hidden"><nobr>${ed.approvalTitle}</nobr></td>
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
		                    <td>${ed.userNo}</td>
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
	</div>
	 <script>
		$(".table-bordered>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
	</script>
	

</body>
</html>