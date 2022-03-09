<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		height:2000px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        width: 900px;
        height: 900px;
        margin-left:150px;
    }
    #change-pwd>img{
        margin-left: 400px;
        margin-top: 50px;
        width: 100px;
        height: 100px;
    }
    #change-pwd>h4{
        font-weight: 800;
        text-align: left;
    }
    #change-pwd>h4>p{
        float: left; 
        width: 500px; 
        text-align: right;
    }
    .elec-outer>p{
        font-size: 12px;
        color: rgb(136, 136, 136);
        margin-left: 10px;
    }
    #checkpwd{
        width: 100%;
        height: 350px;
        border: 1px solid gainsboro;
        background-color:whitesmoke;
    }
    #checkpwd>form *{float: left;}
    .discription{
        width: 150px;
        margin-left: 200px;
        text-align: left;
    }
    #checkpwd>form input[type=password], #checkpwd>form input[type=text]{width: 300px;}
    .btn-lg{
        margin-left: 350px;
        width: 250px;    
    }
    .info{
        font-size: 12px; 
        width: 650px; 
        text-align: right;
        line-height: 30px;
    }
    #showpwd{margin-top: 10px; margin-left: 10px;}
</style>
</head>
<body>
	
		
	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
	
		<div class="elec-outer">
	        <div id="change-pwd">
	            <img src="resources/images/lock.png">
	            <br><br><br>
	            <h4 style="text-align: center;">보다 안전한 서비스 이용을 위해</h4>
	            <h4><p class="text-primary">비밀번호를 변경</p>하세요</h4>
	        </div>
	        <br><br>
	        
	        <p>비밀번호가 초기 비밀번호와 같습니다. <br>
	           계정 사용자가 직접 변경한 비밀번호가 아니므로, 개인정보보호를 위해 비밀번호를 변경해주세요.</p>
	        
	        <hr>
	
	        <p>* 비밀번호 변경 후에 헤이웍스 서비스를 정상적으로 이용할 수 있습니다.</p>
	        <p>* 비밀번호는 영문, 숫자, 특수문자(!@#$%^&*)를 포함하여 8~12글자 이상 입력하세요.</p>
	        <br><br>
	        
	        <div id=checkpwd>
	            <br><br><br>
	            <form action="updatePwd.em" method="post">
	            	<input type="hidden" name="userId" value="${userId}">
	                <p class="discription">현재 비밀번호</p> <input type="password" id="origin-pwd" class="form-control" name="" required> <br><br>
	                <p class="info" id="no-origin"></p><br><br>
	
	                <p class="discription">새 비밀번호</p> <input type="password" id="new-pwd" class="form-control" name="userPwd" required disabled>
	                <input type="checkbox" id="showpwd"><p style="line-height: 35px; font-size: 11px; margin-left: 5px;">비밀번호 보기</p>
	                <br><br>
	                <p class="info" id="pwd-info"></p><br><br>
	
	                <p class="discription">새 비밀번호 확인</p> <input type="password" id="new-pwd-check" class="form-control" required disabled> <br><br>
	                <p class="info" id="pwd-chk-info"></p>
	                <br><br><br><br>
	
	                <button type="submit" class="btn btn-lg btn-outline-primary" onclick="return validate();" disabled>변경하기</button>
	            </form>
	        </div>
	
	    </div>
	</div>
	
    <script>
        /*현재 비밀번호와 일치 여부 확인*/
        $(function(){

            const oripwd = "1234"; /*임시비밀번호 */
            const $userpwd = $("#origin-pwd"); /*현재비밀번호와 일치하는지 확인*/
            const $newpwd = $("#new-pwd"); /*새 비밀번호*/
            const $newpwdchk = $("#new-pwd-check"); /*새 비밀번호 확인*/
            const $norigin = $("#no-origin"); /*현재 비밀번호 안내창*/

            $userpwd.keyup(function(){
                
                if(oripwd == $userpwd.val()){

                    $newpwd.removeAttr("disabled");
                    $newpwdchk.removeAttr("disabled");
                    $(".btn-lg").removeAttr("disabled");
                    $norigin.css("color", "green").text("정확해요!");

                }else{

                    $newpwd.attr("disabled", true);
                    $newpwdchk.attr("disabled", true);
                    
                    if($userpwd.val() == ""){
                        $norigin.text("");
                    }else{  
                        $norigin.css("color", "red").text("현재 비밀번호와 일치하지 않습니다.");
                    }
                }
            })
        })

        /*새 비밀번호 유효성 검사*/
        $("#new-pwd").keyup(function(){

            let regExp = /^[a-z\d!@#$%^&*]{8,12}$/i;
            const $newpwd = $("#new-pwd"); /*새 비밀번호*/

            if(!regExp.test($("#new-pwd").val())){

                $("#pwd-info").css("color", "red").text("유효하지 않은 비밀번호입니다.");

                if($("#new-pwd").val() == ""){
                    $("#pwd-info").text("");
                }
            }else{
                $("#pwd-info").css("color", "green").text("멋있어요!");
            }
        })


        /*비밀번호 텍스트로 보여주기*/
        $("input[type='checkbox']").click(function(){

            const $check = $("input[type='checkbox']").prop("checked");

            if($check){
                $("input[type='password']").attr("type", "text");
            }else{
                $("input[type='text']").attr("type", "password");
            }

        })

        /* 새 비밀번호와 비밀번호 확인 일치 확인*/
        function validate(){

            let $new = $("#new-pwd").val();
            let $newchk = $("#new-pwd-check").val();

            if($new != $newchk){
            	
            	alert("비밀번호가 일치하지 않습니다!");
            	location.href="updatePwdForm.em";
            	return false;
            }
        }
    </script>

</body>
</html>