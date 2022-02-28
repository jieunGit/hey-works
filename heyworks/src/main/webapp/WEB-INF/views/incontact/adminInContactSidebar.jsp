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
        padding-top: 15px;
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
            <div class="group">사내주소록</div>
            <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
            <ul class="groupDetail" id="contanctGroup" style="list-style-type: none; height: 100%;">
                <li><a href=""><i class="far fa-folder"> 개발팀</i></a></li><br>
                <li><a href=""><i class="far fa-folder"> 인사팀</i></a></li><br>
                <li><a href=""><i class="far fa-folder"> 회계팀</i></a></li>
            </ul>
        </div>

    </div>

    <!-- The Modal -->
    <div class="modal" id="addAdress">

        <div class="modal-dialog" style="width: 450px;">
        <div class="modal-content">
            
            <form id="contactCreateId" name="formContactCreate">
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
                                                    <option value="">xx팀</option>
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
                                                <input type="text" class="form-control" id="name" required>
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>
                                            <span>이메일</span>
                                        </th>
                                        <td>
                                            <span>
                                                <input type="text" class="form-control" id="name">
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
                                            <span><input type="text" class="form-control" id="phone" name="phone" placeholder="지역번호) 포함"></span>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <span>부서</span>
                                        </th>
                                        <td>
                                            <!--부서select-->
                                            <div>
                                                <select name="deptCode" id="deptCode" style="height: 32px;">
                                                    <option value="1">개발팀</option>
                                                    <option value="2">경영팀</option>
                                                    <option value="3">회계팀</option>                                    
                                                    <option value="4">인사팀</option>
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
                                            <div><input name="departmentName" type="text" class="company form-control" placeholder="부서명"></div>
                                            <div><input name="positionName" type="text" class="company form-control" placeholder="직위"></div>
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
                    <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 150px; margin-right:55px;">저장</button>
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
                        <input name="groupName"  class="form-control" placeholder="그룹명을 입력해주세요" style="display: inline-block; width:250px; height: 40px;">   
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:100px; margin-right: 5px;">취소</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#confirm" style="width:100px; margin-right:25px;">저장</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- 그룹생성 확인 Modal -->
    <div id="confirm" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
    
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                    그룹이 생성되었습니다.
                </div>
                
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 200px; margin-right:25px;">확인</button>
                </div>
            </div>
    
        </div>
    </div>


</body>
</html>