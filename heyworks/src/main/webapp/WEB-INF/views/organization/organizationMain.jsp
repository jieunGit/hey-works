<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도</title>
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
        margin-bottom: 50px;
    }
    .contents .input-group {
        width: 350px;
    }
    .chart {
        width: 900px;
        padding-bottom: 40px;
        border-bottom: 1px solid lightgray;
    }
    .chart dl{
        display: inline-block;
        width: 160px;
        height: 72px;
        margin-top: 20px;
        margin-right: 16px;
        position: relative;
        cursor: pointer;
    }
    .chart .picture {
        position: absolute;
        top: 0;
        left: 0;
        width: 70px;
        height: 70px;
        border: 1px solid #d2d2d2;
        border-radius: 4px;
    }
    .chart .name {
        padding-top: 3px;
        padding-bottom: 5px;
        font-weight: bold;
    }
    .chart .name, .chart .teams, .chart .position {
        margin-left: 80px;
        width: 136px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .chart-area .deptName {
        margin-top: 30px;
    }
    .detail1 {
        width: 250px;
        height: 80px;
    }
    .detail1 .image {
        float: left;
        width:80px;
        height:80px;
    }
    .image img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
    }
    .detail1 .inform {
        width: 160px;
        height: 80px;
    }
    .inform ul {
        padding-left: 13px;
        margin-top: 8px;
        list-style: none;
    }
    .image, .inform {
        display: inline-block;
    }
    .modal-body { margin-left: 10px; }
    .detail2 table {
        font-size: 14px;
        margin-top: 10px;
    }
    .detail2 th {
        width: 82px;
        height: 20px;
        text-align: left;
    }
    .myModal { margin-top: 50%; }
    /* modal position(center)*/
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
</style>
</head>
<body>
    
    <div class="outer">
   
      <jsp:include page="../common/menubar.jsp" />
      <jsp:include page="organization_sidebar.jsp" />
   
        <div class="contents">
          
            <!--검색바-->
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
            
            <!--조직도-->
            <div class="chart-area">

                <!--소속임직원-->
                <div class="deptName">
                    <i class="fa-solid fa-bars" style="font-size: 20px;"> 개발팀</i>
                </div>
                <div class="chart">
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                </div>

                <div class="deptName">
                    <i class="fa-solid fa-bars" style="font-size: 20px;"> 경영팀</i>
                </div>
                <div class="chart">
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                    <dl data-toggle="modal" data-target="#myModal" onclick="">
                        <dt class="name">강보람</dt>
                        <dd class="picture">
                            <img class="image" width="70px" height="70px" src="" style="display: inline-block;">
                        </dd>
                        <dd class="teams">개발팀</dd>
                        <dd class="position">부장</dd>
                    </dl>
                </div>
                
            </div>
        </div>
    </div>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
    
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h5 class="modal-title">직원정보</h5>
                </div>

                <div class="modal-body">
                    <div class="detail1">
                        <div class="image">
                            <img src="사진">
                        </div>
                        <div class="inform">
                            <ul>
                                <li><b>직원명</b></li>
                                <li>SAMJO | xx팀</li>
                                <li>직급</li>
                            </ul>
                        </div>
                    </div>
                    <div class="detail2">
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td>usermail@naver.com</td>
                            </tr>
                            <tr>
                                <th>사내전화</th>
                                <td>02) 123-1234</td>
                            </tr>
                            <tr>
                                <th>휴대전화</th>
                                <td>010-1234-1234</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn">쪽지보내기</button>
                    <button type="button" class="btn btn-primary">이메일 복사</button>
                </div>
            </div>
    
        </div>
    </div>

    
   

</body>
</html>