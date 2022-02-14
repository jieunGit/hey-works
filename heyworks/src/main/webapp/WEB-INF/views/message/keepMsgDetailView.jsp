<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관쪽지함</title>
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
        <jsp:include page="sidebar.jsp" />
    
        <div class="contents">

            <!-- 삭제|답장|이전|다음 버튼 -->
            <div class="buttons">
                <button id="goDel" type="button" class="btn" style="width: 70px;" data-toggle="modal" data-target="#delete">삭제</button>
                <button id="goRe" type="button" class="btn btn-primary" style="margin-right: 25px; width: 70px;">답장</button>
                <button id="goPrev" type="button" class="btn" style="border-radius: 15px;">&lt;&nbsp; prev</button>
                <button id="goNext" type="button" class="btn" style="border-radius: 15px;">next &nbsp;&gt; </button>
            </div>

            <!-- 쪽지내용 -->
            <div class="inform">
                <table>
                    <tr>
                        <th>보낸사람</th>
                        <td>서강준님</td>
                    </tr>
                    <tr>
                        <th>받은시간</th>
                        <td>22-01-20 [13:30]</td>
                    </tr>
                </table>
            </div>
            <div class="msg-content">
                <textarea id="comment" readonly></textarea>
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
                            <button type="button" class="btn btn-danger">삭제</button>
                        </div>
                    </div>
            
                </div>
            </div>


        </div>

    </div>
   

</body>
</html>