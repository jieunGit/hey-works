<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        margin-top:10px;
        margin-left:50px;
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
        margin-top: 30px;
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
    input[type=text], input[type=password], input[type=date], input[type=number], #deptCode, #jobCode, #status {
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
    #delImg:hover {
    	cursor: pointer;
    }
</style>
</head>
<body>

   <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="adminOrganSidebar.jsp" />
   
        <div class="contents">
          
            <!--안내문구-->
            <div class="inform">
                <p id="inform1">* 사용자 정보 수정</p>
            </div>

            <!--입력폼-->
            <form class="insertForm" method="post" action="update.organ" enctype="multipart/form-data">

                <div class="required">

                    <!--이미지-->
                    <div id="img-area">
                    	<div id="delImg" onclick="delImg();" style="float: right;"><i class="fa-solid fa-x"></i></div>
                        <img id="preview" src="${ o.image }" style="width:110px; height:110px; border-radius: 100px;"> <!--기본값은 user.png-->
                        <button type="button" onclick="clickImg();" class="btn btn-primary">사진 첨부하기</button>
                        <input type="file" id="image" style="display:none;" name="upfile" onchange="loadImg(this);">
                    </div>
                    <!--필수입력사항-->
                    <ul id="input1">
                        <li>
                            <span>이름*</span>
                            <label><input type="text" name="userName" id="userName" value="${ o.userName }" required></label>
                        </li>
                        <li>
                            <span>ID*</span>
                            <label><input type="text" name="userId" id="userId" value="${ o.userId }" readOnly required></label>
                            <div id="idResult" style="font-size: 0.8em; margin-left: 115px;">* 아이디는 변경이 불가능합니다.</div>
                        </li>
                        <li>
                            <span>비밀번호*</span>
                            <label><input type="password" name="userPwd" id="userPwd" value="${ o.userPwd }" required></label>
                        </li>
                        <li>
                            <span>비밀번호확인*</span>
                            <label><input type="password" name="userPwdCheck" id="userPwdCheck"></label>
                            <div id="pwdResult" style="font-size: 0.8em; margin-left: 115px; display:none;"></div>
                        </li>
                    </ul>

                    <!--서브입력사항-->
                    <ul id="input2">
                        <li>
                            <span>사번*</span>
                            <label><input type="number" name="userNo" id="userNo" value="${ o.userNo }" readOnly required></label>
                            <div id="noResult" style="font-size: 0.8em; margin-left: 115px;">* 사번은 변경이 불가능합니다.</div>
                        </li>
                        <li>
                            <span>입사일*</span>
                            <label><input type="date" name="hire" id="hireDate" value="${ o.hire }" required></label>
                        </li><li>
                            <span>부서*</span>
                            <label>
                                <!--부서select-->
			                    <select name="deptCode" id="deptCode">
			                    	<option value="0">전체</option>
			                    	<c:forEach var="d" items="${ dept }">
			                    		<option value="${ d.deptCode }" <c:if test="${o.deptCode eq d.deptCode}">selected="selected"</c:if>>${ d.deptName }</option>
			                    	</c:forEach>
			                    </select>
                            </label>
                        </li><li>
                            <span>직급</span>
                            <label>
                                <!--직급select-->
                                <select name="jobCode" id="jobCode">
                                    <option <c:if test="${o.jobCode eq 1}">selected="selected"</c:if> value="1">사원</option>
                                    <option <c:if test="${o.jobCode eq 2}">selected="selected"</c:if> value="2">주임</option>
                                    <option <c:if test="${o.jobCode eq 3}">selected="selected"</c:if> value="3">대리</option>                                    
                                    <option <c:if test="${o.jobCode eq 4}">selected="selected"</c:if> value="4">과장</option>
                                    <option <c:if test="${o.jobCode eq 9}">selected="selected"</c:if> value="9">이사</option>
                                </select>
                            </label>
                        </li><li>
                            <span>이메일</span>
                            <label><input type="text" name="email" id="email" value="${ o.email }"></label>
                        </li><li>
                            <span>사내전화</span>
                            <label><input type="text" name="call" id="call" value="${ o.call }" placeholder="02) 입력"></label>
                        </li><li>
                            <span>휴대전화</span>
                            <label><input type="text" name="phone" id="phone"value="${ o.phone }" placeholder="-포함하여 입력"></label>
                        </li><li>
                            <span>상태*</span>
                            <label>
                                <!--상태select-->
                                <select name="status" id="status" required>
                                    <option <c:if test="${o.status eq 'Y'}">selected="selected"</c:if> value="Y">재직</option>
                                    <option <c:if test="${o.status eq 'N'}">selected="selected"</c:if> value="N">퇴사</option>
                                    <option <c:if test="${o.status eq 'R'}">selected="selected"</c:if> value="R">휴직</option>     
                                </select>
                            </label>
                        </li>
                    </ul>
                    
                    <div class="buttons">
                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <button type="button" class="btn btn-danger">취소하기</button>
                    </div>

                </div>
                

            </form>



        </div>

   </div>
    
    <!-- 비밀번호확인 -->
	<script>
		$(function(){
			
			const $pwdCk = $(".insertForm input[name=userPwdCheck]");
			
			$pwdCk.keyup(function(){
				
				const pwd = $(".insertForm input[name=userPwd]").val();
				const pwdCk = $(".insertForm input[name=userPwdCheck]").val();
				
				if(pwd != pwdCk) {
					
					$("#pwdResult").show();
                    $("#pwdResult").css("color", "red").text("비밀번호가 일치하지 않습니다!");
                    
                    $(".insertForm :submit").attr("disabled", true);
					
				}else if(pwd == pwdCk) {
					
					$("#pwdResult").show();
                    $("#pwdResult").css("color", "blue").text("OK!");
                    
                    $(".insertForm :submit").removeAttr("disabled");
					
				}
					
			})
			
		})
	</script>

	<script>
        function clickImg(){
            $("#image").click();
        }
        function delImg(){
        	$("#image").val("");
        	$("#preview").attr("src", "resources/images/user.jpg");
        }
        function loadImg(inputFile){
        	
            // 1. 파일을 읽어들일 FileReader 객체를 생성 (자바스크립트 제공객체)
            const reader = new FileReader();

            // 2. 파일을 읽어들이는 메소드 생성
            reader.readAsDataURL(inputFile.files[0]);
            // readAsDataURL  : 파일을 읽어들이는 순간 내부적으로 이 파일만의 고유한 url부여

            // 파일 읽어들이기가 완료됐을 때 실행할 함수 정의해두기
            reader.onload = function(e){
                $("#preview").attr("src", e.target.result);
            }

        }
    </script>
</body>
</html>