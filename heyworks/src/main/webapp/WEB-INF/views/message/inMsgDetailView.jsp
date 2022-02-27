<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
        margin: auto;
        margin-top:30px;
        margin-left:40px;
        width: 900px;
        height: 900px;
    }
    .buttons button {
        margin-right: 10px;
    }
    .contents .inform {
        width: 330px;
        margin-top: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e0dddd;
    }
    .inform tr th {
        width: 80px; 
        height: 30px;
    }
    .msg-content {
        width: 330px;
        height: 500px;
        padding: 20px 5px 0px 5px;
        border-bottom: 1px solid #e0dddd;
    }
    .msg-content textarea {
        resize: none; 
        width: 330px; 
        height: 460px;
        border : 0px;
    }
    #goKeep { margin-top: 20px;}
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
    .modal-dialog button{
        width: 80px;
    }
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="messageSidebar.jsp" />
    
        <div class="contents">

            <!-- 삭제|답장|이전|다음 버튼 -->
            <div class="buttons">
                <button id="goDel" type="button" class="btn btn-default" style="width: 70px;" data-toggle="modal" data-target="#delete"><i class="fa-regular fa-trash-can">&nbsp;</i>삭제</button>
                <button id="goRe" type="button" class="btn btn-primary" style="margin-right: 25px; width: 70px;">답장</button>
                <button id="goPrev" type="button" class="btn btn-default" style="border-radius: 15px;">&lt;&nbsp; prev</button>
                <button id="goNext" type="button" class="btn btn-default" style="border-radius: 15px;">next &nbsp;&gt; </button>
            </div>
            
            <!-- 쪽지내용 -->
            <div class="inform">
                <table>
                    <tr>
                        <th>보낸사람</th>
                        <td class="userName">${ msg.userName }</td>
                        <td class="sentNo" style="display:none;">${ msg.sentNo }</td>
                    </tr>
                    <tr>
                        <th>받은시간</th>
                        <td>${ msg.msgDate }</td>
                        <td class="inMsgNo" style="display:none;">${ msg.inMsgNo }</td>
                    </tr>
                </table>
            </div>
            <div class="msg-content">
                <textarea id="comment" readonly>${ msg.outMsgContent }</textarea>
            </div>
            
            <!-- 보관하기 버튼 -->
            <button id="goKeep" type="button" class="btn btn-success" data-toggle="modal" data-target="#keep">보관하기</button>

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
                            <button type="button" style="margin-right:40px;" id="yesDel" class="btn btn-danger">삭제</button>
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
                            <button type="button" style="margin-right:40px;" id="yesKeep" class="btn btn-primary">보관</button>
                        </div>
                    </div>
            
                </div>
            </div>   
            
            <!-- 답장하기 스크립트 -->
            <script>
            
            	$(function(){
            		
            		$('#goRe').click(function(){
            			location.href="reply.form?sentNo=${msg.sentNo}&userName=${msg.userName}";
            		})
            		
            	})
            
            </script>
          
            <!-- 이전|다음 스크립트 -->
			<script>
				
			</script>
			
			<!-- 삭제|보관 스크립트 -->
			<script>
				
				$(function(){
					
					$("#yesDel").click(function(){
						
						const mNos = new Array();
						mNos.push('${ msg.inMsgNo }');
						
						$.ajax({
							
							url:"delete.inMsg",
	 		   				type:"post",
	 		   				data: {
	 		   					mNos:mNos
	 		   				},
	 		   				success:function(result){
	 		   					if(result > 0) {
	 		   						alert("선택한 쪽지를 삭제했습니다.");
	 	   							location.reload();
	 		   					}
	 		   				}, error:function(){
	 		   					console.log("실패");
	 		   				}
						})
						
					})
					
					$("#yesKeep").click(function(){
					
						const mNos = new Array();
						mNos.push('${ msg.inMsgNo }');
						
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


        </div>

    </div>
   

</body>
</html>