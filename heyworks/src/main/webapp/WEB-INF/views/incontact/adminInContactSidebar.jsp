<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>
<style>
    /* 주소록클릭시 배경 변경 */
    #addressbook{
        background: rgb(25, 105, 170);
    }

    /* 메뉴바 스타일 */
    #menubar{
        border: 1px solid lightgray;
        width: 180px;
        height: 800px;
        display:inline-block;
    }
    #menubar>p {
        font-weight: 1000;
        font-size: 17px;
        margin: 10px 10px 0px 30px;
    }
    .btn{
        width: 150px;
        height: 40px;
        margin: 10px 0px 0px 15px;
        font-size: 13px;
        font-weight: bold;
    
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
        margin-top:3px;
        padding:5px;
        box-sizing:border-box;
        display:none;
        font-size: 12px;
        font-weight: bold;
        margin-left: 15px;
    }
    .groupDetail>a{
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
        border: 1px solid red;
    }
    .form-control{
        width: 200px;
        font-size: 14px;
        margin-bottom: 15px;
    }
    .company{
        width: 97px;
        display: inline-block;
    }
    .modal-body input {
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

    <div id="menubar">

        <p> <i class="fas fa-angle-double-right"></i>  주소록 </p>

        <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#addAdress"><i class="fas fa-user-plus"> 주소추가 </i></button> 
        <button type="button" class="btn btn-secondary"> <i class="fas fa-folder-plus" data-toggle="modal" data-target="#groupadd"> 그룹추가</i></button>
        <br>
            
        <div class="addressgroup">
            <div class="group">사내주소록</div>
            <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
            <div class="groupDetail"><a href=""><i class="far fa-folder"> 개발팀</i></a></div>
            <div class="groupDetail"><a href=""><i class="far fa-folder"> 인사팀</i></a></div>
            <div class="groupDetail"><a href=""><i class="far fa-folder"> 회계팀</i></a></div>
            </div>

        <!-- 연락처추가 모달창 -->
            
        <div class="container">
            
            <!-- The Modal -->
            <div class="modal" id="addAdress">

                <div class="modal-dialog" style="width: 450px;">
                    <div class="modal-content">
                    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 style="font-weight: bold; float: left;">주소록추가</h4>
                    </div>
                
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content_page">
                            <form id="contactCreateId" name="formContactCreate">
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
                                                <select name="phonegroup" id="phonegroup"  class="form-control" style="width: 100px; display: inline-block; margin-left: 0px;">
                                                    <option>휴대폰</option>
                                                    <option>내선번호</option>
                                                </select>
                                                <span><input type="text" class="form-control" id="phone" name="phone" style="width: 150px; display: inline-block;" placeholder="'-' 제외"></span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th>
                                                <span>부서</span>
                                            </th>
                                            <td>
                                                <span><input name="departmentName" type="text" class="company form-control" placeholder="부서명"></span>
                                                <span><input name="positionName" type="text" class="company form-control" placeholder="직위"></span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th>
                                                <span>사주소</span>
                                            </th>
                                            <td>
                                                <select name="addressgroup" id="addressgroup"  class="form-control"  style="display: inline-block; width: 80px;">
                                                    <option>회사</option>
                                                    <option>집</option>
                                                </select>

                                                <!-- 주소찾기 api가능? -->
                                                <span id="officeDetail" style="display: inline-block;">
                                                    <input name="company_basicAddress" type="text"  class="form-control" >
                                                    <input name="company_country" type="hidden">
                                                    <input name="company_postalCode" type="hidden">
                                                    <input name="company_state" type="hidden">
                                                    <input name="company_city" type="hidden">
                                                    <input name="company_extAddress" type="hidden">
                                                    <span title="상세주소입력"></span>
                                                </span>
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
                                    
                                        <tr>
                                            <th>
                                                <span>메모</span>
                                            </th>
                                            <td>
                                                <span>
                                                    <input name="description"  class="form-control" placeholder="내용을 입력해주세요" >                           
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 150px;">저장</button>
                    </div>
                    </form>
               
                </div>
            </div>
        </div>


        <!-- 그룹추가 모달창 -->
        <div class="modal" id="groupadd">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
          
                <!-- Modal body -->
                <div class="modal-body">
                    <p style="margin-top:20px; font-size: x-small; color: grey; margin-bottom: 5px;">사내주소록</p>
                    <p style="font-size: larger;">그룹추가하기</p>
                    <input name="groupname"  class="form-control" placeholder="그룹명을 입력해주세요" style="display: inline-block; width:250px; height: 40px;">   
                </div>
          
                <!-- Modal footer -->
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:100px; margin-right: 5px;">취소</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#confirm" style="width:100px;">저장</button>
                </div>
          
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 200px;">확인</button>
                    </div>
                </div>
        
            </div>
        </div>





        
    </div>

</div>
   

        
</body>
</html>