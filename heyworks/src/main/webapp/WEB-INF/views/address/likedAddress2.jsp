<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<style>
.outer{
		width:1200px;
		height:1200px;
		margin:auto;
		
	}
.outer>div{float:left;}
	
#center{
	   width: 950px;
	   height:100%;
	   display:inline-block;
	   border: 1px solid lightgray;
	  
   }
#toparea{
	   width: 500px;
	   height: 50px;
	  
	   margin-left: 50px;
	   font-weight: bolder;
}

#excel{
	   display: inline-block;
		margin-left: 30px;
 }

 a.btnAdditional {
	width: 67px;
	height: 32px;
	color: #333;
	font-size: 13px;
	margin: 0 4px 0 0;
	padding: 0 8px;
	cursor: pointer;
}
.search-box{
	margin-right: 20px;
	float: right;
	position: relative;

}
.search-box i{
	color: #a0a5b1;
    position: absolute;
    font-size: 19px;
    top: 8px;
    left: 10px;
}
.search-box input {
    height: 30px;
    border-radius: 20px;
    padding-left: 35px;
    border-color: #ddd;
    box-shadow: none;
}
.addresstable th{
	font-size: 14px;
}
.addresstable td{
	font-size: 13px;
}

#footer{
	width: 800px;
	margin-left:40px;
}
#footer a{
	color: black;
	font-size: 13px;
}
</style>
</head>
<body>

    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../address/addressMenubar.jsp" />
		
		
		<div id="center" style=" display:inline">
			<br>
			<!-- 제목영역 -->
			<div id="toparea">
				<span> 즐겨찾는 개인주소록</span>
				<span style="font-size: 11px; color: grey;"> in 개인주소록 2개</span>
			</div>
			<br>

				<!-- excel내보내기 -->
			<div id="excel">
				<section>
				
					<a class=" btnAdditional" id="contactExcelExport" onclick="exportExcelFile();">
								<!-- <span class="ic_toolbar more"></span> -->
								<span class="txt">EXCEL로 내보내기</span>
					</a>
						
				</section>
			</div>
			
				<!-- 검색영역 --> 
				<form name="searchContacts" action="groupAdList.ad" method="post">
					<div class="search-box">
						<input type="text" class="form-control" placeholder="Search…" id="simpleContactSearch" name="contactInput">
						<button type="submit" style="border: none; background: none;"><i class="fa-solid fa-magnifying-glass" id="simpleContactbtn" ></i></button>
						<c:forEach var="a" items="${ list }" begin="0" end="0">
							<input type="hidden" id="groupNoTag" value="${a.groupNo}" name="gNo">
						</c:forEach>
					</div>
				</form>
			
			<!-- 테이블영역 정렬기능구현! -->
			<div class="container" style="width: 900px;">
				
				<table class="table addresstable">
					<thead>
						<tr>
							<th style="width:10px;"></th>
							<th width=10px; ><input type="checkbox" id="chkAll" name="chkAll"></th>
							<th width=80px;>
								<span class="title_sort">이름</span>
								<span class="data">name</span>
								<span id="nameicon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
								<span class="sort">${sort}</span>
							</th>
							<th width=130px;>전화번호</th>
							<th width=150px;>이메일</th>
							<th width=100px;>회사명</th>
							<th width=80px;>
								<span class="title_sort">부서<ins class="ic"></ins></span>
								<span class="data">dept_title</span>
								<span id="depticon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
								<span class="sort">${sort}</span>
							</th>
							<th width=70px;>
								<span class="title_sort">직위<ins class="ic"></ins></span>
								<span class="data">job_title</span>
								<span id="positionicon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
								<span class="sort">${sort}</span>
							</th>
							<th width=70px;>그룹</th>
							<th></th>
						</tr>
					</thead>
				<tbody>
					<tr>
						<!-- 즐겨찾기 삭제 -->
						<td><a href=""><i class="fas fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a></td>
						<!-- <td><a href=""><i class="fa-regular fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a></td> -->
						
						<td><input type="checkbox" id="chk" name="chk" value="${a.addressNo}"></td>
						<td>김부장</td>
						<td>010-1111-2222</td>
						<td>kkkk@naver.com</td>
						<td>카카오</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>거래처</td>
						<td>
								<!-- 상세보기 -->
								<a href=""  data-toggle="modal" data-target="#addressUpdate" onclick="selectAddress(${a.addressNo} , ${a.groupNo})"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>&nbsp;
								<!-- 수정하기 -->
								<a href=""> <i class="fa-solid fa-pen " style="color: orange"></i> </a>&nbsp;
								<!-- 삭제하기 -->
								<a href="" data-toggle="modal" data-target="#deleteModal"> <i class="fa-solid fa-trash" style="color:red"></i> </a>
						</td>
					</tr>
					<tr>
						<td><a href=""><i class="fas fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a></td>
						<td><input type="checkbox"></td>
						<td>김부장</td>
						<td>010-1111-2222</td>
						<td>kkkk@naver.com</td>
						<td>카카오</td>
						<td>개발팀</td>
						<td>부장</td>
						<td>거래처</td>
						<td>	
							<!-- 상세보기 -->
							<a href="" data-toggle="modal" data-target="#addressDetail"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>&nbsp;
							<!-- 수정하기 -->
							<a href=""  data-toggle="modal" data-target="#addressUpdate"> <i class="fa-solid fa-pen " style="color: orange"></i> </a>&nbsp;
							<!-- 삭제하기 -->
							<a href=""> <i class="fa-solid fa-trash" style="color:red"></i> </a>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</tbody>
				</table>
			</div>
			<!-- footer부분 -->
			<div id="footer">
					<a href="">삭제</a> |
					<!-- <a href="">그룹설정</a> |
					<a href="">메일보내기</a> -->
					
					
			</div>

			
				
			
			
        </div>

    </div>


<!-- 연락처 상세보기 모달창 -->

<div class="container">
            
        
	<!-- The Modal -->
	<div class="modal" id="addressDetail">

		<div class="modal-dialog">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header" style="background: rgb(63, 145, 213);">
				<h4 class="modal-title" style="font-weight: bold; ">  주소록추가</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
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
								<tbody>
								
								<tr>
									<th><span>이름 *</span>
										
									</th>
									<td>
										<span>
											<input type="text" class="form-control" id="name" required readonly>
										</span>
									</td>
								</tr>
						   
								<tr>
									<th>
										<span>휴대폰 *</span>
									
									</th>
									<td>
										<select name="phonegroup" id="phonegroup"  class="form-control" style="width: 100px; display: inline-block;" readonly>
											<option>휴대폰</option>
											<option>내선번호</option>

										</select>
										<span><input type="text" class="form-control" id="phone" name="phone" style="width: 199px; display: inline-block;" readonly></span>
									</td>
								</tr>
								
								<tr >
									<th>
										<span>회사 팩스</span>
									
									</th>
									<td><span><input type="text" class="form-control" id="comapnyfax" name="companyfax" placeholder="" readonly></span></td>
								</tr>
								<tr>
									<th><span>이메일</span>
									</th>
									<td><div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="Email" id="demo" name="email" readonly>
										
									</div></td>
								</tr>
								<tr>
									<th><span>회사</span>
									</th>
									<td><span><input name="companyName" type="text" class="company form-control" placeholder="회사명" readonly></span> 
									<span><input name="departmentName" type="text" class="company form-control" placeholder="부서명" readonly></span>
									<span><input name="positionName" type="text" class="company form-control" placeholder="직위" readonly></span></td>
								</tr>
								
								<tr class="line">
									<th><span>그룹</span></th>
									<td>
										<select name="group" id="group"  class="form-control" readonly>
											<option>거래처</option>
											<option>그룹사</option>

										</select>
									</td>
								</tr>
							
							 
							
								<tr>
									<th><span>회사주소</span></th>
									<td>
										<select name="addressgroup" id="addressgroup"  class="form-control"  style="width: 100px;" readonly>
											<option>회사</option>
											<option>집</option>
										</select>

										<!-- 주소찾기 api가능? -->
										<span id="officeDetail">
											<input name="company_basicAddress" type="text"  class="form-control" readonly>
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
									<td><span><input name="company_homepage" type="text"  class="form-control" placeholder="http://www.naver.com" readonly></span></td>
								</tr>
								<tr>
									<th><span>회사전화</span>
									</th>
									<td><span><input name="company_phone" type="text"  class="form-control" readonly></span></td>
								</tr>
								<tr >
									<th>
										<span>생일</span>
									</th>
									<td>
										<span>
											<input name="birthday" type="text" id="birthdayDate"  class="form-control" placeholder="YYYY-MM-DD" readonly>
											<span id="birthdayDateIcon"></span>
										</span>
									</td>
								</tr>
							
								<tr>
									<th><span>메모</span></th>
									<td>
										<span>
											<input name="description"  class="form-control" placeholder="내용을 입력해주세요" readonly>									
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-right: 80px;" data-toggle="modal" data-target="#addressUpdate">수정</button>
				
			</div>
			</form>
	   
		
		</div>
	</div>
</div>



<!-- 수정하기 모달창 -->
<div class="container">
            
        
	<!-- The Modal -->
	<div class="modal" id="addressUpdate">

		<div class="modal-dialog">
			<div class="modal-content">
			
			<!-- Modal Header -->
			<div class="modal-header" style="background: rgb(63, 145, 213);">
				<h4 class="modal-title" style="font-weight: bold; ">  주소록추가</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
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
								<tbody>
								
								<tr>
									<th><span>이름 *</span>
										
									</th>
									<td>
										<span>
											<input type="text" class="form-control" id="name" required>
										</span>
									</td>
								</tr>
						   
								<tr>
									<th>
										<span>휴대폰 *</span>
									
									</th>
									<td>
										<select name="phonegroup" id="phonegroup"  class="form-control" style="width: 100px; display: inline-block;">
											<option>휴대폰</option>
											<option>내선번호</option>

										</select>
										<span><input type="text" class="form-control" id="phone" name="phone" style="width: 199px; display: inline-block;"></span>
									</td>
								</tr>
								
								<tr >
									<th>
										<span>회사 팩스</span>
									
									</th>
									<td><span><input type="text" class="form-control" id="comapnyfax" name="companyfax" placeholder=""></span></td>
								</tr>
								<tr>
									<th><span>이메일</span>
									</th>
									<td><div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="Email" id="demo" name="email">
										
									</div></td>
								</tr>
								<tr>
									<th><span>회사</span>
									</th>
									<td><span><input name="companyName" type="text" class="company form-control" placeholder="회사명"></span> 
									<span><input name="departmentName" type="text" class="company form-control" placeholder="부서명"></span>
									<span><input name="positionName" type="text" class="company form-control" placeholder="직위"></span></td>
								</tr>
								
								<tr class="line">
									<th><span>그룹</span></th>
									<td>
										<select name="group" id="group"  class="form-control" >
											<option>거래처</option>
											<option>그룹사</option>

										</select>
									</td>
								</tr>
							
							 
							
								<tr>
									<th><span>회사주소</span></th>
									<td>
										<select name="addressgroup" id="addressgroup"  class="form-control"  style="width: 100px;">
											<option>회사</option>
											<option>집</option>
										</select>

										<!-- 주소찾기 api가능? -->
										<span id="officeDetail">
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
								
								<tr>
									<th><span>회사 홈페이지</span>
									</th>
									<td><span><input name="company_homepage" type="text"  class="form-control" placeholder="http://www.naver.com"></span></td>
								</tr>
								<tr>
									<th><span>회사전화</span>
									</th>
									<td><span><input name="company_phone" type="text"  class="form-control"></span></td>
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
			<div class="modal-footer" >
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-right: 80px;">저장</button>
				
			</div>
			</form>
	   
		
		</div>
	</div>
</div>

</body>
</html>