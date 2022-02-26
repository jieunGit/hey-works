<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
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
        margin-top:20px;
        margin-left:40px;
        width: 900px;
        height: 900px;
    }
    .contents .searchbar {
        margin-top: 30px;
        margin-bottom: 20px;
        
    }
    .contents .input-group {
        width: 250px;
    }
    #count {
        margin-top: 40px;
        margin-left: 10px;
        font-size: 16px;
    }
    .searchbar, #count { 
        float: left;
    }
    .contents .table th, td {
        text-align: center;
        font-size: small;
    }
    .contents .table {
        border-bottom: 2px solid rgb(223, 223, 223);
        table-layout:fixed
    }
    .table thead {
        background-color: rgb(235, 231, 231);
    }
    .table .msgcontent:hover {
    	cursor:pointer;
    }
    .contents button {
        width: 80px;
    }
    .modal {
        text-align: center;
    }
    @media screen and (min-width: 768px) {
        .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
        }
    }
    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }
    .pagination { margin-top: 100px; }
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="messageSidebar.jsp" />
   
        <div class="contents">

            <!--검색바-->
            <form class="searchbar" method="get" action="search.inMsg">
                <div class="input-group">
                  <input name="userName" type="text" class="form-control" placeholder=" 이름 검색">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="submit" style="width: 40px; height: 34px;">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </div>
                </div>
            </form>

            <span id="count">받은쪽지 <b>${ count }</b>개</span>
            

            <!-- 받은쪽지리스트 -->
            <table class="table">
                <thead>
                    <tr>
                        <th width="90"><input id="ckAll" type="checkbox"></th>
                        <th width="150">발송인</th>
                        <th width="">내용</th>
                        <th width="200">날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="m" items="${ inList }">
	                    <tr class="msgList">
	                    	<td class="inMsgNo" style="display:none;">${ m.inMsgNo }</td>
	                        <td><input class="ck" type="checkbox"></td>
	                        <td>${ m.userName }</td>
	                        <td class="msgcontent" style="text-overflow:ellipsis; overflow:hidden"><nobr>${ m.outMsgContent }</nobr></td>
	                        <td>${ m.msgDate }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <!-- 삭제|보관 버튼 -->
            <div class="buttons">
                <button id="goDel" type="button" class="btn btn-default" style="margin-right: 10px;" data-toggle="modal" data-target="#delete"><i class="fa-regular fa-trash-can">&nbsp;</i>삭제</button>
                <button id="goKeep" type="button" class="btn btn-success" data-toggle="modal" data-target="#keep">보관함</button>
            </div>   

            <!-- 삭제 Modal -->
            <div id="delete" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            쪽지를 삭제하시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button type="button" id="yesDel" class="btn btn-danger" style="margin-right:40px;">삭제</button>
                        </div>
                    </div>
            
                </div>
            </div>

            <!-- 보관 Modal -->
            <div id="keep" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            쪽지를 보관함으로 이동하시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button type="button" id="yesKeep" class="btn btn-success" style="margin-right:40px;">보관</button>
                        </div>
                    </div>
            
                </div>
            </div>
            
            
            
			<!-- 상세보기용 script -->
			<script>
				$(function(){
					$(".msgcontent").click(function(){
						location.href = "detail.inMsg?inMsgNo=" + $(this).siblings('.inMsgNo').text();						
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
            
            <!-- 삭제하기 기능 -->
			<script>
				$(function(){
					
					$("#yesDel").click(function(){
						
						const mNos = new Array();
						
						$(".ck:checked").each(function(){
							mNos.push($(this).parent().siblings(".inMsgNo").text());
						});
						console.log(mNos);
						
						$.ajax({
							
							url:"delete.inMsg",
	 		   				type:"post",
	 		   				data: {
	 		   					mNos:mNos
	 		   				},
	 		   				success:function(result){
	 		   					if(result > 0) {
	 		   						alert("쪽지가 삭제되었습니다.");
	 	   							location.reload();
	 		   					}
	 		   				}, error:function(){
	 		   					console.log("실패");
	 		   				}
	 		   					
							
						})
						
						
					})
					
					$("#yesKeep").click(function(){
						
						const mNos = new Array();
						
						$(".ck:checked").each(function(){
							mNos.push($(this).parent().siblings(".inMsgNo").text());
						});
						
						console.log(mNos);
						
						$.ajax({
							
							url:"keep.inMsg",
	 		   				type:"post",
	 		   				data: {
	 		   					mNos:mNos
	 		   				},
	 		   				success:function(result){
	 		   					if(result > 0) {
	 		   						alert("선택한 쪽지를 보관함으로 이동했습니다.");
	 	   							location.reload();
	 		   					}
	 		   				}, error:function(){
	 		   					console.log("실패");
	 		   				}
						})
					})
				})
			</script>
            
            <!-- 페이징바 -->
            <ul class="pagination" style="margin-left: 350px;">
            
            	<c:choose>
            		<c:when test="${ pi.currentPage eq 1 }">
            			<li class="page-item disabled"><a href="#"><</a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a href="list.inMsg?cpage=${ pi.currentPage-1 }"><</a></li>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            		<li class="page-item"><a href="list.inMsg?cpage=${ p }">${ p }</a></li>
            	</c:forEach>
            	
            	<c:choose>
            		<c:when test="${ pi.currentPage eq pi.maxPage }">
            			<li class="page-item disabled"><a href="#">></a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="page-item"><a href="list.inMsg?cpage=${ pi.currentPage+1 }">></a></li>
            		</c:otherwise>
            	</c:choose>
            	
            </ul>
            
            
            
            
            
        </div>
    </div>
   

</body>
</html>