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
		height:1200px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        width: 1100px;
        height: 1100px;
    }
    #update-info{
        margin: auto;
        width: 900px;
        border: 1px solid lightgray;
    }
    .updateme th, .updateme td{
        height: 50px;
        padding: 10px;
    }
    .updateme th{padding-left: 100px;}
    .updateme input{width: 400px;}
    #btns{
        width: 100%;
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .subject{
        color: black;
        font-size: 20px;
        font-weight: 800;
    }
    .subject:hover{
        color: black;
        text-decoration: none;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		
		
		<div class="elec-outer">

        <a href="" class="subject">내 정보 관리</a>
        <br><br>
        <hr>

        <div id="update-info">
            <form action="update.em" method="post">
            	<input type="hidden" value="${loginUser.userNo}" name="userNo">
            	<input type="hidden" value="${loginUser.userId}" name="userId">
                <table align="center" class="updateme">
                    <tr>
                        <th width="300">이름</th>
                        <td width="600" colspan="2">${loginUser.userName}</td>
                    </tr>
                    <tr>
                        <th>사번</th>
                        <td colspan="2">${loginUser.userNo}</td>
                    </tr>
                    <tr>
                        <th>입사일</th>
                        <td colspan="2">${loginUser.hireDate}</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td colspan="2">${loginUser.birth}</td>
                    </tr>
                    <tr>
                        <th>소속</th>
                        <td colspan="2">${loginUser.deptName}</td>
                    </tr>
                    <tr>
                        <th>직위</th>
                        <td colspan="2">사원</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2">${loginUser.email}</td>
                    </tr>
                    <tr>
                        <th>사내전화</th>
                        <td colspan="2">
                            <input type="text" name="call" value="${loginUser.call}" class="form-control" placeholder="(-)포함">
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td colspan="2">
                            <input type="text" name="phone" value="${loginUser.phone}" class="form-control" placeholder="(-)포함">
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td width="200">
                            <input type="text" id="postcode" name="post" placeholder="우편번호" value="${loginUser.post}" class="form-control">
                        </td>
                        <td>
                            <button type="button" onclick="daumPostcode();"class="btn btn-sm btn-outline-primary">우편번호 찾기</button>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2">
                            <input type="text" id="address" name="address" placeholder="주소" value="${loginUser.address}" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td colspan="2">
                            <input type="text" id="detailAddress" name="addressDetail" placeholder="상세주소" value="${loginUser.addressDetail}" class="form-control">
                        </td>
                    </tr>
                </table>

                <div id="btns" align="center">
                    <button type="submit" class="btn btn0sm btn-primary">수정하기</button>
                    <button type="button" onclick="history.back();" class="btn btn-sm">취소하기</button>
                </div>
            </form>
        </div>
    </div>


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

    <script>
        function daumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("detailAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("detailAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>
		
	
	</div>




	

</body>
</html>