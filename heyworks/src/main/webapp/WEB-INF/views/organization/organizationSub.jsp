<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
        margin: auto;
        margin-top:20px;
        margin-left:40px;
        width: 900px;
        height: 900px;
    }
    .contents .searchbar {
        margin-top: 30px;
        margin-bottom: 20px;
    }
    .contents .input-group {
        width: 350px;
    }
    .searchbar, .goAdmin {
        display: inline-block;
    }
    .goAdmin { 
        margin-top: 30px;
        margin-bottom: 50px;
        float: right;
    }
    .goAdmin button {
        width: 200px;
        height: 35px;
    }
    .chart {
        width: 900px;
        padding-bottom: 40px;
        border-bottom: 1px solid lightgray;
    }
    .chart dl{
        display: inline-block;
        width: 160px;
        height: 72px;
        margin-top: 25px;
        margin-right: 50px;
        position: relative;
        cursor: pointer;
    }
    .chart .picture {
        position: absolute;
        top: 0;
        left: 0;
        width: 70px;
        height: 70px;
        border-radius: 4px;
    }
    .chart .name {
        padding-top: 3px;
        padding-bottom: 5px;
        font-weight: bold;
    }
    .chart .name, .chart .teams, .chart .position {
        margin-left: 90px;
        width: 136px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .chart-area .deptName {
        margin-top: 30px;
    }
    #detail1 {
        width: 250px;
        height: 80px;
    }
    #detail1 .image {
        float: left;
        width:80px;
        height:80px;
    }
    image img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    #detail1 .inform {
        width: 160px;
        height: 80px;
    }
    .inform ul {
        padding-left: 13px;
        margin-top: 8px;
        list-style: none;
    }
    .image, .inform {
        display: inline-block;
    }
    .modal-body { margin-left: 10px; }
    #detail2 table {
        font-size: 14px;
        margin-top: 10px;
    }
    #detail2 th {
        width: 82px;
        height: 20px;
        text-align: left;
    }
    .myModal { margin-top: 50%; }
    /* modal position(center)*/
    .modal {
        text-align: center;
    }
    @media screen and (min-width: 768px) {
        .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
        }
    }
    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }
</style>
</head>
<body>
    
    <div class="outer">
   
      <jsp:include page="../common/menubar.jsp" />
      <jsp:include page="organizationSidebar.jsp" />
   
        <div class="contents">
          
            <!--검색바-->
            <form class="searchbar" method="get" action="search.organ">
                <div class="input-group">
                  <input name="userName" type="text" class="form-control" placeholder=" 이름 검색">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="submit" style="height: 34px;">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </div>
                </div>
            </form>
            
            <!--관리자모드 전환 버튼-->
            <c:if test="${ loginUser.adminYn eq 'Y' }">
	            <div class="goAdmin">
	                <button type="button" class="btn btn-primary"><i class="fa-solid fa-gears"> 임직원 / 조직도 관리</i></button>
	            </div>
            </c:if>
            
            <!--조직도-->
            <div class="chart-area">

                <!--소속임직원-->
                
               	<div class="deptName">
                  	<i class="fa-solid fa-bars" style="font-size: 20px;"> ${ dt.deptName }</i>
              		</div>
               	<div class="chart">
                	<c:forEach var="e" items="${ organ }">
		                    <dl class="userList" data-toggle="modal" data-target="#myModal">
		                    	<c:choose>
		                    		<c:when test="${e.status eq 'R '}">
				                        <dt class="name">${ e.userName }<span style="color:rgb(147, 177, 223);">(휴직)</span></dt>
				                    </c:when>    
			                        <c:otherwise>
			                        	<dt class="name">${ e.userName }</dt>
			                        </c:otherwise>
		                        </c:choose>
		                        <dd class="picture">
		                            <img class="image" src="${ e.image }" style="display: inline-block; width:85px; height:85px; border-radius:100px;">
		                        </dd>
		                        <dd class="teams">${ e.deptName }</dd>
		                        <c:choose>
		                        	<c:when test="${ e.jobCode eq '0' }">
		                        		<dd class="position">-</dd>	
		                        	</c:when>
		                        	<c:otherwise>
		                        		<dd class="position">${ e.jobName }</dd>	
		                        	</c:otherwise>
		                        </c:choose>
		                        <dd class="userNo" style="display:none;">${ e.userNo }</dd>
		                    </dl>
                    </c:forEach>
               	</div>

            </div>

        </div>

    </div>
                
                
	<!-- 임직원 상세보기 모달창 -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm">
    
            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-header" style="padding:5px 15px 8px 15px;">
                    <h5 style="padding-top:8px;" class="modal-title">직원정보</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <div id="detail1">
                        <div class="image">
                            <img src="사진">
                        </div>
                        <div class="inform">
                            <ul>
                                <li><b>직원명</b></li>
                                <li>SAMJO | xx팀</li>
                                <li>직급</li>
                            </ul>
                        </div>
                    </div>
                    <div id="detail2">
                        <table>
                            <tr>
                                <th>이메일</th>
                                <td>usermail@naver.com</td>
                            </tr>
                            <tr>
                                <th>사내전화</th>
                                <td>02) 123-1234</td>
                            </tr>
                            <tr>
                                <th>휴대전화</th>
                                <td>010-1234-1234</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn btn-default" style="margin-right:5px;">쪽지보내기</button>
                    <button type="button" class="btn btn-primary" style="margin-left:5px; margin-right:30px;">이메일 복사</button>
                </div>
            </div>
    
        </div>
      </div>
    
    <!-- 임직원 상세조회 -->
    <script>
		
		$(function(){
			$(document).on('click', '.userList', function(){
				
				var userNo = $(this).children(".userNo").text();
				console.log(userNo);
				
				$.ajax({
					url:"detail.emp",
					data:{userNo:userNo},
					success:function(emp){
						//console.log(emp);
						
						var result1 = "";
						
						result1 += "<div class='image'>"
								 + "<img src='" + emp.image + "'>" 
                    		     + "</div>"
                    		     + "<div class='inform'>"
                    		     + "<ul>"
                    			 + "<li><b>" + emp.userName + "</b></li>"
                    			 + "<li>SAMJO | " + emp.deptName + "</li>"
                    			 + "<li>" + emp.jobName + "</li>"
                    		     + "</ul>"
                    		     + "</div>";
                   		$("#detail1").html(result1);
                   		
                   		var result2 = "";
                   		
                   		result2 += "<table>"
                   				 + "<tr>"
                   				 + "<th>이메일 </th>"
                   				 + "<td>" + emp.email + "</td>"
                   				 + "</tr>"
                   				 + "<tr>"
                   				 + "<th>사내전화</th>"
                  				 + "<td>" + emp.call + "</td>"
                  				 + "</tr>"
                  				 + "<tr>"
                   				 + "<th>휴대전화</th>"
                  				 + "<td>" + emp.phone + "</td>"
                  				 + "</tr>"
                  				 + "</table>"
                  		$("#detail2").html(result2);		 
						
					}, error:function(){
						console.log("ajax통신실패")
					}
				})
			})
		})
	
	</script>
    
    <!-- 관리자모드 전환 스크립트 -->
    <script>
    	
    	$(function(){
    		
    		$('.goAdmin').click(function(){
    			location.href="list.adminOrgan";
    		})
    		
    	})
    
    </script>
   

</body>
</html>