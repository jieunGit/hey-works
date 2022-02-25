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
	   	margin-left:380px;
    }
    .pagination>li{
    	border-radius:10px;
    	margin-left:5px;
		font-size:10px;
    }
    .table-hover tr:hover{
    	cursor:pointer;
    }
    select {
		width: 200px;
		padding: .1em;
		border: 1px solid #999;
		font-family: inherit;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		text-align:center;
	}
	select::-ms-expand {
		display: none;
	}
	#search-area{width:100%;}
</style>
</head>
<body>
	
	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">
    
        <a href="#" class="subject">완료된 문서(
        <c:if test="${status eq 'Y'}">결재완료</c:if>
        <c:if test="${status eq 'R'}">반려</c:if>
        <c:if test="${status eq 'T'}">임시저장</c:if>
        )</a>
        <br><br>

        <div align="right" id="search-area">
        	<form action="" method="get" id="searchForm" style="width:100%">
        	
	        	<select name="subject" onchange="showSelect(this.value);">
	        		<option value="0">말머리를 선택하세요</option>
					<option value="title">제목</option>
					<option value="formType">문서종류</option>
				</select>
				
				<select name="type" style="display:none;" id="type" onchange="selectFromType();">
					<option value="0">선택하세요</option>
					<option value="1">업무기안서</option>
					<option value="2">비품구매품의서</option>
					<option value="3">증명서신청</option>
					<option value="4">채용요청서</option>
					<option value="5">일반품의서</option>
				</select>
				
	            <input type="text" id="searchStandBy" name="keyword" placeholder="검색하기" onkeyup="enterApproval();">
	            <input type="hidden" name="status" value="${status}">
            </form>
        </div>

        <br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="120">문서번호</th>
                    <th width="120">문서종류</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="275">제목</th>
                    <th width="70">첨부</th>
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
		                        	<img src="resources/images/179386.png" style="width: 30px; height: 30px;" >
		                        </c:if>
		                    </td>
		                    <td>${ed.approvalTitle}</td>
		                    <td>
		                    	<c:if test="${!empty ed.originName}">
		                        	<img src="resources/images/2586886.png" style="width: 30px; height: 30px;" >
		                        </c:if>
		                    </td>
		                    <td>
		                    	<c:choose>
		                    		<c:when test="${ed.status eq 'Y'}">
		                        		<button class="btn btn-sm" style="background-color: lightgray;">완료</button>
									</c:when>
									<c:when test="${ed.status eq 'R'}">
				                        <button class="btn btn-sm" data-toggle="tooltip" data-placement="right" title="${ed.confirmList[0].rejectReason}" style="background-color: red; color: white;">반려</button>
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
		<c:if test="${pi.endPage > 0}">
        <ul class="pagination">
        	<c:choose>
        		<c:when test="${pi.currentPage eq 1}">
            		<li class="page-item disabled"><a class="page-link" href="#">◀ PREV</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="endlist.el?cpage=${pi.currentPage-1}&status=${status}&subject=${subject}&type=${type}&keyword=${keyword}">◀ PREV</a></li>
            	</c:otherwise>
            </c:choose>
            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            	<li class="page-item"><a class="page-link" href="endlist.el?cpage=${p}&status=${status}&subject=${subject}&type=${type}&keyword=${keyword}">${p}</a></li>
            </c:forEach>
            
            <c:choose>
        		<c:when test="${pi.currentPage eq pi.endPage}">
            		<li class="page-item disabled"><a class="page-link" href="#">NEXT ▶</a></li>
            	</c:when>
            	<c:otherwise>
            		<li class="page-item"><a class="page-link" href="endlist.el?cpage=${pi.currentPage+1}&status=${status}&subject=${subject}&type=${type}&keyword=${keyword}">NEXT ▶</a></li>
            	</c:otherwise>
           	</c:choose>
        </ul>
        </c:if>
    </div>
	
		
	</div>
	
	<script>
		// 반려시 사유 보여주기
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();
		});
		
		// 문서종류 선택시 select나타내고 사라지기
		function showSelect(value){
			
			if(value == 'formType'){
				$("#type").show();
				$("#searchStandBy").hide();
			}else{
				$("#type").hide();
				$("#searchStandBy").show();
			}
			
		}

		// 제목으로 검색하기
		function enterApproval(){
			$("#searchStandBy").keypress(function(e){
                if(e.keyCode == 13){
					$("#searchForm").attr("action", "endlist.el").submit();
                }
            })
		}
		
		// 양식으로 검색하기
		function selectFromType(){
			$("#searchForm").attr("action", "endlist.el").submit();
		}
		
		// 상세보기
		$(".table-hover>tbody>tr").click(function(){
		
			location.href="detail.el?ano=" + $(this).children(".ano").text();
			
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>