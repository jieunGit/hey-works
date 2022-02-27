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
                <p id="inform1">* 사용자 추가</p>
                <p id="inform2">- 여기서 설정한 비밀번호는 임시비밀번호로 사용자가 직접 1회 비밀번호를 변경 후 오피스 사용이 가능합니다.</p>
            </div>

            <!--입력폼-->
            <form class="insertForm" method="post" action="insert.organ" enctype="multipart/form-data">

                <div class="required">

                    <!--이미지-->
                    <div id="img-area">
                    	<div id="delImg" onclick="delImg();" style="float: right;"><i class="fa-solid fa-x"></i></div>
                        <img id="preview" src="resources/images/user.jpg" style="width:110px; height:110px; border-radius: 100px;"> <!--기본값은 user.png-->
                        <button type="button" onclick="clickImg();" class="btn btn-primary">사진 첨부하기</button>
                        <input type="file" id="image" style="display:none;" name="upfile" onchange="loadImg(this);">
                    </div>
                    <!--필수입력사항-->
                    <ul id="input1">
                        <li>
                            <span>이름*</span>
                            <label><input type="text" name="userName" id="userName" required></label>
                        </li>
                        <li>
                            <span>ID*</span>
                            <label><input type="text" name="userId" id="userId" placeholder="5글자 이상 입력해주세요" required></label>
                            <div id="idResult" style="font-size: 0.8em; margin-left: 115px; display:none;"></div>
                        </li>
                        <li>
                            <span>비밀번호*</span>
                            <label><input type="password" name="userPwd" id="userPwd" placeholder="임시비밀번호 : 1234" required></label>
                        </li>
                        <li>
                            <span>비밀번호확인*</span>
                            <label><input type="password" name="userPwdCheck" id="userPwdCheck" required></label>
                            <div id="pwdResult" style="font-size: 0.8em; margin-left: 115px; display:none;"></div>
                        </li>
                    </ul>

                    <!--서브입력사항-->
                    <ul id="input2">
                        <li>
                            <span>사번*</span>
                            <label><input type="number" name="userNo" id="userNo"></label>
                            <div id="noResult" style="font-size: 0.8em; margin-left: 115px; display:none;"></div>
                        </li>
                        <li>
                            <span>입사일*</span>
                            <label><input type="date" name="hire" id="hireDate" required></label>
                        </li><li>
                            <span>부서*</span>
                            <label>
                                <!--부서select-->
                                <select name="deptCode" id="deptCode" required>
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
                                    <option value="9">이사</option>
                                </select>
                            </label>
                        </li><li>
                            <span>이메일</span>
                            <label><input type="text" name="email" id="email"></label>
                        </li><li>
                            <span>사내전화</span>
                            <label><input type="text" name="call" id="call" placeholder="02) 입력"></label>
                        </li><li>
                            <span>휴대전화</span>
                            <label><input type="text" name="phone" id="phone" placeholder="-포함하여 입력"></label>
                        </li><li>
                            <span>상태*</span>
                            <label>
                                <!--상태select-->
                                <select name="status" id="status" required>
                                    <option value="Y">재직</option>
                                    <option value="N">퇴사</option>
                                    <option value="R">휴직</option>     
                                </select>
                            </label>
                        </li>
                    </ul>
                    
                    <div class="buttons">
                        <button type="submit" class="btn btn-primary">추가하기</button>
                        <button type="button" class="btn btn-danger">취소하기</button>
                    </div>

                </div>
                

            </form>



        </div>

   </div>
   
   
   
   <!-- 아이디 유효성검사 -->
   <script>
       $(function(){
    	   
          // 아이디 입력하는 input요소객체 변수에 담아두기
          const $id = $(".insertForm input[name=userId]");
          
          $id.keyup(function(){
             
             if($id.val().length >= 5){
            	 
                $.ajax({
                   url:"idCheck.organ",
                   data:{id:$id.val()},
                   success:function(result){
                      if(result == "NN"){ // 사용불가능
                    	  
                         $("#idResult").show();
                         $("#idResult").css("color", "red").text("중복된 아이디가 존재합니다.");
                         
                         $(".insertForm :submit").attr("disabled", true);
                      }else{ // 사용가능
                    	 
                    	  $("#idResult").show();
                          $("#idResult").css("color", "blue").text("OK!");
                          
                          $(".insertForm :submit").removeAttr("disabled");
                      }
                      
                   },error:function(){
                      console.log("아이디 중복체크용 ajax 통신 실패");
                   }
                });
                
             }else{ // 5글자 미만일 경우 => 버튼 비활성화, 메세지 숨기기
                $("#idResult").hide();
                $(".insertForm :submit").attr("disabled", true);
             }
             
             
          })
          
          
       })
    </script>
    
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
					
				}
					
			})
			
		})
	</script>
	
	<!-- 사번 유효성검사 -->
	<!-- 아이디 유효성검사 -->
    <script>
       $(function(){
    	   
          // 아이디 입력하는 input요소객체 변수에 담아두기
          const $no = $(".insertForm input[name=userNo]");
          
          $no.keyup(function(){
             
             if($no.val().length >= 8){
                
                $.ajax({
                   url:"noCheck.organ",
                   data:{no:$no.val()},
                   success:function(result){
                      if(result == "NN"){ // 사용불가능
                    	  
                         $("#noResult").show();
                         $("#noResult").css("color", "red").text("중복된 사번이 존재합니다.");
                         
                         $(".insertForm :submit").attr("disabled", true);
                      }else{ // 사용가능
                    	 
                    	  $("#noResult").show();
                          $("#noResult").css("color", "blue").text("OK!");
                          
                          $(".insertForm :submit").removeAttr("disabled");
                      }
                      
                   },error:function(){
                      console.log("아이디 중복체크용 ajax 통신 실패");
                   }
                });
                
             }else{ // 5글자 미만일 경우 => 버튼 비활성화, 메세지 숨기기
            	$("#noResult").show();
                $("#noResult").css("color", "red").text("사번은 8자리 숫자로 구성하여주세요");
                $(".insertForm :submit").attr("disabled", true);
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