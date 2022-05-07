<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원관리</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
        margin: auto;
        margin-top:0px;
        margin-left:50px;
        width: 900px;
        height: 900px;
    }
    .userPlus {
        margin-top: 50px;
        width: 150px;
        color: rgb(69, 120, 197);
    }
    .userPlus:hover {
        cursor: pointer;
        color: rgb(147, 177, 223);
    }
    .contents .search-area {
        width: 900px;
        margin-top: 40px;
    }
    .search-area {
        border: 1px solid white
    }
    .contents .select {
        float: left;
    }
    #deptCode {
        border: 1px #cfcfcf solid;
        padding: 0 4px;
        color: #444;
        font-weight: normal;
        width: 199px;
        height: 34px;
        border-radius: 5px;
        line-height: 27px;
        vertical-align: middle;
    }
    .contents .input-group {
        width: 215px;
        float: right;
    }
    .contents .table th, td {
        text-align: center;
        font-size: small;
    }
    .contents .table {
        border-bottom: 2px solid rgb(223, 223, 223);
        margin-top: 45px;
    }
    .table thead {
        background-color: rgb(235, 231, 231);
    }
    .settings * {
        border: none;
        border-right: 1px solid rgb(58, 127, 186);
        color: rgb(58, 127, 186);;
        background-color: white;
        width: 80px;
    }
    .pagination { margin-top: 50px; }
    .table>tbody>tr>td:hover { 
    	cursor:pointer;
    }
</style>
</head>
<body>

   <div class="outer">
   
      <jsp:include page="../common/menubar.jsp" />
      <jsp:include page="adminOrganSidebar.jsp" />
   
      <div class="contents">
          
            <!--사용자 추가 버튼-->
            <div class="userPlus">
                <i class="fa-solid fa-circle-plus" style="font-size: 20px;"> 사용자 추가</i>
            </div>
            
            <script>
            	$(function(){
            		$('.userPlus').click(function(){
            			location.href = "userPlustForm.organ";
            		})
            	})
            </script>

            <!--드롭다운 | 검색바-->
            <div class="search-area">
                <!--드롭다운-->
                <div class="select">
                    <span style="font-size: 16px;">소속 : </span>
                    <!--부서select-->
                    <select name="deptCode" id="deptCode">
                    	<option value="0">전체</option>
                    	<c:forEach var="d" items="${ dept }">
                    		<option value="${ d.deptCode }" <c:if test="${dno eq d.deptCode}">selected="selected"</c:if>>${ d.deptName }</option>
                    	</c:forEach>
                    </select>
                </div>
            
                <!--검색바-->
                <form class="searchbar">
                    <div class="input-group">
                    <input type="text" class="form-control" value="${ userName }" name="userName" placeholder="이름 검색">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" onclick="searchOrgan">
                        <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                    </div>
                </form>
            </div>
            
            
            
            <!--임직원목록-->
            <table class="table">
                <thead>
                    <tr>
                        <th width=""><input id="ckAll" type="checkbox"></th>
                        <th width="">이름</th>
                        <th width="">ID</th>
                        <th width="">사내전화</th>
                        <th width="">휴대전화</th>
                        <th width="">소속</th>
                        <th width="">직위</th>
                        <th width="">상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="o" items="${ organ }">
                   		<tr>
	                        <td><input class="ck" type="checkbox"></td>
	                        <td style="display:none;" class="userNo">${ o.userNo }</td>
	                        <td>${ o.userName }</td>
	                        <td>${ o.userId }</td>
	                        <td>${ o.call }</td>
	                        <td>${ o.phone }</td>
	                        <td>${ o.deptName }</td>
	                        <td>${ o.jobName }</td>
	                        <td>${ o.status }</td>
                   		</tr>
                	</c:forEach>
                </tbody>
            </table>

           

            <!-- 페이징바 -->
            <ul class="pagination" style="margin-left: 350px;">
            
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
            			<li class="pagePrev" class="page-item disabled"><a href="#"><</a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="pagePrev" class="page-item"><a href="list.adminOrgan?dno=${ dno }&cpage=${ pi.currentPage-1 }"><</a></li>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            		<c:choose>
            		<c:when test="${ pi.currentPage eq p }">
            			<li class="active"><a href="#">${ p }</a></li>
            		</c:when>
            		<c:otherwise>
	           			<li class="page" class="page-item"><a href="list.adminOrgan?dno=${ dno }&cpage=${ p }">${ p }</a></li>
            		</c:otherwise>
            		</c:choose>
            	</c:forEach>
            	
            	<c:choose>
            		<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<li class="pageNext" class="page-item disabled"><a href="#">></a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="pageNext" class="page-item"><a href="list.adminOrgan?dno=${ dno }&cpage=${ pi.currentPage+1 }">></a></li>
            		</c:otherwise>
            	</c:choose>
            	
            </ul>
            
       </div>
   </div>
   
   <!-- 드롭다운 클릭 시 부서별 조회 -->
   <script>
    $(function(){
    	$('#deptCode').change(function(){
    		var dtCode = $('#deptCode option:selected').val();
    		//console.log(dtCode);
    		location.href="list.adminOrgan?dno=" + dtCode;
    	})
    });
   </script>
   
   <!-- 임직원 상세정보 -->
   <script>
   	 $(function(){
   		 $('.table>tbody>tr').click(function(){
   			location.href = "updateForm.organ?userNo=" + $(this).children('.userNo').text();
   			 //console.log($(this).children('.userNo').text());
   		 })
   	 })
   </script>
   
   <!-- 전체선택|전체해제 기능 -->
   <script>
         
         // 전체선택 클릭시 전부 선택
         $("#ckAll").on('click', function(){
            
            if($("#ckAll").is(':checked')) {
               $("input[type=checkbox]").prop("checked", true);
            }else {
               $("input[type=checkbox]").prop("checked", false);
            }
            
         })
         
         // 전부 선택시 전체선택 checked
	     $("input[type=checkbox]").on('click', function(){
	         var total = $(".ck").length;
	         var checked = $(".ck:checked").length;
	         
	         if(total != checked) {
	            $("#ckAll").prop("checked", false);
	         }else {
	            $("#ckAll").prop("checked", true);
	         }
	      })   
   </script>
 
</body>
</html>