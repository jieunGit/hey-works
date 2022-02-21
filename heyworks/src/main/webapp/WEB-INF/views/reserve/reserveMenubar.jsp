<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script> -->
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<style>
#reservation{
	background: rgb(25, 105, 170);
}

   #menubar{
  	 border: 1px solid lightgray;
	 width: 180px;
	 height: 800px;
	 display:inline-block;
	 position: relative;
   }

   #menubar>p {
	   font-weight: 1000;
	   font-size: 16px;
	   margin: 10px 0px 0px 30px;
   }
  #reservebtn{
	    width: 150px;
		height: 40px;
		margin: 10px 0px 0px 15px;
	}
	#categoryList{
		
		font-size: 13.5px;
		font-weight: bold;
		margin-left: 30px;
	}

	#categoryList a{
		color: black;
	}

   #resources{
	list-style-type :none;
	
   }
   #resources>li{
	   font-size: 13px;
	   font-weight: bold;
	  
   }
   #resources a{
	 color: black;
   }
   #adminSetting{
	  float:unset;
	  position: absolute;
	  left:0;
	  bottom: 0px;
	  margin: 0px 0px 20px 40px;
   }

 


   /* 모달 */

   .table-borderless > tbody > tr > td,
   .table-borderless > tbody > tr > th,
   .table-borderless > tfoot > tr > td,
   .table-borderless > tfoot > tr > th,
   .table-borderless > thead > tr > td,
   .table-borderless > thead > tr > th {
       border: none;
   }

   .addRsvTable th{
	   text-align: center;
	   font-size: 12px;
   }

   .blueBtn{
      border-radius: 4px;
      background-color: #0F4C81;
      color: white;
   }
   
   .grayBtn{
      border-radius: 4px;
      background-color: #D8D8D8;
      color: gray;
   }

   .relist{
	 list-style-type: none; height: 100%;
   }



</style>
<script>
	 //전체 모달 닫기
	 window.closeModal = function(){
        $('.modal').modal('hide');
        
    };
    

</script>	
</head>
<body>

	
		
		 <div id="menubar">
            <p><i class="fas fa-angle-double-right"></i> 예약</p>
			<button type="button" class="btn btn-primary" id="reservebtn" data-toggle="modal" data-target="#addRsvModal2" onclick="addRs();">+예약하기</button>
			<br><br>
			<a href="myReserve.re" style="color: black;">
			<i class="fas fa-cog" style= "margin-left: 30px;"></i> 
			<span style="font-weight: bold; font-size: 13px;">나의 예약 목록</span><br><br></a>
			
			<!-- 자원카테고리불러오기 -->
			<div id="categoryList">
	
			</div>

			
			<!-- 관리자만 보일수있게 -->
			<div id="adminSetting">
				<a href="categoryList.re" style="color: black;"><i class="fa-solid fa-gear"></i> 자원관리</a>
			</div>


        </div>
		 
		 
		 <script>
	
	
			// 메뉴바 카테고리 select해오기
	 	 $(function(){
	 		MenuCategoryList();
		})
		
	
		function MenuCategoryList() {
			
			$.ajax({
				async:false,
				url: "menuCategoryList.re",
				async :false,
				data:{},
				success: function(clist) {
	
					let value = "";
    				for(let i in clist){
						value +=  "<div id='category'>"
    					value += "<div class='group'><a href='reserve.re?cno="+ clist[i].categoryNo + "&rno=1'><i class='fas fa-history'></i>&nbsp&nbsp" +  clist[i].categoryName + "</a></div><br>"
						value += "<input type='hidden' id='categoryNoTag' value='"+clist[i].categoryNo+"'>"
						value += "<input type='hidden' id='categoryName' value='"+clist[i].categoryName+"'>"
						// value += "<ul class='groupDetail' id='adgroup"+ clist[i].categoryNo+"' style='list-style-type: none; height: 100%;'></ul>"
						value += "</div>"
					}

					let cate = "";
    				for(let i in clist){ 
						cate += "<option value='" + clist[i].categoryNo + "'>" + clist[i].categoryName + "</option>";
					}

					$("#categorySelect").html(cate);
    				$("#categoryList").html(value);
    				
				},error:function() {
					console.log("카테고리조회 ajax통신실패")
				}
			})
			

		}

	
		 // (modal) 예약하기 모달에 이용가능한 자원명 리스트를 select 해옴
			function addRs(){
			
			// 모달 form에 입력돼있는 정보를 모두 삭제하고 모달을 보이게 함(모달 초기화)
			$('#addRsvModal2').find('form')[0].reset();
			$('#addRsvModal2').modal('show');

			function categorySelected() {
				var rNo = document.getElementById("#categorySelect").value();
				console.log(rNo);
			
			$.ajax({
			url:"menuResourceList.re",
			data : {},
			async :false,
			type:"get",
			dataType:"JSON",
			success:function(json){
				var html = "";
				if (json.length > 0) {
						
					
					$.each(json, function(index, item){
					
						html += "<option value='" + item.resourcesNo+ "' >" + item.resourceName + "</option>";
					
					
					});
				}else{
					html += "<li style='height: 20px;'>";
					html += "</li>";
				}
			
				$("select.addRsSelect").html(html);
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});

		}
		
		}


		  // (modal) 예약하기에서 확인버튼을 클릭했을시 실행하는 함수
		  function addRsvModalBtn2(){
     
			// 입력받은 값들 유효성 검사: 시작
			var startday = $("input[name=startday]").val() + " " + $("select.startday_hour").val() + ":00";
			var endday = "";
			
			// 종일 체크 시 시작 날짜를 기준으로 변경
			if ($("input#allday:checked").val()) {
				startday = $("input[name=startday]").val() + " 00:00:00";
				endday = $("input[name=startday]").val() + " 23:59:59";
			}else{
				endday = $("input[name=endday]").val() + " " + $("select.endday_hour").val() + ":00";
			}
			
			// true: 통과   false: 불통
			if (!(startday < endday && startday != endday)) {
				alert("올바른 일시를 선택해주세요.");
				return false;
			}

			var fk_reservation_resource_no = $("select[name=fk_reservation_resource_no]").val();
			if (fk_reservation_resource_no.trim() == "") {
				alert("자원을 선택해주세요.");
				return false;
			}
			
			var reason = $("input[name=reason]").val();
			if (reason.trim() == "") {
				alert("사용용도를 입력해주세요.");
				$("input[name=reason]").focus();
				return false;
			}
			
		// 입력받은 값들 유효성 검사: 끝

	
			// db에 넣기
		$.ajax({
			url:"addModalRsv.re",
			data:{startday:startday, 
					endday:endday, 
					fk_reservation_resource_no:fk_reservation_resource_no, 
					reason:reason, 
					categoryNo : $("#categorySelect").val(),
					categoryName:$("#categorySelect").text()},
			type:"POST",
			dataType:"JSON",
			success:function(json){
				
				// 예약일로 입력한 값이 db에서 중복되는지 안되는지로 나눔
				if (json.n == 1) {
					// 에약이 정상적으로 등록됐을 때
					window.closeModal();
					// alertify.alert("성공적으로 예약되었습니다.")
					location.reload();
					calendar.refetchEvents();
					
				}else if (json.n == -1) {
					// 중복된 예약(시간)으로 예약에 실패했을 때
					alert("해당 시간에는 이미 예약이 되어있어 예약할 수 없습니다.");
				}
				else{
					// db오류
					alert("DB 오류");
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});

		}

			
	</script>
	
	

	<%-- 예약하기 모달 --%>
	<div id="addRsvModal2" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
	 <div class="modal-dialog">
	   <!-- Modal content-->
	   <div class="modal-content" style="width: 700px;">
		 <div class="modal-header" style=" background: rgb(63, 145, 213);">
			 <h4 class="modal-title" style="font-weight: bold;">예약하기</h4>
		   <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
		 </div>
		 <div class="modal-body">
		 
		   <div class="modal_container">
				<form name="addSchFrm">
				   <input type="hidden" name="bAllday">
			  <table class="table table-borderless addRsvTable">
				<tbody>
				  <tr>
					<th style="width: 100px;">예약일</th>
					<td style="float: left;">
					   <input type="date" class="datepicker" name="startday">

					   <select class="startday_hour" style="width: 70px; height: 30px;">
						<c:set var="breakPoint" value="0" />
						<c:forEach var="i" begin="0" end="23">
							<c:forEach var="j" begin="0" end="1">
								<c:if test="${(i == 24) && (j == 1)}">    
									<c:set var="breakPoint" value="1" />                                    
								</c:if>
								<c:if test="${breakPoint == 0}">                           
									<option value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />">
									<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
								</c:if>
							</c:forEach>
						</c:forEach>

				   </select>
				   ~
				   <input type="date" class="datepicker" name="endday">
					   <select class="endday_hour" style="width: 70px; height: 30px;">
					  <c:set var="breakPoint" value="0" />
					  <c:forEach var="i" begin="0" end="23">
						  <c:forEach var="j" begin="0" end="1">
							  <c:if test="${(i == 24) && (j == 1)}">    
								  <c:set var="breakPoint" value="1" />                                    
							  </c:if>
							  <c:if test="${breakPoint == 0}">                           
								  <option value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />">

								  <fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />
								</option>                                                                            
							  </c:if>
						  </c:forEach>
					  </c:forEach>
				   </select>
				   
				   <input type="checkbox" id="allday" name="allday" /><label for="allday">종일</label>
					</td>
				  </tr>
				  
				  <tr>
					<th>카테고리선택</th>
					<td><select id="categorySelect" name="category" style="width: 300px; float: left;" onchange="categorySelected()" ></select></td>
				  </tr>

				  <tr>
					<th>자원선택</th>
					<td><select class="addRsSelect" name="fk_reservation_resource_no"   style="width: 300px; float: left;"></select></td>
				  </tr>
				  
				  <tr>
					<th>사용용도</th>
					<td><input class="form-control modal_input" name="reason" type="text" style="height: 30px;" /></td>
				  </tr>
				  
				</tbody>
			  </table>
			 
			 <div style="float: right;">
				<button class="btn blueBtn" type="button" onclick="addRsvModalBtn2()">확인</button>
				<button class="btn grayBtn" type="button" data-dismiss="modal">취소</button>
			 </div>
			 <br style="clear: both;">
			 </form>
		  </div>
		  
		 </div>
	   </div>
	 </div>
	</div>
	

	 <!-- (modal) 예약하기 모달에 이용가능한 자원명 리스트를 select 해옴 -->

	
	

</body>
</html>