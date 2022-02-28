<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    @font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .inf-outer{
       width: 950px;
	   height:100%;
	   display:inline-block;
       padding-left:30px;
       padding-top:30px;
    }
    .title-box{font-size:20px; font-weight:600; font-family: 'Cafe24SsurroundAir';}
    .working-box-list{
        list-style:none;
        height:100px;
    }
    .working-box-list, .working-box-list>li{
        float:left;
    }
    .working-box>strong{
        position:absolute;
        font-size:16px;
        font-family: 'Cafe24SsurroundAir';
    }
    .working-box-list{
        position:relative;
        top:30px;
    }
    .working-box-list{
        border:1px solid lightgray;
        border-radius:5px;
        margin-right:20px;
    }
    .working-box>ul{margin-right:35px;}
    .working-box-list>li{
        text-align:center;
        margin-top:20px;
        margin-right:20px;
        padding-right:15px;
        font-size:13px;
        font-family: 'Cafe24SsurroundAir';
    }

    /*주간 근무 정보*/
    #left, #right:hover{cursor:pointer;}
    .week-select{font-size:20px; font-weight:700; font-family: 'Cafe24SsurroundAir';}
    .table-bordered th{font-size:14px; text-align:center; font-family: 'Cafe24SsurroundAir';}
    .table-bordered td{font-size:13px; font-family: 'Cafe24SsurroundAir';}
    .tb-body tr{height:37px;}
</style>
</head>
<body>

    <div class="outer">

        <jsp:include page="../common/menubar.jsp"/>
        <jsp:include page="workingSidebar.jsp"/>

        <!-- 올해 근무 정보 -->
        <div class="inf-outer" style="display:inline;">
            <div class="year-outer">

                <div class="title-box">
                    	올해 근무 정보
                </div><br>
    
                <div class="working-box">
                    <strong><img src="resources/images/to-do-list.png" style="width: 20px; height: 20px;"> 근무일수 및 현황</strong>
                    <ul class="working-box-list" style="width:510px">
                        <li style="border-right:1px solid lightgray;">
                            <strong style="margin-left:40px;">총 근무일수</strong><br><br>
                            <span style="margin-left:35px;">19일</span>
                        </li>
                        <li style="border-right:1px solid lightgray;">
                            <strong>정상근무</strong><br><br>
                            <span>14회</span>
                        </li>
                        <li style="border-right:1px solid lightgray;">
                            <strong>연장근무</strong><br><br>
                            <span>3회</span>
                        </li>
                        <li style="border-right:1px solid lightgray;">
                            <strong>조기퇴근</strong><br><br>
                            <span>0회</span>
                        </li>
                        <li>
                            <strong>퇴근 미체크</strong><br><br>
                            <span>0회</span>
                        </li>
                    </ul>
                </div>
    
            </div>
    
            <br><br><br><br><br><br><br><br><br><br>
    
            <!--주간 근무 정보-->
            <div class="week-outer" style=height:600px;>
    
                <div class="title-box">
                    	주간 근무 정보
                </div><br>
    
                <div class="week-select" align="center">
                    <!--<span id="left"> < </span>  -->
                    <img src="resources/images/left-arrow.png" id="left" style="width: 20px; height: 20px;">
                    <label id="startDate">2022-02-28</label> ~ 
                    <label id="endDate">2022-03-06</label>
                    <img src="resources/images/right-arrow.png" id="right" style="width: 20px; height: 20px;">
                </div><br><br>
    
                <table class="table-bordered">
                    <thead class="tb-head">
                        <tr height="45px">
                            <th width="160">날짜</th>
                            <th width="165">근무스케줄시간</th>
                            <th width="95">출근시각</th>
                            <th width="95">퇴근시각</th>
                            <th width="95">휴게시간</th>  
                            <th width="95">연장근무</th>
                            <th width="100">총 근무시간</th>
                            <th width="110">근태상태</th>
                        </tr>
                    </thead>
                    <tbody align="center" class="tb-body" id="weekTna">

                    </tbody>
                    <script>
                        $(function(){
                            selectWeekList();
                        });
                        
                        $("#left").click(function(){
                        	
                        	var startDate = $("#startDate").text();
                        	var startDateArr = startDate.split("-"); 
                        	//console.log(startDateArr); // ['2022', '02', '21']
                        	
                        	var stDate = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);    
                        	var agoSt = new Date(stDate.setDate(stDate.getDate() -7+1)).toISOString().substring(0,10);
                        	
                          	//console.log(stDate); // Mon Feb 21 2022 09:00:00 GMT+0900 (한국 표준시)
                            console.log(agoSt);
                            
                          	var endDate = $("#endDate").text();
                          	var endDateArr = endDate.split("-"); 
                        	
                          	var edDate = new Date(endDateArr[0], endDateArr[1]-1, endDateArr[2]);    
                        	var agoed = new Date(edDate.setDate(edDate.getDate() -7+1)).toISOString().substring(0,10);                         	
                            
                        	document.getElementById("startDate").innerHTML = agoSt;
                        	document.getElementById("endDate").innerHTML = agoed;
                        	
                        	selectWeekList();
                        })
                        
                            $("#right").click(function(){
                        	
                        	var startDate = $("#startDate").text();
                        	var startDateArr = startDate.split("-"); 
                        	//console.log(startDateArr); // ['2022', '02', '21']
                        	
                        	var stDate = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);    
                        	var nextSt = new Date(stDate.setDate(stDate.getDate() +7+1)).toISOString().substring(0,10);	

                            console.log(nextSt);
                            
                          	var endDate = $("#endDate").text();
                          	var endDateArr = endDate.split("-"); 
                        	
                          	var edDate = new Date(endDateArr[0], endDateArr[1]-1, endDateArr[2]);    
                        	var nexted = new Date(edDate.setDate(edDate.getDate() +7+1)).toISOString().substring(0,10);                         	
                            
                        	document.getElementById("startDate").innerHTML = nextSt;
                        	document.getElementById("endDate").innerHTML = nexted;
                        	
                        	selectWeekList();
                        })

                        // 리스트 조회해오는 ajax
                        function selectWeekList(){
                            //var startDate = $("#startDate").val();
                            //var endDate = $("#endDate").val();
                            var startDate = $("#startDate").text();
                            var endDate = $("#endDate").text();
							
                            $.ajax({
                                url:"selectMyall.wo",
                                data:{startDate:startDate, 
                                      endDate:endDate}
                                ,success:function(wlist){
                                	
                					let list = "";
                					for(let i in wlist){
                						if(wlist[i].clockIn == null){ // 출근시간 x 
                    						list += "<tr>"
   										     + "<td>" + wlist[i].tnaDate + "(" + wlist[i].tnaDay + ")" + "</td>"
   										     + "<td>" + "08:00 ~ 17:00" + "</td>"
   										     + "<td>" + " " + "</td>"
   										     + "<td>" + " " + "</td>"
   										     + "<td>" + " " + "</td>"
   										     + "<td>" + " " + "</td>"
   										     + "<td>" + " " + "</td>"			     
   										     + "<td><font color='blue'>" + wlist[i].tnaStatus + "</td>"
   										     + "</tr>";	
                						}else{
                    						list += "<tr>"
   										     + "<td>" + wlist[i].tnaDate + "(" + wlist[i].tnaDay + ")" + "</td>"
   										     + "<td>" + "08:00 ~ 17:00" + "</td>"
   										     + "<td>" + wlist[i].clockIn + "</td>"
   										     + "<td>" + wlist[i].clockOut + "</td>"
   										     + "<td>" + "01:00" + "</td>"
   										     + "<td>" + wlist[i].overTime + "시간" + "</td>"
   										     + "<td>" + wlist[i].workTime + "시간" + "</td>";	
   										     
   										     if(wlist[i].tnaStatus == "연장근무"){
   										    	 list += "<td><font color='red'>" + wlist[i].tnaStatus + "</td>";
   										     }else if(wlist[i].tnaStatus == "정상근무"){
   										    	 list += "<td><font color='green'>" + wlist[i].tnaStatus + "</td>";
   										     }
   										     list += "</tr>";	 
                						}
									}
                					    					
									$("#weekTna").html(list);
                                },error:function(){
                                	console.log("ajax통신 실패");
                                }
                            })
                        }
                    </script>
                    
                    
                    <!--
                    <tbody align="center" class="tb-body">
                    	<c:forEach var="w" items="${wlist}">
	                        <tr>
	                            <td>${w.tnaDate}(${w.tnaDay})</td>
	                            <td id="holiday">
                                    <c:if test="${w.tnaDay eq'토'}"><font color="blue">공휴일</font></c:if>
                                    <c:if test="${w.tnaDay eq'일'}"><font color="red">법정공휴일</font></c:if>
                                </td>
	                            <td>08:00~17:00</td>
	                            <td>${w.clockIn}</td>
	                            <td>${w.clockOut}</td>
	                            <td>01:00</td>
	                            <td>${w.workTime}</td>
	                            <td>${w.overTime}</td>
	                            <td>
                                    <c:if test="${w.tnaStatus eq'연장근무'}">
                                    <font color="red">${w.tnaStatus}</font></c:if>
                                    <c:if test="${w.tnaStatus eq'정상근무'}">
                                    <font color="green">${w.tnaStatus}</font></c:if>
                                    <c:if test="${w.tnaStatus eq'휴가'}">
                                    <font color="blue">${w.tnaStatus}</font></c:if>
                                </td>
	                        </tr>
                            
                        </c:forEach>
                    </tbody>
                    -->

                </table>
            </div>
        </div>
        
    </div>
</body>
</html>