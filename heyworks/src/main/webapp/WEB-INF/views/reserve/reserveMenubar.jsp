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
</style>
</head>
<body>

	
		
		 <div id="menubar">
            <p><i class="fas fa-angle-double-right"></i> 예약</p>
			<button type="button" class="btn btn-primary" id="reservebtn">+예약하기</button>
			<br><br>
			<a href="myReserve.re" style="color: black;">
			<i class="fas fa-cog" style= "margin-left: 20px;"></i> 
			<span style="font-weight: bold; font-size: 13px;">나의 예약 목록</span><br><br></a>
			
			<!-- 자원카테고리불러오기 -->
			<ul id="resources">
				<!-- <c:forEach var="c" items="${ clist }">
				<li><a href="reserve.re"><i class="fas fa-history"></i> ${c.categoryName }</li></a> <br>
				</c:forEach> -->
			</ul>


			<!-- 관리자만 보일수있게 -->
			<div id="adminSetting">
				<a href="" style="color: black;"><i class="fa-solid fa-gear"></i> 자원관리</a>
			</div>
        </div>
		 
		 
		 <script>
	
	
			// 메뉴바 카테고리 select해오기
	 	 $(function(){
	 		MenuCategoryList();
		})
		
		
		function MenuCategoryList() {
			
			$.ajax({
			
				url: "menuCategoryList.re",
				data:{},
				success: function(clist) {
					console.log(clist);
					
					let value = "";
    				for(let i in clist){
    					value += "<li><a href='reserve.re?cno="+ clist[i].categoryNo + "'><i class='fas fa-history'></i>" + clist[i].categoryName + "</li></a><br>"
    				}
					
    				$("#resources").html(value);
    				
				},error:function() {
					console.log("카테고리조회 ajax통신실패")
				}
				
			})
			
		}
	
	
	</script>
	
	

	<%-- 예약하기 모달 --%>
	<div id="addRsvModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
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
					<td >
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
					<th>자원선택</th>
					<td><select class="addRsSelect" name="fk_reservation_resource_no"></select></td>
				  </tr>
				  
				  <tr>
					<th>사용용도</th>
					<td><input class="form-control modal_input" name="reason" type="text" style="height: 30px;" /></td>
				  </tr>
				  
				</tbody>
			  </table>
			 
			 <div style="float: right;">
				<button class="btn blueBtn" type="button" onclick="addRsvModalBtn()">확인</button>
				<button class="btn grayBtn" type="button" onclick="window.closeModal()">취소</button>
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