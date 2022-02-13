<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서원관리</title>
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
    .inform {
        height: 70px;
        border-bottom: 1px solid lightgray;
    }
    #inform1 {
        font-weight: bold;
        font-size: 20px;
        padding: 20px 0px 0px 0px;
    }
    .contents .topSet {
        width: 900px;
        margin-top: 40px;
    }
    .topSet {
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
    .contents .table th, td {
        text-align: center;
        font-size: small;
    }
    .contents .table {
        border-bottom: 2px solid rgb(223, 223, 223);
        margin-top: 40px;
    }
    .table thead {
        background-color: rgb(235, 231, 231);
    }
    .pagination { margin-top: 50px; }
    .allDept, .pointer, .thisDept {
        float: left;
        margin: 0px;
    }
    .allDept, .thisDept {
        width: 200px;
        height: 400px;
    }
    .pointer {
        width: 70px;
        height: 400px;
    }
    .pointer * {
        display: block;
    }
    .users {
        height: 350px;
        background-color: rgba(238, 231, 231, 0.74);
    }
    .users ul {
        padding-left: 30px;
        padding-top: 10px;
    }
    .users li {
        margin-bottom: 8px;
    }
    .modal-footer button {
        width: 150px;
    }
    .modal-footer {
        border: none;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .title {
        font-size: medium;
        margin-top: 7px;
        margin-bottom: 3px;
    }
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="sidebar.jsp" />
   
        <div class="contents">
          
            <!--안내문구-->
            <div class="inform">
                <p id="inform1">* 구성원 관리</p>
            </div>

            <!--드롭다운 | 추가버튼-->
            <div class="topSet">
                <!--드롭다운-->
                <div class="select">
                    <span style="font-size: 16px;">소속 : </span>
                    <!--부서select-->
                    <select name="deptCode" id="deptCode">
                        <option value="1">개발팀</option>
                        <option value="2">경영팀</option>
                        <option value="3">회계팀</option>                                    
                        <option value="4">인사팀</option>
                    </select>
                </div>
            
                <!--구성원추가버튼-->
                <button type="button" class="btn btn-primary" style="float: right;">구성원추가</button>
            </div>

            <!--임직원목록-->
            <table class="table">
                <thead>
                    <tr>
                        <th width=""><input type="checkbox"></th>
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
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td data-toggle="modal" data-target="#myModal">서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                </tbody>
            </table>

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

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        
        <div class="modal-dialog" style="width: 510px;">
        
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">구성원 추가하기</h4>
                </div>

                <div class="modal-body">

                    
                    <form class="searchbar">
                        <div class="input-group" style="width: 170px;">
                            <input type="text"  class="form-control" placeholder="사번 / 이름 검색">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit" style="height: 34px;">
                                <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <div class="contentOuter">
                        
                        <div class="allDept">
                            <p class="title">전체 구성원</p>
                            <div class="users">
                                <ul>
                                    <li>
                                        개발팀
                                        <ul>
                                            <li>이름</li>
                                            <li>이름</li>
                                            <li>이름</li>
                                        </ul>
                                    </li>
                                    <li>인사팀</li>
                                    <li>경영팀</li>
                                    <li>회계팀</li>
                                </ul>
                            </div>
                        </div>
                        <div class="pointer">
                            <i class="fa-regular fa-circle-right" style="font-size: 40px; margin-left:15px; margin-top: 135px; margin-bottom: 30px;"></i>
                            <i class="fa-regular fa-circle-left" style="font-size: 40px; margin-left:15px; margin-top: 40px; margin-bottom: 100px;"></i>
                        </div>
                        <div class="thisDept">
                            <p class="title">개발팀</p>
                            <div class="users">
                                <ul style="list-style: none; padding-left: 20px;">
                                    <li>강동원</li>
                                    <li>서강준</li>
                                    <li>강동원</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary">Primary</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        
        </div>

    </div>
    
   

</body>
</html>