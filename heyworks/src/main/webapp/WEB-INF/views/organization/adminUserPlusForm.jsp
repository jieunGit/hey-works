<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자추가</title>
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
        height: 80px;
        border-bottom: 1px solid lightgray;
    }
    #inform1 {
        font-weight: bold;
        font-size: 20px;
        padding: 20px 0px 0px 20px;
        margin-bottom: 3px;
    }
    #inform2 {
        padding: 0px 0px 0px 20px;
    }
    #img-area {
        width: 110px;
    }
    #img-area img {
        width: 110px;
        display: block;
    }
    #img-area button {
        width: 110px;
        display: block;
        margin-top: 5px;
        font-size: 11px;
    }
    .required {
        margin-top: 60px;
    }
    ul, ol, li {
        list-style: none;
        margin: 0px;
    }
    li {
        padding: 10px 0 0 0;
    }
    li>span {
        display: inline-block;
        width: 110px;
        font-size: 14px;
    }
    input[type=text], input[type=password], input[type=date], input[type=number], #deptCode, #jobCode {
        border: 1px #cfcfcf solid;
        padding: 0 4px;
        color: #444;
        font-weight: normal;
        width: 199px;
        height: 28px;
        line-height: 27px;
        vertical-align: middle;
    }
    #img-area, #input1 {
        display: inline-block;
    }
    #input2 {
        padding: 30px 0 0 0;
    }
    .buttons button {
        width: 230px;
        height: 35px;
        margin: 60px 30px 0px 0px;
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
                <p id="inform1">* 사용자 추가</p>
                <p id="inform2">- 여기서 설정한 비밀번호는 임시비밀번호로 사용자가 직접 1회 비밀번호를 변경 후 오피스 사용이 가능합니다.</p>
            </div>

            <!--입력폼-->
            <form class="insertForm" enctype="multipart/form-data">

                <div class="required">

                    <!--이미지-->
                    <div id="img-area">
                        <img src="user.png"> <!--기본값은 user.png-->
                        <button type="button" class="btn btn-default">기본이미지 사용</button>
                        <button type="button" class="btn btn-primary">사진 첨부하기</button>
                    </div>
                    <!--필수입력사항-->
                    <ul id="input1">
                        <li>
                            <span>이름*</span>
                            <label><input type="text" name="userName" id="userName"></label>
                        </li>
                        <li>
                            <span>ID*</span>
                            <label><input type="text" name="userId" id="userId"></label>
                        </li>
                        <li>
                            <span>비밀번호*</span>
                            <label><input type="password" name="userPwd" id="userPwd"></label>
                        </li>
                        <li>
                            <span>비밀번호확인*</span>
                            <label><input type="password" name="userPwdCheck" id="userPwdCheck"></label>
                        </li>
                    </ul>

                    <!--서브입력사항-->
                    <ul id="input2">
                        <li>
                            <span>사번</span>
                            <label><input type="number" name="userNo" id="userNo"></label>
                        </li>
                        <li>
                            <span>입사일</span>
                            <label><input type="date" name="hireDate" id="hireDate"></label>
                        </li><li>
                            <span>부서</span>
                            <label>
                                <!--부서select-->
                                <select name="deptCode" id="deptCode">
                                    <option value="1">개발팀</option>
                                    <option value="2">경영팀</option>
                                    <option value="3">회계팀</option>                                    
                                    <option value="4">인사팀</option>
                                </select>
                            </label>
                        </li><li>
                            <span>직급</span>
                            <label>
                                <!--직급select-->
                                <select name="jobCode" id="jobCode">
                                    <option value="1">사원</option>
                                    <option value="2">주임</option>
                                    <option value="3">대리</option>                                    
                                    <option value="4">과장</option>
                                    <option value="9">대표이상</option>
                                </select>
                            </label>
                        </li><li>
                            <span>이메일</span>
                            <label><input type="text" name="email" id="email"></label>
                        </li><li>
                            <span>사내전화</span>
                            <label><input type="text" name="call" id="call"></label>
                        </li><li>
                            <span>휴대전화</span>
                            <label><input type="text" name="phone" id="phone"></label>
                        </li><li>
                            <span>상태</span>
                            <label>
                                <!--상태select-->
                                <select name="status" id="status">
                                    <option value="Y">재직</option>
                                    <option value="N">퇴사</option>
                                    <option value="R">휴직</option>     
                                </select>
                            </label>
                        </li>
                    </ul>
                    
                    <div class="buttons">
                        <button type="button" class="btn btn-primary">추가하기</button>
                        <button type="button" class="btn btn-danger">취소하기</button>
                    </div>

                </div>
                

            </form>



        </div>

   </div>
   

</body>
</html>