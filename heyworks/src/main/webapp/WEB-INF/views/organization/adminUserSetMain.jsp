<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin-top:20px;
        margin-left:40px;
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
        margin-top: 30px;
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
</style>
</head>
<body>

   <div class="outer">
   
      <jsp:include page="../common/menubar.jsp" />
      <jsp:include page="sidebar.jsp" />
   
      <div class="contents">
          
            <!--사용자 추가 버튼-->
            <div class="userPlus">
                <i class="fa-solid fa-circle-plus" style="font-size: 20px;""> 사용자 추가</i>
            </div>

            <!--드롭다운 | 검색바-->
            <div class="search-area">
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
            
                <!--검색바-->
                <form class="searchbar">
                    <div class="input-group">
                    <input type="text" class="form-control" placeholder="사번 / 이름 검색">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
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
                        <td>서강준</td>
                        <td>jooni1322</td>
                        <td>02) 132-1234</td>
                        <td>010-1231-1231</td>
                        <td>경영팀</td>
                        <td>대표이사</td>
                        <td>재직</td>
                    </tr>
                </tbody>
            </table>

            <!--삭제|직위변경|상태변경-->
            <div class="settings">
                <button type="button">삭제</button>
                <button type="button">직위변경</button>
                <button type="button" style="border: 0px;">상태변경</button>
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