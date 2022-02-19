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
    
        <a href="#" class="subject">삭제된 문서</a>
        <br><br>

        <form>
            <div align="right">
            	<select name="subject">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
				</select>
                <input type="text" name="keyword" value="${keyword}" placeholder="검색하기">
                <button type="submit" class="btn btn-sm">검색</button>
            </div>
        </form> 

        <br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                	<th width="50"><input type="checkbox" onclick="allCheck(this);"></th>
                    <th width="120">문서번호</th>
                    <th width="80">작성자</th>
                    <th width="120">문서양식</th>
                    <th width="70">작성팀</th>
                    <th width="350">제목</th>
                    <th width="100">기안일</th>
                </tr>
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${!empty dltlist}">
            			<c:forEach var="de" items="${dltlist}">
		                <tr>
		                	<td><input type="checkbox" class="boxes"></td>
		                    <td class="ano">${de.approvalNo}</td>
		                    <td>${de.userNo}</td>
		                    <td>${de.formNo}</td>
		                    <td>${de.writeDept}</td>
		                    <td>${de.approvalTitle}</td>
		                    <td>${de.createDate}</td>
		                </tr>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<td colspan="7">삭제된 문서가 없습니다.</td>
                	</c:otherwise>
                </c:choose>
            </tbody>
        </table>
        
        <script>
	        /*전체 체크*/
	        function allCheck(check){
	            const confirm = check.checked;
	            if(confirm){
	                $(".boxes").attr("checked", true);
	            }else{
	                $(".boxes").attr("checked", false);
	            }
	        }
        </script>
        
        
        
        
        <div style="width:100%;">
        	<button type="button" class="btn btn-sm btn-outline-danger">복구</button>
        </div>

    </div>
		
	<div id="pagingArea">
        <ul class="pagination">
        	<c:choose>
        		<c:when test="${depi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">◀ PREV</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="deletelist.el?cpage=${depi.currentPage-1}">◀ PREV</a></li>
            	</c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${depi.startPage}" end="${depi.endPage}">
            	<c:choose>
	            	<c:when test="${empty subject}">
	            		<li class="page-item"><a class="page-link" href="deletelist.el?cpage=${p}">${p}</a></li>
	            	</c:when>
	            	<c:otherwise>
	            		<li class="page-item"><a class="page-link" href="deletelist.el?cpage=${p}&keyword=${keyword}">${p}</a></li>
	            	</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${depi.currentPage eq depi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">NEXT ▶</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="deletelist.el?cpage=${depi.currentPage+1}">NEXT ▶</a></li>
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