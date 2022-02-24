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
		height:900px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 700px;
    }
    .table-hover *{
        height: 40px;
        font-size:13px;
        border:white;
    }
    .table-hover th{
        background-color: rgb(245, 244, 244);
    }
    .table-hover td{
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
    #pagingArea{
	   	margin-left:380px;
    }
    .pagination>li{
    	border-radius:10px;
    	margin-left:5px;
		font-size:10px;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="#" class="subject">승인결재문서</a>
	        <P class="text-primary" style="font-size:12px;">* 마지막결재자의 승인이 완료되어야 목록에서 확인할 수 있습니다.</P>
	        <br>
	        
	        <form>
            <div align="right">
                <input type="text" name="" value="" placeholder="검색하기">
            </div>
            </form> <br>
	
	        <table align="center" class="table-hover">
	            <thead>
	                <tr align="center">
	                    <th width="120">기안일</th>
	                    <th width="120">문서번호</th>
	                    <th width="120">문서종류</th>
	                    <th width="80">작성팀</th>
	                    <th width="80">긴급</th>
	                    <th width="250">제목</th>
	                    <th width="50">첨부</th>
	                    <th width="85">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:choose>
	            		<c:when test="${empty donelist}">
            				<tr align="center">
			            		<td colspan="7">결재 대기중인 문서가 없습니다.</td>
			            	</tr>
			            </c:when>
			            <c:otherwise>
				            <c:forEach var="d" items="${donelist}">
					                <tr>
					                    <td>${d.createDate}</td>
					                	<td class="ano">${d.approvalNo}</td>
					                    <td>${d.formNo}</td>
					                    <td>${d.writeDept}</td>
					                    <td>
					                    	<c:if test="${d.emergancy eq 'Y'}">
					                        	<img src="resources/images/179386.png" style="width: 25%; height: 55%;" >
					                    	</c:if>
					                    </td>
					                    <td>${d.approvalTitle}</td>
					                    <td>
					                    	<c:if test="${!empty d.originName}">
					                        	<img src="resources/images/2586886.png" style="width: 80%; height: 70%;" >
					                    	</c:if>
					                    </td>
					                    <td>${d.userNo}</td>
					                </tr>
	                			</c:forEach>
			            </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	    </div>

	</div>
	
	<script>
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>