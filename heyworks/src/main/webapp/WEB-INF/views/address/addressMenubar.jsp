<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
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
.line{
    margin: auto;
    margin-top: 30px;
    width: 170px;
    height: 1px;
    background: lightgray;
}
#delectList{
    
    margin-top: 10px;
}
#delectList a{
    font-size: 13px;
    color: black;
    margin-left: 40px;
   
}

/* 모달창 스타일 */
.modal-title{
    font-size: 15px;
}

/* 모달 input */
.addressAdd th{
    font-size: 14px;
}
.form-control{
    width: 300px;
    
    font-size: 14px;
    margin-bottom: 15px;
}
.company{
    width: 97px;
    display: inline-block;
}

#adgroup a{
    color: black;
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
        <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#groupadd"> <i class="fas fa-folder-plus"> 그룹추가</i></button>
        <br><br>

        <i class="fas fa-star" style="margin-left: 15px; color: rgb(240, 240, 36);"><a href="" style="color: black; font-size: 13.5px;"> 즐겨찾는주소록</a></i>
        <br>

            <div class="addressgroup">
            <!-- 그룹생성에따라 만들어지게 -->
                <div class="group">개인주소록</div>
                <div class="groupDetail"><a href="adAllList.ad"><i class="far fa-address-book"> 전체</i></a> </div>
            
                <ul class="groupDetail" id="adgroup" style="list-style-type: none; height: 100%;">
                	
                </ul>
            </div>
            
            <div class="addressgroup">
                <div class="group">사내주소록</div>
                <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
                <ul class="groupDetail" id="adgroup" style="list-style-type: none; height: 100%;">
                	<li><a href=""><i class="far fa-folder"> 개발팀</i></a></li><br>
                    <li><a href=""><i class="far fa-folder"> 인사팀</i></a></li><br>
                    <li><a href=""><i class="far fa-folder"> 회계팀</i></a></li>
                </ul>
             </div>
        
             <div class="line"></div>

             <div id="delectList">
               <a href="deleteAdList.ad"><i class="fa-solid fa-trash-can"> 삭제목록</i></a> 
             </div>


     <!-- 연락처추가 모달창 -->
        
        <div class="container">
            
        
            <!-- The Modal -->
            <div class="modal" id="addAdress">

                <div class="modal-dialog">
                    <div class="modal-content">
                    
                    <!-- Modal Header -->
                    <div class="modal-header" style="background: rgb(63, 145, 213);">
                        <h4 class="modal-title" style="font-weight: bold; ">  주소록추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                
               <form action="insertAddress.ad" id="addAdress" method="post" >
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content_page">
                                <fieldset>
                                    <table class="addressAdd">
                                        <colgroup>
                                            <col width="130px">
                                            <col width="*">
                                        </colgroup>
                                        <tbody>
                                        
                                        <tr>
                                            <th><span>이름 *</span>
                                                
                                            </th>
                                            <td>
                                                <span>
                                                    <input type="text" class="form-control" id="name" name="addressName" required>
                                                </span>
                                            </td>
                                        </tr>
                                   
                                        <tr>
                                            <th>
                                                <span>휴대폰 *</span>
                                            
                                            </th>
                                            <td>
                                                <select name="phoneGroup" id="phonegroup"  class="form-control" style="width: 100px; display: inline-block;">
                                                    <option>휴대폰</option>
                                                    <option>내선번호</option>

                                                </select>
                                                <span><input type="text" class="form-control" id="phone" name="addressPhone" style="width: 199px; display: inline-block;"></span>
                                            </td>
                                        </tr>
                                        
                                        <tr >
                                            <th>
                                                <span>회사 팩스</span>
                                            
                                            </th>
                                            <td><span><input type="text" class="form-control" id="comapnyfax" name="fax" placeholder=""></span></td>
                                        </tr>
                                        <tr>
                                            <th><span>이메일</span>
                                            </th>
                                            <td><div class="input-group mb-3">
                                                <input type="text" class="form-control" placeholder="Email" id="demo" name="addressEmail">
                                                
                                            </div></td>
                                        </tr>
                                        <tr>
                                            <th><span>회사</span>
                                            </th>
                                            <td><span><input name="companyName" type="text" class="company form-control" placeholder="회사명"></span> 
                                            <span><input name="deptTitle" type="text" class="company form-control" placeholder="부서명"></span>
                                            <span><input name="jobTitle" type="text" class="company form-control" placeholder="직위"></span></td>
                                        </tr>
                                        
                                        <tr>
                                            <th><span>그룹</span></th>
                                            <td>
                                                <!-- ajax로 그룹 select해오기 -->
                                                <select name="groupNo" id="groupModal"  class="form-control" >
                                                

                                                </select>
                                            </td>
                                        </tr>
                                    
                                     
                                    
                                        <tr>
                                            <th><span>회사주소</span></th>
                                            <td>
                                                <select name="addressGroup" id="addressgroup"  class="form-control"  style="width: 100px;">
                                                    <option>회사</option>
                                                    <option>집</option>
                                                </select>

                                                <!-- 주소찾기 api가능? -->
                                                <span id="officeDetail">
                                                    <input name="company_basicAddress" type="text" name="address" class="form-control" >
                                                    <input name="company_country" type="hidden">
                                                    <input name="company_postalCode" type="hidden">
                                                    <input name="company_state" type="hidden">
                                                    <input name="company_city" type="hidden">
                                                    <input name="company_extAddress" type="hidden">
                                                    <span title="상세주소입력"></span>
                                                </span>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th><span>회사 홈페이지</span>
                                            </th>
                                            <td><span><input name="companyUrl" type="text"  class="form-control" placeholder="http://www.naver.com"></span></td>
                                        </tr>
                                        <tr>
                                            <th><span>회사전화</span>
                                            </th>
                                            <td><span><input name="companyPhone" type="text"  class="form-control"></span></td>
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
                                            <th><span>메모</span></th>
                                            <td>
                                                <span>
                                                    <input name="memo"  class="form-control" placeholder="내용을 입력해주세요" >									
                                                </span>
                                            </td>
                                        </tr>
                                        
                                        					
                                        </tbody>
                                    </table>
                                </fieldset>
                            </div>

                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer" >
                            <button type="reset" class="btn btn-secondary" >취소</button>
                            <button type="submit" class="btn btn-primary" style="margin-right: 80px;">저장</button>
                            
                        </div>
                   </form>
               
                           
                </div>
            </div>
        </div>
        
    </div>

</div>



	<!-- 그룹추가 모달창 -->
	<div class="modal" id="groupadd">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="background: rgb(63, 145, 213);">
					<span style="font-size: 15px; font-weight: bolder;">주소록 그룹
						추가</span>

					<button type="button" class="close" >&times;</button>
				</div>

				<!-- Modal body -->
				<form action="insertAdGroup.ad" id="addGroup" method="post">
					<div class="modal-body">
						<span style="display: inline-block; margin-left: 50px;">
							<h4 style="font-size: 15px; font-weight: bold;">그룹명 :</h4>
						</span>&nbsp;&nbsp; <input name="groupName" class="form-control"
							placeholder="그룹명을 입력해주세요"
							style="display: inline-block; width: 300px" required>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="reset" class="btn btn-secondary" >취소</button>
						<button type="submit" class="btn btn-primary"  style="margin-right: 80px;">저장</button>
					</div>
				</form>

			</div>
		</div>
	</div>


	<script>
		//개인주소록 그룹 select 해오기

		$(function() {
			addressGroup();
		})

		function addressGroup() {

			$.ajax({

				url : "addressGroup.ad",
				data : {},
				success : function(glist) {

					// 메뉴바 그룹 select
					let value = "";
					for ( let i in glist) {
						value += "<li><a href='groupAdList.ad?gNo="
								+ glist[i].groupNo
								+ "'><i class='far fa-folder'> "
								+ glist[i].groupName + "</i></a></li><br>"

					}

					// 모달창 그룹 select
					let group = "";
					for ( let i in glist) {
						group += "<option value='" + glist[i].groupNo + "'>"
								+ glist[i].groupName + "</option>"
					}

					$("#adgroup").html(value);
					$("#groupModal").html(group);

				},
				error : function() {
					console.log("주소록그룹조회 ajax통신실패")
				}

			})

		}
	</script>

        
</body>
</html>