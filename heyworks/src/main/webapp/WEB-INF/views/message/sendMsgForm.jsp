<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지쓰기</title>
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
    .contents button {
        width: 110px;
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
    #goCancel { margin-top: 20px;}
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
    #suggestion {
        border: 1px solid #979595;
        border-radius: 5px;
        margin-left: 80px;
        width: 187px;
        display:none;
    }
    #suggestion>ul { 
        list-style-type: none;
        padding-left: 0px;
        margin: 10px 0px 0px 10px; 
    }
    #suggestion>ul>li {
        font-size: small;
        margin: 7px 0px 7px 0px;
        padding-bottom: 5px;
    }
    #name { padding-left: 7px; }
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="messageSidebar.jsp" />
    
        <div class="contents">
			<form method="post" action="insert.msg">
			
	            <!-- 보내기 버튼 -->
	            <div class="buttons">
	                <button id="goRe" type="button" class="btn btn-primary" data-toggle="modal" data-target="#response">보내기</button>
	            </div>
	
	            <!-- 쪽지내용 -->
	            <div class="inform">
	                <table>
	                    <tr>
	                        <th>받는사람</th>
	                        <td><input type="text" id="name" name="name" id="name" required placeholder=" 이름"></td>
	                        <td><input type="text" id="recvNo" name="recvNo" style="display:none;"></td>
	                    </tr>
	                </table>
	                <div id="suggestion" style="position: absolute; z-index: 2;  background-color: rgb(255 255 255);">
	                    <ul class="result">
	                    </ul>
	                </div>
	            </div>
	            <div class="msg-content" style="position: relative; z-index: 1;">
	                <textarea id="outMsgContent" name="outMsgContent" class="form-control col-sm-13" rows="22" placeholder="내용을 입력해주세요."></textarea>
	            </div>
	            
	            <!-- 전송 Modal -->
	            <div id="response" class="modal fade" role="dialog">
	                <div class="modal-dialog modal-sm">
	            
	                    <!-- Modal content-->
	                    <div class="modal-content">
	                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
	                            쪽지를 전송하시겠습니까?
	                        </div>
	                        <div class="modal-footer" style="text-align: center;">
	                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
	                            <button type="submit" style="margin-right:40px;" class="btn btn-primary">전송</button>
	                        </div>
	                    </div>
	            
	                </div>
	            </div>
	            
            </form>
            
            <!-- 돌아가기 버튼 -->
            <button id="goCancel" type="button" class="btn btn-default" data-toggle="modal" data-target="#cancel">돌아가기</button>

            <!-- 돌아가기 Modal -->
            <div id="cancel" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            작성내용을 삭제하고<br>쪽지함으로 돌아가시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button id="yesCancel" type="button" style="margin-right:40px;" class="btn btn-danger">돌아가기</button>
                        </div>
                    </div>
            
                </div>
            </div>   
            
            
            <!-- 돌아가기 -->
            <script>
            	$(function(){
            		
					$("#yesCancel").click(function(){
						location.href="list.inMsg";
					})
            		
            	})
            </script>
            
            <!--임직원 자동완성-->
            <script>

                $(function() {
            
                    $("#name").keyup(function(){
                    	
                        var keyword = $(this).val();
                        
	                	if(keyword.length == 0) {
	                		$("#suggestion").hide();
	                	}else if(keyword.length >= 1){
                           	$("#suggestion").show();
	                    	$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
		                            url: "search.name",
		                            data: { userName : keyword },
		                            method: "GET",
		                            success:function(list){
		                            	
		                            	//console.log(list);
	                            		if(list.length >= 1) {
		                            		
		                            		var result = "";
		                            		for(let i in list) {
			                            		result += "<li>"
			                            				+ "<i class='fa-solid fa-magnifying-glass'>&nbsp;</i>"
			                            				+ "<span class='usern' style='display:none;'> " + list[i].userNo + "</span>"
			                            				+ "<span class='usernm'> " + list[i].userName + "</span>"
			                            		        + "<span> | " + list[i].deptName  + "</span>"
			                            		        + "<span>(" + list[i].jobName + ")</span>"
			                            		        + "</li>";
	                           		   			$(".result").html(result);
			                            	}
		                            		
		                            	}else if(list.length <= 0) {
		                            		$("#suggestion").hide();
		                            	}
		                            	
		                            }, error:function(){
		                                console.log("ajax통신실패");
		                            }
	                        })       // Ajax 응답을 정상적으로 받으면 실행됨.
	                	}
                    })
            
                });
            
            </script>
            
            <!-- input값 채워주기 -->
            <script>
            	$(document).on('click', '#suggestion>ul>li', function(){
            		var userNo = $(this).children().siblings('.usern').text();
            		var userName = $(this).children().siblings('.usernm').text();
            		//console.log(userNo);
            		$("#suggestion").hide();
            		$("#name").val(userName);
            		$("#recvNo").val(userNo);
            	})
            </script>

            


        </div>

    </div>
   

</body>
</html>