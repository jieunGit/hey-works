<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장하기</title>
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
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="sidebar.jsp" />
    
        <div class="contents">

            <!-- 보내기 버튼 -->
            <div class="buttons">
                <button id="goRe" type="button" class="btn btn-primary" data-toggle="modal" data-target="#response">보내기</button>
            </div>

            <!-- 쪽지내용 -->
            <div class="inform">
                <table>
                    <tr>
                        <th>받는사람</th>
                        <td>서강준님(지정)</td>
                    </tr>
                </table>
            </div>
            <div class="msg-content">
                <textarea id="comment" placeholder="내용을 입력해주세요."></textarea>
            </div>
            
            <!-- 돌아가기 버튼 -->
            <button id="goCancel" type="button" class="btn" data-toggle="modal" data-target="#cancel">돌아가기</button>

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
                            <button type="button" class="btn btn-primary">전송</button>
                        </div>
                    </div>
            
                </div>
            </div>

            <!-- 이전 Modal -->
            <div id="cancel" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            작성내용을 삭제하고<br>이전으로 돌아가시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button type="button" class="btn btn-danger">돌아가기</button>
                        </div>
                    </div>
            
                </div>
            </div>   


        </div>

    </div>
   

</body>
</html>