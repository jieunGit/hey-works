<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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
    top: 5px;
    right: 15px;
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

  #pagingArea{width:fit-content;margin:auto;}

.data {
	display: none;
}
.sort{
	display: none;
}
</style>
</head>
<body>

	<script type="text/javascript">

		$(document).ready(function(){
			
				
				$("span.data").hide();
				$("span.sort").hide();
				
				// 정렬 아이콘 표시
				if("${data}" == "name") {
					$("span#nameicon").html("<i class='fa fa-sort-${sort}'></i>");
				} else if("${data}" == "job_title") {
					$("span#positionicon").html("<i class='fa fa-sort-${sort}'></i>");
				} else {
					$("span#depticon").html("<i class='fa fa-sort-${sort}'></i>");
				}
	
				// 정렬
				// 이름순
					$("span#nameicon").click(function(){
						var data = $(this).prev().html();
						var sort = $(this).next().html();
	
						console.log(data);
						console.log(sort);
						
						if(sort == "asc") {
							sort = "desc";
						} else {
							sort = "asc";
						}
							
						location.href = "groupAdList.ad?gNo="+ $("#groupNoTag").val() + "&data="+data+"&sort="+sort;
					});
	
	
					// 직위순
				$("span#positionicon").click(function(){
					var data = $(this).prev().html();
					var sort = $(this).next().html();
					
					console.log(data);
						console.log(sort);
	
					if(sort == "asc") {
						sort = "desc";
					} else {
						sort = "asc";
					}
					
					location.href = "groupAdList.ad?gNo="+ $("#groupNoTag").val() + "&data="+data+"&sort="+sort;
				
				});
				// 부서순
				$("span#depticon").click(function(){
					var data = $(this).prev().html();
					var sort = $(this).next().html();
					
					console.log(data);
					console.log(sort);
	
					if(sort == "asc") {
						sort = "desc";
					} else {
						sort = "asc";
					}
					
					location.href = "groupAdList.ad?gNo="+ $("#groupNoTag").val() + "&data="+data+"&sort="+sort;
				});
	
				//체크박스
	
				$("#chkAll").click(function() {
							if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
							else $("input[name=chk]").prop("checked", false);
						});


	
				});
	
	
				// $(document).ready(function() 끝-------

				$("#simpleContactSearch").keyup(function(event) {
					if(event.keyCode == 13) {
					
					
						var frm = document.searchContacts;
						frm.action = "groupAdList.ad?gNo="+ $("#groupNoTag").val();
						frm.submit();
					
						
					}

				});

				
				// // 주소록 검색
				// function searchContact() {
					
				// 	var frm = document.searchContacts;
				// 	frm.action = "groupAdList.ad?gNo="+ $("#groupNoTag").val();
				// 	frm.submit();
					
				// }
	
			
	
	
		
	
			
		</script>
	

    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../address/addressMenubar.jsp" />
		
		
		<div id="center" style=" display:inline">
			<br>
			<!-- 제목영역 -->
			<div id="toparea">
			
				<span>${list[0].groupName}</span>
			
				<span style="font-size: 11px; color: grey;"> in 개인주소록 전체 ${listCount}개</span>
			</div>
			<br>

				<!-- excel내보내기 -->
			<!-- <div id="excel">
				<section>
				
					<a class=" btnAdditional" id="contactExcelExport" onclick="exportExcelFile();">
								<span class="txt">EXCEL로 내보내기</span>
					</a>
						
				</section>
			</div>
			 -->
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
				
				<c:forEach var="a" items="${ list }">
					<tr>
						<!-- 즐겨찾기 -->
						<c:choose>
							<c:when test="${a.likeCount == 1}">
								<td><a href ="" onclick="return deleteLike(${a.addressNo}, this)"><i class="fas fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a></td>
							</c:when>
							<c:otherwise>
								<td><a href ="" onclick="return insertLike(${a.addressNo}, this)"><i class="fa-regular fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a></td>
							</c:otherwise>
						</c:choose>

						<td><input type="checkbox" id="chk" name="chk" value="${a.addressNo}"></td>
						<td>${a.addressName }</td>
						<td>${a.addressPhone }</td>
						<td>${a.addressEmail }</td>
						<td>${a.companyName }</td>
						<td>${a.deptTitle }</td>
						<td>${a.jobTitle }</td>
						<td>${a.groupName }</td>
						<input type="hidden" id="groupNoTag" value="${a.groupNo}">
						<td>
							<!-- 상세보기&수정하기 -->
							<a href=""  data-toggle="modal" data-target="#addressUpdate" onclick="selectAddress(${a.addressNo} , ${a.groupNo})"> <i class="fa-solid fa-align-justify"style="color:rgb(32, 32, 179)"></i> </a>&nbsp;
							<!-- 수정하기 -->
							<!-- <a href="" data-toggle="modal" data-target="#addressUpdate" onclick="selectAddress(${a.addressNo})"> <i class="fa-solid fa-pen " style="color: orange"></i> </a>&nbsp; -->
							<!-- 삭제하기 -->
							<input type="hidden" id="groupNoTag" value="${a.groupNo}">
							<input type="hidden" id="hiddenTag" value="${a.addressNo}">
								<a id="addelebtn"> <i class="fa-solid fa-trash" style="color:red"></i> </a>
						</td>
					</tr>
					
				</c:forEach>	
					
					
				
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
					<a onclick="deleteValue();">삭제</a>
					<!-- <a href="">그룹설정</a> |
					<a href="">메일보내기</a> -->
					
					
			</div>

			<div id="pagingArea">
                <ul class="pagination pagination-sm">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link " href="#"><i class="fa-solid fa-angles-left"></i> </a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="groupAdList.ad?gNo=${ pi.currentPage-1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="groupAdList.ad?gNo=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="groupAdList.ad?gNo=${ pi.currentPage+1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
				
			
			
        </div>

    </div>

<!-- 상세보기 & 수정하기 모달창 -->
<div class="container">


	<!-- The Modal -->
	<div class="modal" id="addressUpdate">

		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="background: rgb(63, 145, 213);">
					<h4 class="modal-title" style="font-weight: bold;">주소록상세보기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="updateAddress.ad" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="content_page">
							<fieldset>
								<table class="addressAdd">
									<colgroup>
										<col width="130px">
										<col width="*">
									</colgroup>
									<tbody id="updateAddress">


									</tbody>
								</table>
							</fieldset>
						</div>

					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary" style="margin-right: 80px;">수정</button>

					</div>
				</form>


			</div>
		</div>
	</div>

	
	
	   
<%-- 취소 버튼 클릭 시 정말 취소할 것인지 묻는 모달 --%>
<div class="modal fade" id="deleteModal" role="dialog">
<div class="modal-dialog modal-sm">
  <div class="modal-content" style="width: 400px;">
	<div class="modal-header" style="background: rgb(63, 145, 213);">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	 
	</div>
	<div class="modal-body" style="text-align: center;">
	  <label >주소록을 정말로 삭제하시겠습니까?</label>
	  <input class="hidden_reservation_no" type="hidden">
	</div>
	<div class="modal-footer" style="margin: auto;">
	  <button type="button" class="btn btn-secondary" style="width: 100px;">예</button>
	  <button type="reset" class="btn btn-primary" data-dismiss="modal" style="width: 100px;">아니오</button>
	</div>
  </div>
</div>
</div>





	<script>


// 클릭시 실행되는 함수
function selectAddress(addressNo, groupNumber) {
	// 주소록 수정하기 정보 select
	$.ajax({
			url:"selectAddress.ad",
			data:{addressNo : addressNo},
			  dataType : "json",
			success:function(json){
				
				console.log(json);

				var html = "";
				html += "<input type='hidden' name='addressNo' value='"+ json.addressNo +"'>"
				html += "<tr>";
				html += "<th><span>이름 *</span></th>";
				html += "<td><span><input type='text'name='addressName' class='form-control' id='name' required value='"+json.addressName + "'></span></td>";
				html += "</tr>";

				html += "<tr>";
				html += "<th><span>휴대폰 *</span></th>";
				html +=	"<td><select name='phoneGroup' id='phonegroup'  class='form-control' style='width: 110px; display: inline-block;'>";
				if(json.phoneGroup == '휴대폰') {
					html += "<option selected>휴대폰</option><option>내선번호</option></select>";
				}else{
					html += "<option>휴대폰</option><option selected>내선번호</option></select>";
				}
				html +=	"<span><input type='text' class='form-control' id='phone' name='addressPhone' style='width: 189px; display: inline-block;' value='"+ json.addressPhone +"'></span></td>";
				html +=	"</tr>";

				html += "<tr>";
				html += "<th><span>회사 팩스</span></th>";
				if(json.fax == null) {
					html += "<td><span><input type='text' class='form-control' id='comapnyfax' name='fax'></span></td>";
				}else{
					html += "<td><span><input type='text' class='form-control' id='comapnyfax' name='fax' value='"+json.fax +"'></span></td>";
				}
				html +=	"</tr>";
			
				html += "<tr>";
				html +=	"<th><span>이메일</span></th>"
				if(json.addressEmail == null) {
					html += "<td><div class='input-group mb-3'><input type='text' class='form-control' placeholder='Email' id='demo' name='addressEmail'></div></td>"
				}else{
					html += "<td><div class='input-group mb-3'><input type='text' class='form-control' placeholder='Email' id='demo' name='addressEmail' value='"+ json.addressEmail+ "'></div></td>"
				}
				html +=	"</tr>";
			
				html += "<tr>";
				html += "<th><span>회사</span></th>"
				if(json.companyName == null || json.deptTitle == null || json.jobTitle == null) {
					html += "<td><span><input name='companyName' type='text' class='company form-control' placeholder='회사명'></span>" 
					html +=  "<span><input name='deptTitle' type='text' class='company form-control' placeholder='부서명'></span>"
					html +=  "<span><input name='jobTitle' type='text' class='company form-control' placeholder='직위'></span></td>"
				}else{
					html += "<td><span><input name='companyName' type='text' class='company form-control' placeholder='회사명' value='"+json.companyName+"'></span>" 
				html +=  "<span><input name='deptTitle' type='text' class='company form-control' placeholder='부서명' value='"+json.deptTitle+"'></span>"
				html +=  "<span><input name='jobTitle' type='text' class='company form-control' placeholder='직위' value='"+json.jobTitle+"'></span></td>"

				}
				
				html +=	"</tr>";
					
				// ajax select해오기
				html += "<tr>";
				html += "<th><span>그룹</span></th>";
				html += "<td><select name='groupNo' id='groupselect'  class='form-control' ></select></td>"
				html +=	"</tr>";

				
				html += "<tr>";
				html += "<th><span>회사주소</span></th>"
				html += "<td> <select name='addressGroup' id='addressgroup'  class='form-control'  style='width: 100px;'>"
					if(json.addressGroup == '회사') {
						html += "<option selected>회사</option><option>집</option></select>"
					}else{
						html += "<option>회사</option><option selected>집</option></select>"
					}		
				html += "<span id='officeDetail'>"
				if(json.address == null) {
					html += "<input type='text' name='address' class='form-control'> </span></td>"
				}else{
					html += "<input type='text' name='address' class='form-control' value='"+json.address+"'> </span></td>"
				}
				html +=	"</tr>";

				html += "<tr>";
				html += "<th><span>회사 홈페이지</span> </th>"
				if(json.companyUrl==null){
					html += "<td><span><input name='companyUrl' type='text'  class='form-control' placeholder='http://www.naver.com'></span></td>"
				}else{
					html += "<td><span><input name='companyUrl' type='text'  class='form-control' placeholder='http://www.naver.com' value='"+json.companyUrl+"'></span></td>"
				}
				html +=	"</tr>";

				html += "<tr>";
				html += "<th><span>회사전화</span></th>"
				if(json.companyPhone == null) {
					html +=	"<td><span><input name='companyPhone' type='text'  class='form-control'></span></td>"
				}else{
					html +=	"<td><span><input name='companyPhone' type='text'  class='form-control' value='"+json.companyPhone+"'></span></td>"
				}
				html +=	"</tr>";

				html += "<tr>";
					html += "<th> <span>생일</span> </th>"
					if(json.birthday == null) {
						html += "<td><span> <input name='birthday' type='text' id='birthdayDate'  class='form-control' placeholder='YYYY-MM-DD'></span></td>"
					}else{
						html += "<td><span> <input name='birthday' type='text' id='birthdayDate'  class='form-control' placeholder='YYYY-MM-DD' value='"+json.birthday+"'></span></td>"	
					}
				html +=	"</tr>";


				html += "<tr>";
				html += "<th><span>메모</span></th>"
				if(json.meno == null) {
					html += "<td><span><input name='memo'  class='form-control' placeholder='내용을 입력해주세요'></span></td>"
				}else{
				html += "<td><span><input name='memo'  class='form-control' placeholder='내용을 입력해주세요' value='"+json.meno+"'></span></td>"
				}
				html +=	"</tr>";

				$("#updateAddress").html(html);

			},
			error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}


			
			})

			// 상세보기 모달창 개인주소록 그룹 select
			$.ajax({

			url : "addressGroup.ad",
			data : {},
			success : function(glist) {
				console.log(groupNumber);

			// 모달창 그룹 select
			let group = "";
			for ( let i in glist) {

				if(glist[i].groupNo == groupNumber) {
				group += "<option value='" + glist[i].groupNo+ "' selected>"+ glist[i].groupName + "</option>"
				}else {
				group += "<option value='" + glist[i].groupNo+ "'>"+ glist[i].groupName + "</option>"
				}
					
						
				
					}

			$("#groupselect").html(group);

			},
			error : function() {
			console.log("주소록그룹조회 ajax통신실패")
			}

			})

			


}

// 삭제모달에서 예 클릭시 실행되는 함수 

	$(function(){
            	$(document).on('click', '#addelebtn', function(){
                var aNo = $(this).prev("#hiddenTag").val();
				var groupNo = $("#groupNoTag").val();
				console.log(aNo);

                alertify.confirm('삭제','정말로 카테고리를 삭제하시겠습니까?',
                
				function(){

					$.ajax({

						url : "deleteAddress.ad",
						data : {addressNo : aNo},
						dataType:"JSON",
						success : function(json) {

							if(json.result == 1){

								alertify.alert("주소록 삭제에 성공하였습니다.");

							}else{

								alertify.alert("주소록 삭제에 실패하였습니다.");
							}
							location.href="groupAdList.ad?gNo="+groupNo

						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
						
						

						})
				},
					function(){
					alertify.error('Cancel');
					});
			
				})
		})
	


			// 선택삭제 기능
			function deleteValue() {

					var valueArr = new Array();
					var list = $("input[name='chk']");

					for(var i=0; i<list.length; i++) {
						if(list[i].checked) {

						valueArr.push(list[i].value);

						}

					}
						console.log(valueArr);
					if(valueArr.length == 0) {
					alertify.alert("선택된 주소록이 없습니다.");
					}else{

					 if(confirm("정말 삭제하시겠습니까?")==true) {

					 

					$.ajax({

					url : "chkDelete.ad",
					data : {valueArr : valueArr},
					traditional:true,
					dataType:"JSON",
					success : function(json) {

						if(json.result > 0){

							alertify.alert("주소록 삭제에 성공하였습니다.");

						}else{

							alertify.alert("주소록 삭제에 실패하였습니다.");
						}

						location.href="groupAdList.ad?gNo="+ $("#groupNoTag").val();

					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}



					});
					}


					}

					}


				// 즐겨찾기 추가하기

				function insertLike(addressNo, aE1) {

					$.ajax({

							url : "insertLikeAddress.ad",
							data : {addressNo : addressNo},
							dataType:"JSON",
							success : function(json) {

								if(json.result == 1){

									// alertify.alert("즐겨찾기 추가에 성공하였습니다.");
									$(aEl).children().removeClass("fas");
									$(aEl).children().addClass("fa-regular");
									$(aEl).click(function(){
										return deleteLike(addressNo);
									})

								}else{

									alertify.alert("즐겨찾기 추가에 실패하였습니다.");
								}

								
								
							},
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
							}



							})


						
				}


				// 즐겨찾기 삭제
				function deleteLike(addressNo, aE2) {

					$.ajax({

							url : "deleteLikeAddress.ad",
							data : {addressNo : addressNo},
							dataType:"JSON",
							success : function(json) {

								if(json.result == 1){

									// alertify.alert("즐겨찾기 삭제에 성공하였습니다.");
									$(aE2).children().removeClass("fa-regular");
									$(aE2).children().addClass("fas");
									$(aE2).click(function(){
										return insertLike(addressNo);
									})

								}else{

									alertify.alert("즐겨찾기 삭제에 실패하였습니다.");
								}

								
								
							},
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
							}



							})


						
					}

</script>

</body>
</html>