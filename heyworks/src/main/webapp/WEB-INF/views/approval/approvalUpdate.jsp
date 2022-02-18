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
		height:2000px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        margin-left:20px;
        width: 900px;
        height: 2000px;
    }
    #btns{width: 100%;}
    #btns a{
        text-decoration: none;
        /*색깔수정하기*/
    }
    .table-bordered *{
        height: 40px;
        font-size: 13px;
    }
    .table-bordered th{
        background-color: rgb(245, 244, 244);
        text-align: center;
    }
    .table-bordered td{text-align: center;}
    #form-type{
        font-size: 25px;
        font-weight: 800;
        text-align: center;
    }
    #attachment-div{
        width: 100%;
        height: 60px;
        background-color: rgba(224, 224, 224, 0.34);
        line-height: 60px;
    }
     /*결재 사원 조회*/
    summary{font-weight: 700;}
    #confirm-body *{float: left;}
    #deptCode{width: 300px;}
    #deptCode summary{margin-left: 20px;}
    #deptCode button{
        width: 100%;
        padding-left: 40px;
        text-align: left;
        margin-top: 10px;
    }
    #searchNsawon{
        width: 420px;
        border: 1px solid lightgray;
        height: 300px;
    }
    #searchNsawon>div{width: 100%;}
    #searchNsawon table{
        width: 100%;
        margin: 0px;
    }
    #searchNsawon table td, #searchNsawon table th{
        height: 50px;
        padding: 0px;
        line-height: 50px;
        text-align: center;
    }
    #searchNsawon table input{
        margin-top: 20px;
        margin-left: 20px;
    }
    #searchNsawon>div>button{height: 38px;}
    #line{
        width: 130px;
        height: 300px;
    }
    #line button{
        width: 110px;
        margin-top: 15px;
        margin-left: 10px;
        margin-bottom: 10px;
    }
    #nameCheck{width: 260px;}
    #nameCheck>p{
        width: 100%;
        height: 40px;
        margin-top: 5px;
        border: 1px solid lightgray;
        line-height: 40px;
        padding-left: 10px;
    }
    .table-bordered input, .table-bordered select{
    	width: 100%;
    	text-align:center;	
    }
    #line-list button>img{
        width: 15px; 
        height: 15px;
    }
    #line-list button{
        border: none; 
        background-color: white;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">

        <div style="width: 100%;"></div>
        <br><br>

        <div id="btns">
            <button type="button" class="btn btn-sm" onclick="history.back();">뒤로가기</button>
            <button type="button" class="btn btn-sm text-primary" onclick="postSubmit(1)">수정완료</button>
        </div>

        <hr>
		
		<form action="">
		
			<div id="form-type">업무기안서</div>
            <br>

            <table align="center" class="table-bordered">
                <tr>
                    <th colspan="2" width="200">문서번호</th>
                    <td colspan="3" width="250">${ap.approvalNo}</td>
                    <th colspan="3" width="225">기안부서</th>
                    <td colspan="3" width="225">${ap.writeDept}</td>
                </tr>
                <tr>
                    <th colspan="2">보안 등급</th>
                    <td colspan="3">
                        <select name="grade" id="grade">
                            <option value="C">C등급</option>
                            <option value="A">A등급</option>
                            <option value="S">S등급</option>
                        </select>
                    </td>
                    <th colspan="3">작성자</th>
                    <td colspan="3">${ap.userNo}</td>
                </tr>
                <tr>
                    <th colspan="2">참 조</th>
                    <td colspan="3" style="border-right: none;">
                        <input type="text" name="" style="border: none;" value="${ap.reference}" readonly required>
                    </td>
                    <th colspan="3">열 람</th>
                    <td colspan="3" style="border-right: none;">
                        <input type="text" name="" style="border: none;" value="${ap.read}" required>
                    </td>
                </tr>

                <!-- 결재라인 -->
                <tr id="line-list">
                    <th>결재라인</th>
                    <td width="25" style="border-left: none;">
                        <button type="button" data-target="#confirm-line" data-toggle="modal" >
                            <img src="resources/images/875068.png">
                        </button>
                    </td>
                    <c:forEach var="ce" items="${ap.confirmList}">
                    	<td colspan="3"><input name="" value="${ce.confirmUser}&nbsp;${ce.jobCode}" readonly></td>
                    </c:forEach>
                </tr>

                <!-- 증명서 일때 -->
                <c:if test="${!empty ce}">
                <tr>
                    <th colspan="2">증명서종류</th>
                    <td colspan="3"><input type="text" class="form-control" name="" value="${ce.certificateType}"></td>
                    <th colspan="3">용 도</th>
                    <td colspan="3"><input type="text" class="form-control" name="" value="${ce.use}"></td>
                </tr>
                <tr>
                    <th colspan="2">제출처</th>
                    <td colspan="3"><input type="text" class="form-control" name="" value="${ce.whereSubmit}"></td>
                    <th colspan="3">제출일</th>
                    <td colspan="3"><input type="date" class="form-control" name="" value="${ce.submitDate}"></td>
                </tr>
                </c:if>

                <!-- 채용요청서 일 때 -->
                <c:if test="${!empty rc}">
                <tr>
                    <th colspan="2">부 서</th>
                    <td colspan="3"><input type="text" class="form-control" name="" value="${rc.recruimentDept}"></td>
                    <th>인 원</th>
                    <td colspan="2"><input type="text" class="form-control" name="" value="${rc.employee}"></td>
                    <th>실무경력(년)</th>
                    <td colspan="2"><input type="text" class="form-control" name="" value="${rc.workExperience}"></td>
                </tr>
                <tr>
                    <th colspan="2">채용희망일</th>
                    <td colspan="3"><input type="date" class="form-control" name="" value="${rc.offerDate}"></td>
                    <th>자격사항</th>
                    <td colspan="2"><input type="text" class="form-control" name="" value="${rc.qualification}"></td>
                    <th>직위</th>
                    <td colspan="2"><input type="text" class="form-control" name="" value="${rc.position}"></td>
                </tr>
                </c:if>
            
                <!-- 일반 품의서 일 때 -->
                <c:if test="${!empty er}">
                <tr>
                    <th>시행날짜</th>
                    <td colspan="10"><input type="date" class="form-control" name="" value="${er.imposition}"></td>
                </tr>
                </c:if>

                <!-- 비품구매서 일 때 -->
                <c:if test="${!empty eb}">
                <tr>
                    <th>구매요청부서</th>
                    <td colspan="4">
                        <select name="deptCode" id="">
                            <option value="1">개발팀</option>
                            <option value="2">영업팀</option>
                            <option value="3">인사팀</option>
                            <option value="4">회계팀</option>
                            <option value="5">경영팀</option>
                        </select>
                    </td>
                    <th>납품요청기한</th>
                    <td colspan="5"><input type="date" class="form-control" name="" value="${eb.limitDate}"></td>
                </tr>
                <tr>
                    <th>대금지불방법</th>
                    <td colspan="4">
                        <select name="pay" id="">
                            <option value="법인카드">법인카드</option>
                            <option value="현금시재">현금시재</option>
                        </select>
                    </td>
                    <th>사용목적</th>
                    <td colspan="5"><input type="text" class="form-control" name="" value="${eb.purpose}"></td>
                </tr>
                </c:if>

                <!-- //////////////////////////////////////// -->
                <tr>
                    <th>제 목</th>
                    <td colspan="10"><input type="text" class="form-control" name="" value="${ap.approvalTitle}"></td>
                </tr>

            </table>
            			
			<c:if test="${empty eb}">
	            <!--비품구매 제외시 보여질 내용-->
	            <div style="width: 100%;">
	            	<c:choose>
	            		<c:when test="${!empty bd}">
			                <textarea name="" id="summernote">${bd.businessDraftContent}</textarea>
	            		</c:when>
	            		<c:when test="${!empty ce}">
	            			<textarea name="" id="summernote">${ce.certificateContent}</textarea>
	            		</c:when>
	            		<c:when test="${!empty rc}">
	            			<textarea name="" id="summernote">${rc.recruimentContent}</textarea>
	            		</c:when>
	            		<c:otherwise>
	            			<textarea name="" id="summernote">${er.expenseReportContent}</textarea>
	            		</c:otherwise>
	                </c:choose>
	            </div>
            </c:if>
            
            <script>
		    	$(function(){
		    		$("#grade option").each(function(){
		    			if($(this).val() == ${ap.grade}){
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
	  		</script>

            <!-- 비품구매 제외시 보여질 내용 -->
            <script>
                $('#summernote').summernote({
                  tabsize: 2,
                  width: 898,
                  height: 300
                });
            </script>

            <!-- 비품구매 내용 -->
            <c:if test="${!empty eb}">
	            <table class="table-bordered">
		            <tr>
		                <th width="50">품 번</th>
	                    <th width="250">품 명</th>
	                    <th width="150">규 격</th>
	                    <th width="50">수 량</th>
	                    <th width="50">단 위</th>
	                    <th width="150">금 액(원)</th>
	                    <th width="200">비 고</th>
		            </tr>
			        <c:forEach var="it" items="${eb.itemList}">
			            <tr>
			                <td>${it.itemSeq}</td>
			                <td><input type="text" name="itemList[0].itemName" value="${it.itemName}"></td>
			                <td><input type="text" name="itemList[0].itemSize" value="${it.itemSize}"></td>
			                <td><input type="text" name="itemList[0].total" value="${it.total}"></td>
			                <td><input type="text" name="itemList[0].unit" value="${it.unit}"></td>
			                <td><input type="text" name="itemList[0].amount" value="${it.amount}"></td>
			                <td><input type="text" name="itemList[0].note" value="${it.note}"></td>
			            </tr>
			        </c:forEach>
			        <tr>
			        	<th colspan="6">총 금액</th>
			        	<td>${eb.totalPay}</td>
			        </tr>
		        </table>
			</c:if>
            <br><br>

            <div id="attachment-div">
                &nbsp;&nbsp;
                <img src="resources/images/124506.png" width="20px" height="20px">
                <c:if test="${!empty ap.originName}">	
	               	현재 업로드된 파일 : 
	                <a href="${ap.filePath}" download="${ap.originName}">${ap.originName}</a>
	               	<input type="hidden" name="originName" value="${ap.originName}">
	               	<input type="hidden" name="filePath" value="${ap.filePath}">
                </c:if>
                <input type="file" name="upfile" class="form-control-file border" style="margin-top: 30px;">
           		<p id="fileNotice">* 1개의 파일만 첨부할 수 있습니다</p>
            </div>
		</form>
		

    	</div> <!-- elec-outer end -->
    	
    	<div class="container">
        <!-- The Modal -->
        <div class="modal fade" id="confirm-line">
          <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <h6 class="modal-title">삼조전자</h6>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <div id="confirm-body">
                    <!--클릭시 실행할 함수로 ajax값 넘기기-->
                    <div id="deptCode">
                        <details>
                            <summary>삼조전자</summary>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(1,9);">대표이사</button>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(1,1);">개발팀</button>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(2,1);">영업팀</button>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(3,1);">인사팀</button>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(4,1);">회계팀</button>
                            <button type="button" class="btn btn-sm" onclick="selectEmployeeList(5,1);">경영팀</button>
                        </details>
                    </div>
                    <div id="searchNsawon" style="overflow: auto;">
                        <!--ajax로 이름 검색요청-->
                        <div>
                            <input type="text" class="form-control" placeholder="이름,사번으로 검색" style="width: 350px;">
                            <button type="button" class="btn btn-sm btn-outline-dark">검색</button>
                        </div>
                        <table class="table sawon-list" style="overflow: auto;">
                            <thead>
                                <tr>
                                    <th width="48"></th>
                                    <th width="150">사번</th>
                                    <th width="100">이름</th>
                                    <th width="100">직위</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>

                    <!-- 어느라인으로 보낼건지 -->
                    <div id="line">
                        <button type="button" class="btn btn-sm" onclick="list(1);">열람</button>
                        <button type="button" class="btn btn-sm" onclick="list(2);">참조</button>
                        <button type="button" class="btn btn-sm text-danger" onclick="list(3);">*결재1</button>
                        <button type="button" class="btn btn-sm text-danger" onclick="list(4);">*결재2</button>
                        <button type="button" class="btn btn-sm" onclick="list(5);">결재3</button>
                    </div>

                    <!-- 화면에 뿌려주기 -->
                    <div id="nameCheck">
                        <p id="yoelam"></p>
                        <p id="chamjo"></p>
                        <p id="sign1" class="lineNo"></p>
                        <p id="sign2" class="lineNo"></p>
                        <p id="sign3" class="lineNo"></p>
                    </div>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-danger" onclick="confirmList();" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">닫기</button>
                </div>
              
            </div>
          </div>
        </div>
        
      </div>
		
	</div> <!-- outer end -->
	
	<script>
        	let count = 0;
        	let procedure = 1;
        
            function selectEmployeeList(dnum,jnum){
            	
            	$.ajax({
            		url:"emplist.el",
            		data:{
            			dnum:dnum,
            			jnum:jnum
            		},
            		success:function(list){
            			
            			
            			let value = "";
        				for(let i in list){
        					value += "<tr>"
                            	   + "<td width='48'><input type='checkbox'></td>"
                            	   + "<td width='150' class='noCheck'>" + list[i].userNo + "</td>"
                            	   + "<td width='100' class='nameCheck'>" + list[i].userName + "</td>"
                            	   + "<td width='100' class='jobCheck'>" + list[i].jobName + "</td>"
                    			   + "</tr>"
        				}

        				$(".sawon-list>tbody").html(value);

            		},error:function(){
            			
            			console.log("사원조회용 ajax통신 실패");
            			
            		}
            	})
            } /*ajax끝*/
            
            /*버튼 클릭시 화면에 뿌려질 용도*/
            function list(num){

                var nameCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".nameCheck").text();
                var jobCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".jobCheck").text();
            	var noCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".noCheck").text();

            	if(num == 3 || num == 4 || num == 5){
	            	/*동적으로 hidden요소 만들어내기*/
	            	var value = "";
	            	value += "<td colspan='3'>"
	            	       + "<input type='text' style='border: none;' id='confirm" + count + "' readonly required>" 
	            	       + "<input type='hidden' name='confirmList[" + count + "].confirmNo' id='clist"+ count +"'>"
	            	       + "<input type='hidden' name='confirmList[" + count + "].procedureNo' value='"+ procedure +"'>"
	            	       + "</td>"
	            	       
	            	count++;
	            	procedure++;
	            	       
	            	$("#line-list").html($("#line-list").html() + value);
            	}

                switch(num){
                    case 1:$("#yoelam").text(nameCheck + " " + jobCheck),$("#readNo").val(noCheck); break;
                    case 2:$("#chamjo").text(nameCheck + " " + jobCheck),$("#refNo").val(noCheck); break;
                    case 3:$("#sign1").text(nameCheck + " " + jobCheck),$("#clist0").val(noCheck); break;
                    case 4:$("#sign2").text(nameCheck + " " + jobCheck),$("#clist1").val(noCheck); break;
                    case 5:$("#sign3").text(nameCheck + " " + jobCheck),$("#clist2").val(noCheck); return;
                }
	
                
            }
            
            function confirmList(){           	
            	
            	// 사원+직급 뿌려주기
            	$("#read").val($("#yoelam").text());
            	$("#reference").val($("#chamjo").text());
            	$("#confirm0").val($("#sign1").text());
            	$("#confirm1").val($("#sign2").text());
            	$("#confirm2").val($("#sign3").text());
            	
            }
        </script>

</body>
</html>