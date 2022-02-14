<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>

<link href='<%= ctxPath %>/resources/packages/core/main.css' rel='stylesheet' />
<link href='<%= ctxPath %>/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%= ctxPath %>/resources/packages/timegrid/main.min.css' rel='stylesheet' />
<script src='<%= ctxPath %>/resources/packages/core/main.js'></script>
<script src='<%= ctxPath %>/resources/packages/daygrid/main.js'></script>
<script src="<%= ctxPath %>/resources/packages/interaction/main.min.js"></script>
<script src="<%= ctxPath %>/resources/packages/timegrid/main.min.js"></script></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<style>

.outer{
		width:1200px;
		height:1200px;
		margin:auto;
	}
	.outer>div{float:left;}
	
	#detail{
	    width: 950px;
	   height:100%;
	   display:inline-block;
	   border: 1px solid lightgray;
   }
	#toparea{
	   width: 200px;
	   height: 50px;
	   margin-left: 30px;
	   font-weight: bolder;
   }
 	#resourceContent{
 		width:900px;
 		height:120px;
 		margin-left: 30px;
 		
		background-color: rgba(211, 211, 211, 0.233);
 	
 	}

	 #resourceImg{
		 width: 120px;
		 height: 120px;
		 border: 1px solid red;
		 display:inline-block;
	 }
	 #content{
		 display: inline-block;
		 text-align: left;
		 width: 800px;
		 height: 120px;
		 margin:10px 0px 0px 0px;
		 font-size: 13px;
		
	 }

     .line{
    background: lightgray;
    width: 900px;
    height: 1px;
    margin-left: 50px;


    body.stop-dragging
   {
     -ms-user-select: none; 
     -moz-user-select: -moz-none;
     -khtml-user-select: none;
     -webkit-user-select: none;
     user-select: none;
   }

   html, body {
     margin: 0;
     padding: 0;
     font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
     font-size: 14px;
   }
   
   h2.pageTitleText{
      border: solid 0px red;
      margin: 18px;
      margin-bottom: 13px;
      margin-left: 9%;
      font-weight: bold;
      font-size: 15pt;
      color: #6a6a69;
   }
   
   .fc-event{
      cursor: pointer;
    }
   
   div.cal_sidebar{
      background-color: white;
   }
   
   .nav_ul{
      list-style-type: none;
      margin-left: -10%;
   }
   
   .nav_ul_p{
      padding: 0;
      margin: 0;
   }
   
   .largeText{
      color: #6a6a69;
      font-weight: bold; 
      font-size: 11pt;
   }
   
   .smallText{
      padding: 0;
      margin: 0;
      color: black;
      line-height: 27px;
      cursor: pointer;
   }
   
   div.add_calendar_box{
      padding-top: 15px;
   }
   
   a.add_calendar{
      cursor: pointer;
      color: black;
   }
   
   li span.btn_wrap{
      position: absolute;
      right: 24px;
   }
   
   #external-events {
     border: solid 1px red;
     display: none;
     z-index: 2;
     top: 20px;
     left: 20px;
     width: 150px;
     padding: 0 10px;
     border: 1px solid #ccc;
     background: #eee;
     margin: 0;
   }
   .demo-topbar + #external-events { /* will get stripped out */
     top: 60px;
   }

   #external-events .fc-event {
     margin: 1em 0;
     cursor: move;
   }
   #calendar-container {
     position: relative;
     z-index: 1;
     margin-left: 20px;
   }
   #calendar {
     width: 100%;
     height: auto;
     margin: 0 auto;
   }
   
   .dot {
     height: 12px;
     width: 12px;
     background-color: #bbb;
     border-radius: 50%;
     display: inline-block;
     cursor: pointer;
   }
   
   .fc-row > table > thead > tr > th.fc-today{
      background: #b5a8b9 !important;
   }
   
   /* 오늘날짜 cell 색상 없애기 */
   .fc-unthemed .fc-today {
        background: rgba(64, 163, 245, 0.411) !important;
       border-top: 1px solid #ddd !important;
       font-weight: bold !important;
       color: black;
   }
   
   .table-borderless > tbody > tr > td,
   .table-borderless > tbody > tr > th,
   .table-borderless > tfoot > tr > td,
   .table-borderless > tfoot > tr > th,
   .table-borderless > thead > tr > td,
   .table-borderless > thead > tr > th {
       border: none;
   }
   
   /* 일정등록 Modal css */
   input.datepicker{
      width: 130px;
   }
   
   input.modal_input{
      height: 30px;
   }
   
   .clickSmallText{
      font-weight: bold;
      color: #97b8e0;
   }
   
   /* (Modal)예약 상세보기 */
   .table > tbody > tr > td {
     vertical-align: middle;
   }
   
   .table-borderless > tbody > tr > td,
   .table-borderless > tbody > tr > th,
   .table-borderless > tfoot > tr > td,
   .table-borderless > tfoot > tr > th,
   .table-borderless > thead > tr > td,
   .table-borderless > thead > tr > th {
       border: none;
   }
   
   .detailTbody th tr{
      font-size: 12pt;
   }
   
   .container{
      background-color: white;
      margin: 0 auto;
      margin-top: 2%;
      width: 97%;
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
   
   .redBtn{
      border-radius: 4px;
      background-color: #d53641;
      color: white;
   }
      
   /* 내가한거 */
   #toparea{
	   width: 900px;
	   height: 50px;
	   margin : 30px 0px 30px 30px;
	   font-weight: bolder;
	   font-size: 18px;
   }


</style>

<script type="text/javascript">

    /*
        ================ 캘린더 함수 정리 ================
        
       info.dateStr
       info.event.title
           
       calendar.refetchEvents() => 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
       calendar.addEvent( {'title':'evt4', 'start':'2020-12-04', 'end':'2020-12-04'});  ==> 이벤트를 추가하는 함수
       calendar.gotoDate (날짜) => 달력을 임의의 날짜로 이동
       
       
       var date = calendar.getDate(); ==> 현재 날짜 받기
       alert(date.toString()); ==> 현재 날짜 출력?(date.toString())
       date = moment(date).format("YYYY-MM");  ==> 받은 날짜를 원하는 형식으로 변경(cdn 추가해야 함)
       
       allDay 는 event.push 안에 title, start 처럼 줘야 함
       
    */
    
    
    
    // 캘린더 전역변수 설정
    var calendar;
    
    // 처음 초기값은 1 => 회의실1 정보를 불러옴
    var fk_reservation_resource_no = 1;
    
    //전체 모달 닫기
    window.closeModal = function(){
        $('.modal').modal('hide');
        
    };
    
    $(document).ready(function() {
    
       $(".rsvCancelBtn").hide();
       
       // 처음 페이지에 들어왔을 때 1번 회의실로 설정
       $("label.firstSmallText").addClass("clickSmallText");
       
       // 사이드바의 자원명을 선택했을 시 선택한 텍스트의 색을 변경
       $("label.smallText").click(function() {
          $("label.smallText").removeClass("clickSmallText");
          $(this).addClass("clickSmallText");
       });
    
    });
    
    //달력 초기화
    document.addEventListener('DOMContentLoaded', function() {
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendarInteraction.Draggable;   //드래그 가능한
     
        //3개의객체 참조중
        var containerEl = document.getElementById('external-events');   //myevent  div
        var calendarEl = document.getElementById('calendar');			//달력 div
        var checkbox = document.getElementById('drop-remove');			//드래그앤드랍 제거
     
        // initialize the external events
        // -----------------------------------------------------------------
     
        //드래그가 가능한 객체 정의
        new Draggable(containerEl, {
          itemSelector: '.fc-event',   //fc-event : 각 이벤트
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });
     
        // initialize the calendar
        // -----------------------------------------------------------------
        calendar = new Calendar(calendarEl, {
          plugins: [ 'interaction', 'timeGrid' ],
          //헤더부분 가능
          header: {
            left: 'prev viewWeekends',
            center: 'title ',
            right: 'next today',
          },
          // 한국어변경
          locale: 'ko',
          dateClick: function(info) {
               
                // 이전날짜에 예약 불가
                var sysdate = new Date();
                sysdate = moment(sysdate).format("YYYY-MM-DD HH:mm:ss");
                
                var date = moment(info.dateStr).format("YYYY-MM-DD");
                
                // 오늘만 시간이 지났어도 예약 가능하게 함
                if (sysdate > date + 1) {
                alertify.alert("지난 시간은 예약할 수 없습니다.");
             }else{
                addRs();   // 모달을 초기화하고 자원명을 불러오는 함수
                
                // 클릭한 시각으로 모달의 datepicker를 변경시킴
                  $("input[name=startday]").val(date);   
                 $("input[name=endday]").val(date);
                  
                 var hhmm = moment(info.dateStr).format("HH:mm");
                  $("select.startday_hour").val(hhmm).change();
                  $("select.endday_hour").val(hhmm).change();
             }
                
             
          },
          eventClick: function(info) {
                  viewRsv(info.event.id);
          },
          selectable: true,
          navLinks: false,             // 달력의 날짜 텍스트를 선택할 수 있는지 유무
          editable: false,				//수정가능여부
          eventLimit: true,            // 셀에 너무 많은 일정이 들어갔을 시 more로 처리
          allDaySlot: false,
          customButtons: { //주말 숨기기 & 보이기 버튼
             today : {
                text  : '오늘',
                click : function () {
                   calendar.today();
                }
              },
              prev : {
                 click : function () {
                    calendar.prev();
             }
              },
              next : {
                 click : function () {
                    calendar.next();
             }
              }
              
              
             },
             events: function (info, successCallback, failureCallback){
                $.ajax({
                  url:"selectRsvList.re",
                  data:{
                      resourceNo:fk_reservation_resource_no,
                      categoryNo:${rc.categoryNo}
                },
                  type:"GET",
                  dataType:'JSON',
                  success:function(json){
                   
                     var events = [];
                   $.each(json, function(index, item){
                    
                        
                    if (json.length > 0) {
                         events.push({
                                   title: item.userName,  //표시되는제목
                                   start: item.startDate,  //예약시작날짜 표시
                                   end: item.endDate,      // 예약 끝날짜 표시
                                   color: "skyblue",    
                                   id: item.reserveNo  //고유번호
                                });
                      }else{
                         // 검색된 결과가 없을 때
                      }
                      
                   });
    
                    successCallback(events);  
                  },
                  error: function(request, status, error){
                     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                   }
               });
                
             }
             
            });
        
        calendar.render();  //캘린더 렌더링
      });
      
    

      // (modal) 예약하기 모달에 이용가능한 자원명 리스트를 select 해옴
    function addRs(){
     
     // 모달 form에 입력돼있는 정보를 모두 삭제하고 모달을 보이게 함(모달 초기화)
     $('#addRsvModal').find('form')[0].reset();  //addRsvModal 모달 id
     $('#addRsvModal').modal('show');
     
     $.ajax({
      url:"readRsList.re",
      data : {
            categoryNo:${rc.categoryNo}
      },
      type:"get",
      dataType:"JSON",
      success:function(json){
         var html = "";
         if (json.length > 0) {
            $.each(json, function(index, item){
               if (item.resourceNo == fk_reservation_resource_no) {
                  html += "<option value='" + item.resourceNo + "' selected >" + item.resourceName + "</option>";
               }else{
                  html += "<option value='" + item.resourceNo + "'>" + item.resourceName + "</option>";
               }
               
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
     

    // 자원을 변경했을 시 자원 변수값을 변경해주는 함수
function changeResource(rsNo) {
    fk_reservation_resource_no = rsNo;
    calendar.refetchEvents();   
  }
    </script>
</head>
<body class='stop-dragging'>


    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
	
		<div id="detail">
			<br>
			<div id="toparea"><span>${rc.categoryName} 예약</span></div>
			
			
			<div id="resourceContent">
				<div id="content">
					
					${rc.categoryContent}
				</div>

			</div>
			<br><br>

			<div id="resourceList" style="margin-left: 50px;">

				<c:forEach var="r" items="${ rlist }">
				<a href="" style="color: black" >${r.resourceName}</a>&nbsp;&nbsp;
                </c:forEach>

			</div>

			<div class="line"></div>
			<br>



            <div id="external-events">
				<!-- <p>
					<strong>Draggable Events</strong>
				</p>
				<div class="fc-event">My Event 1</div>
				<div class="fc-event">My Event 2</div>
				<div class="fc-event">My Event 3</div>
				<div class="fc-event">My Event 4</div>
				<div class="fc-event">My Event 5</div>
				<p>
					<input type="checkbox" id="drop-remove">
					<!-- 드래그앤드롭후 제거하는기능 -->
					<!-- <label for="drop-remove">remove after drop</label>  
				</p> -->
			</div>
			<div id="toparea"><i class="fas fa-history"></i> 회의실1</div>

			<div style="border: solid 0px red; margin-left:2%; margin-right: 0.5%;">
				<!-- 달력위치 -->
				<div id='calendar'>
				</div>
			</div>





        </div>

    </div>




    
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
</body>
</html>