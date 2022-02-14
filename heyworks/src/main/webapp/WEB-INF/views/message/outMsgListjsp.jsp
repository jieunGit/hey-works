<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸쪽지함</title>
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
    .searchbar {
        width: 250px;
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
    }
    .table thead {
        background-color: rgb(235, 231, 231);
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
        <jsp:include page="sidebar.jsp" />
   
        <div class="contents">

            <div class="top">
                <!-- 검색바 -->
                <form class="searchbar">
                    <div class="input-group">
                    <input type="text" class="form-control" placeholder="사번 / 이름 검색">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" style="height: 34px;">
                        <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                    </div>
                </form>

                <span id="count">보낸쪽지함 n개</span>
            </div>
            

            <!-- 받은쪽지내용 -->
            <table class="table">
                <thead>
                    <tr>
                        <th width="90"><input type="checkbox"></th>
                        <th width="150">수신인</th>
                        <th width="">내용</th>
                        <th width="200">날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>오늘 회의자료 이메일로 보내주세요</td>
                        <td>2020-01-20 [11:30]</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>오늘 회의자료 이메일로 보내주세요</td>
                        <td>2020-01-20 [11:30]</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>오늘 회의자료 이메일로 보내주세요</td>
                        <td>2020-01-20 [11:30]</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>오늘 회의자료 이메일로 보내주세요</td>
                        <td>2020-01-20 [11:30]</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>오늘 회의자료 이메일로 보내주세요</td>
                        <td>2020-01-20 [11:30]</td>
                    </tr>
                </tbody>
            </table>

            <!-- 삭제 버튼 -->
            <div class="buttons">
                <button id="goDel" type="button" class="btn" style="margin-right: 10px;" data-toggle="modal" data-target="#delete">삭제</button>
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

            <!-- 페이징바 -->
            <ul class="pagination" style="margin-left: 350px;">
                <li><a href="#"><</a></li>
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">></a></li>
            </ul>
            
            
        </div>
    </div>
   

</body>
</html>