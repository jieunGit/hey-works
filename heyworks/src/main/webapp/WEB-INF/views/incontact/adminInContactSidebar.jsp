<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>

<style>
    .sidebar{
        width: 180px;
        height: 800px;
        border: 1px solid lightgray;
    }
    .sidebar *{
        width: 100%;
        list-style-type: none;
    }
    .title {
        padding-top: 12px;
        margin: 20px 0px 10px 15px;
        width: 100%;
        height: 50px;
    }
    .sidebar ul { padding: 0px; }
    .sidebar li{
        padding: 5px 5px 5px 5px;
    }
    .sidebar>ul>li>button {
        height: 40px;
    }
    .addressgroup{
    	margin: 10px 0px 0px 23px;
    }
    .group{
        width:100px;
        height:30px;
        line-height:30px;
        text-align:center;
        cursor:pointer;  
        font-size: 13.5px;
        font-weight:bolder
    }
    .groupDetail{
        
        width:100px;
        height:30px;
        margin-top:10px;
        padding:5px;
        box-sizing:border-box;
        display:none;
        font-size: 12px;
        font-weight: bold;
        margin-left: 15px;
    }
    .groupDetail a{
        color: black;
    }
    a:hover{
        color: rgb(63, 145, 213);
    }
    /* 모달창 스타일 */
    .modal-title{
        font-size: 15px;
    }

    /* 모달 input */
    .addressAdd th{
        font-size: 16px;
    }
    .form-control, #inGroupNo, #deptCode, #jobCode{
        width: 200px;
        font-size: 14px;
        margin-bottom: 8px;
    }
    .modal-body input, #inGroupNo, #deptCode, #jobCode {
        border-radius: 5px;
        box-shadow: none;
        border: 1px solid rgb(204, 204, 204);
    }
    #theadP {
        width: 415px; 
        height: 40px; 
        background-color: rgb(63, 145, 213); 
        text-align: center; 
        color: rgb(37, 37, 37); 
        font-size: 15px;
        border-radius: 5px;
        padding-top: 8px;
        font-size: 15px;
        font-weight: bold;
    }
    .addressAdd td {
        padding-top: 7px;
    }
    #suggestion {
        border: 1px solid #979595;
        border-radius: 5px;
        margin-left: 0px;
        width: 195px;
        display:none;
    }
    #suggestion>ul { 
        list-style-type: none;
        padding-left: 0px;
        margin: 5px 0px 0px 10px; 
    }
    #suggestion>ul>li {
        font-size: small;
        margin: 5px 0px 7px 0px;
        padding-bottom: 5px;
    }
</style>
<script>
    $(function(){
        $(".group").click(function(){
            const $p = $(this).nextAll();

            if($p.css("display") == "none") {
                $(this).siblings("p").slideUp();

                $p.slideDown();
            }else{
                $p.slideUp();
            }
        })

    })
</script>
</head>
<body>

    <div class="sidebar">
        <div class="title">
            <i class='fas fa-angle-double-right' style='font-size:24px'> 사내주소록</i>
        </div>
        <ul>
            <li><button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#addAdress"><i class="fas fa-user-plus"> 주소추가 </i></button></li>
            <li><button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#groupadd"> <i class="fas fa-folder-plus"> 그룹추가</i></button></li>
        </ul>
        <hr>
        <div class="addressgroup">
            <div class="group"><i class="fa-solid fa-angles-down">&nbsp;사내주소록</i></div>
            <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
            <ul class="groupDetail" id="contanctGroup" style="list-style-type: none; height: 100%;">
            
            	<c:forEach var="g" items="${ inCon }">
            		<li><li><a href='group.inCon?gNo=${ g.inGroupNo }'><i class='far fa-folder'> &nbsp;${ g.inGroupName }</i></a></li>
            	</c:forEach>
            
            </ul>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal" id="addAdress">

        <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            
            <form action="insert.inCon" method="post">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 style="font-weight: bold; float: left;">주소록추가</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="content_page">
                            <fieldset>
                                <table class="addressAdd">
                                    <colgroup>
                                        <col width="130px">
                                        <col width="*">
                                    </colgroup>
                                    <thead>
                                        <p id="theadP">사내주소록</p>
                                    </thead>
                                    <tbody>
                                    
                                    <tr>
                                        <th>
                                            <span>그룹</span>
                                        </th>
                                        <td>
                                            <span>
                                                <select id="inGroupNo" style="height: 32px;">
                                                	<c:forEach var="g" items="${ inCon }">
                                                    	<option value="${ g.inGroupNo }">${ g.inGroupName }</option>
                                                    </c:forEach>
                                                </select>
                                            </span>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <span>이름 *</span>
                                        </th>
                                        <td>
                                            <span>
                                                <input type="text" class="form-control" id="name" name="userName" required>
                                            </span>
                                            <div id="suggestion" style="position: absolute; z-index: 2;  background-color: rgb(255 255 255);">
	                    						<ul class="result">
                    							</ul>
	                						</div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            <span>이메일</span>
                                        </th>
                                        <td>
                                            <span>
                                                <input type="text" class="form-control" id="email" name="email">
                                            </span>
                                        </td>
                                    </tr>
                            
                                    <tr>
                                        <th>
                                            <span>휴대폰 *</span>
                                        </th>
                                        <td>
                                            <span><input type="text" class="form-control" id="phone" name="phone" placeholder="'-' 포함"></span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            <span>내선번호 *</span>
                                        </th>
                                        <td>
                                            <span><input type="text" class="form-control" id="call" name="call" placeholder="지역번호) 포함"></span>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <span>부서</span>
                                        </th>
                                        <td>
                                            <div>
                                                <!--부서select-->
							                    <select name="deptCode" id="deptCode">
							                    	<c:forEach var="d" items="${ dept }">
							                    		<option value="${ d.deptCode }">${ d.deptName }</option>
							                    	</c:forEach>
							                    </select>
                                            </div>
                                            <!--직급select-->
                                            <div>
                                                <select name="jobCode" id="jobCode" style="height: 32px;">
                                                    <option value="1">사원</option>
                                                    <option value="2">주임</option>
                                                    <option value="3">대리</option>                                    
                                                    <option value="4">과장</option>
                                                    <option value="9">대표이상</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            <span>주소</span>
                                        </th>
                                        <td>
                                            <div><input name="address" type="text" class="company form-control" placeholder="부서명"></div>
                                            <div><input name="address_detail" type="text" class="company form-control" placeholder="직위"></div>
                                        </td>
                                    </tr>
                                    
                                    <tr >
                                        <th>
                                            <span>생일</span>
                                        </th>
                                        <td>
                                            <span>
                                                <input name="birthday" type="text" id="birthdayDate"  class="form-control" placeholder="YYYY-MM-DD" >
                                                <span id="birthdayDateIcon"></span>
                                            </span>
                                        </td>
                                    </tr>
                                
                                    </tbody>
                                </table>
                            </fieldset>

                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 150px;">취소</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#keep" style="width: 150px; margin-right:55px;">저장</button>
                </div>
                
                
	            <!-- 보관 Modal -->
	            <div id="keep" class="modal fade" role="dialog">
	                <div class="modal-dialog modal-sm">
	            
	                    <!-- Modal content-->
	                    <div class="modal-content">
	                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
	                            해당 입력사항으로 사내연락처를 추가하시겠습니까?
	                        </div>
	                        <div class="modal-footer" style="text-align: center;">
	                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 27px;">취소</button>
	                            <button type="submit" id="yesKeep" class="btn btn-success" style="margin-right: 70px;">등록</button>
	                        </div>
	                    </div>
	            
	                </div>
	            </div>
                
            </form>
        </div>
        </div>
    </div>
   


    <!-- 그룹추가 모달창 -->
    <div class="modal" id="groupadd">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            
                <form action="insert.inGroup" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <p style="margin-top:20px; font-size: x-small; color: grey; margin-bottom: 5px;">사내주소록</p>
                        <p style="font-size: larger;">그룹추가하기</p>
                        <input id="inGroupName" name="inGroupName"  class="inGroupName" placeholder="그룹명을 입력해주세요" style="display: inline-block; width:250px; height: 40px;">   
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:100px; margin-right: 5px;">취소</button>
                        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#confirm" style="width:100px; margin-right:25px;">저장</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    
    <!--임직원 자동완성-->
    <script>

        $(function() {
    
            $("#name").keyup(function(){
            	
            var keyword = $(this).val();
                
         	if(keyword.length == 0) {
         		$("#suggestion").hide();
         	}else if(keyword.length >= 1){
                   	$("#suggestion").show();
             	$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
                      url: "search.name",
                      data: { userName : keyword },
                      method: "GET",
                      success:function(list){
                      	
                      	//console.log(list);
                     		if(list.length >= 1) {
                      		
                      		var result = "";
                      		for(let i in list) {
                       		result += "<li>"
                       				+ "<i class='fa-solid fa-magnifying-glass'>&nbsp;</i>"
                       				+ "<span class='usern' style='display:none;'> " + list[i].userNo + "</span>"
                       				+ "<span class='usernm'> " + list[i].userName + "</span>"
                       		        + "<span> | " + list[i].deptName  + "</span>"
                       		        + "<span>(" + list[i].jobName + ")</span>"
                       		        + "</li>";
                    		   			$(".result").html(result);
                       	}
                      		
                      	}else if(list.length <= 0) {
                      		$("#suggestion").hide();
                      	}
                      	
                      }, error:function(){
                          console.log("ajax통신실패");
                      }
                 })       // Ajax 응답을 정상적으로 받으면 실행됨.
         	}
            })
    
        });
    
    </script>
    
    <!-- input값 채워주기 -->
    <script>
    	$(document).on('click', '#suggestion>ul>li', function(){
    		var userNo = $(this).children().siblings('.usern').text();
    		var userName = $(this).children().siblings('.usernm').text();
    		//console.log(userNo);
    		$("#suggestion").hide();
    		$("#name").val(userName);
    		$("#recvNo").val(userNo);
    	})
    </script>

	

</body>
</html>