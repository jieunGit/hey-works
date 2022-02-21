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
	
	

   #detail{
		width: 950px;
	   height:800px;
	   display:inline-block;
	   border: 1px solid lightgray;
   }


   #toparea{
	   width: 200px;
	   height: 50px;
	  
	   margin-left: 50px;
	   font-weight: bolder;
   }
   .thead-dark th{
		font-size: 13px;
   }
   
   table>tbody>tr{
	   font-size: 12px;
	   text-align: center;
   }
  #pagingArea{width:fit-content;margin:auto;}

  .table button{
	  font-size: 11px;
	 
  }
</style>
</head>
<body>

	<script>
		 // 이벤트를 클릭시 예약 상세보기 모달 띄우기
		 function viewRsv(reserveNo){
			$.ajax({
				url:"readDetailRsvList.re",
				type:"get",
				data: {reserveNo:reserveNo},
				dataType:"JSON",
				success:function(json){
					var html = "";
					
					html += "<tr>";
					html += "<th>분류명</th>";
					html += "<td>" + json.categoryName + "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<th>자원명</th>";
					html += "<td>" + json.resourceName + "</td>";
					html += "</tr>";
				
					html += "<tr>";
					html += "<th>시작시간</th>";
					html += "<td>" + json.startDate + "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<th>종료시간</th>";
					html += "<td>" + json.endDate + "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<th>등록자</th>";
					html += "<td>" + json.userName+ "</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<th>사용용도</th>";
					html += "<td>" + json.reserveContent+ "</td>";
					html += "<input type='hidden' class='reservation_no' id='reserve_no' value='" + reserveNo + "' >";
					html += "</tr>";
					
					$("tbody.detailTbody").html(html);
					
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});
			
			$("#showDetailRsvModal").modal('show');
  }



//   // 예약 취소하기 버튼을 클릭시 실행하는 함수(모달을 띄워주기만 함)
//   function rsvCancelBtn(reserveNo) {
//       $("input.hidden_reservation_no").val(reserveNo);
//       $('#cancelRsvCheckModal').modal('show');
//    }


    // 예약 취소를 DB에서 처리해주는 함수
	function cancelRsv() {
		// var reserveNo = $("#reserve_no").val();
      
      $.ajax({
         url:"rsvCancel.re",
         type:"get",
         data: {
			 	reserveNo : $("#reserveNoTag").val()
		 
		 },
         dataType:"JSON",
         success:function(json){
			 
            if (json.result == 1) {
            
			alertify.alert("성공적으로 예약이 취소되었습니다.")

			window.closeModal();
			location.reload();
		
            }else{
               alert("DB오류");
            }
            
         },
         error: function(request, status, error){
            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
      });
   }

	</script>
	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
		
		

		<div id="detail">
			<br>
			<div id="toparea"><span>나의예약목록</span></div>
			<br>
			<div class="container">
				<table class="table" style="width: 800px; margin-left: 40px;">
					<thead class="thead-dark" style="text-align: center;">
						<tr>
							<th width="150px">분류</th>
							<th width="150px"> 자원명</th>
							<th width="300px"> 예약시간</th>
							<th width="200px">상태</th>
						</tr>
					</thead>

					<!-- ajax로 상세보기, 예약취소 구현 -->
					<tbody>
					<c:forEach var="r" items="${ list }">
						<tr>
							<input type="hidden" id="reserveNoTag" value="${r.reserveNo}" name="reserveNo">
							<td>${ r.categoryName }</td>
							<td>${ r.resourceName }</td>
							<td>${ r.startDate }~${ r.endDate }</td>
							<td>
								<button type="button" class="btn grayBtn btn-sm" onclick="viewRsv(${r.reserveNo})">상세보기</button>
								<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#cancelRsvCheckModal">취소</button>
							</td>
						</tr>
					</c:forEach>
					
						
					
					</tbody>
				</table>
			</div><br><br>

			<div id="pagingArea">
                <ul class="pagination pagination-sm">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link " href="#"><i class="fa-solid fa-angles-left"></i> </a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage-1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="myReserve.re?cpage=${ pi.currentPage+1 }"><i class="fa-solid fa-angles-right"></i></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
           





		</div>
	
	</div>
	


	<!-- 예약 상세정보 보여주기 모달  -->
	<div id="showDetailRsvModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
		  <!-- Modal content-->
		  <div class="modal-content">
			<div class="modal-header">
			   <h4 class="modal-title" style="font-weight: bold;">예약정보</h4>
			  <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
			</div>
			<div class="modal-body">
			  <div class="container">
				   <form>
				 <table class="table table-borderless">
				   <tbody class="detailTbody">
					 
				   </tbody>
				 </table>
			 
			
				<button class="btn grayBtn" style="float: right;" type="button" onclick="window.closeModal()">확인</button>
				</form>
			 </div>
			</div>
		  </div>
		</div>
	   </div>
	

	
	   <%-- 취소 버튼 클릭 시 정말 취소할 것인지 묻는 모달 --%>
	   <div class="modal fade" id="cancelRsvCheckModal" role="dialog">
		<div class="modal-dialog modal-sm">
		  <div class="modal-content">
			<div class="modal-header">
				<!-- <h4 class="modal-title">예약 삭제</h4> -->
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			  <label>정말 예약을 취소하시겠습니까?</label>
			  <input class="hidden_reservation_no" type="hidden">
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn blueBtn" onclick="cancelRsv()">예</button>
			  <button type="button" class="btn grayBtn"  data-dismiss="modal">아니오</button>
			</div>
		  </div>
		</div>
	  </div>
</body>
</html>