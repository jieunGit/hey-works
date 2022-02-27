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
    #nameCheck>*{float:left;}
    #nameCheck>p{
        width: 200px;
        height: 40px;
        margin-top: 5px;
        border: 1px solid lightgray;
        line-height: 40px;
        padding-left: 10px;
    }
    #nameCheck>button{
    	widht:40px;
    	height:25px;
    	border-radius:100%;
    	border:1px solid gray;
    	text-align:center;
    	margin-top:10px;
    	margin-left:10px;
    	line-height:10px;
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
    #form-type>input{
    	width:100%;
    	height:100%;
    	text-align:center;
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
            <c:choose>
            	<c:when test="${ap.status ne '반려'}">
            		<a class="btn btn-sm text-primary" onclick="postSubmit(1);">수정완료</a>
            	</c:when>
            	<c:otherwise>
            		<a class="btn btn-sm text-danger" onclick="postSubmit(2);">재기안하기</a>
            	</c:otherwise>
            </c:choose>
        </div>

        <hr>
	<form action="" id="postForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<div id="form-type"><input type="text" value="${ap.formNo}" name="formNo" readonly></div>
            <br>
            <div class="custom-control custom-switch" align="right">
            	보존연한 : <input type="text" value="${ap.storageYear}" readonly>
            	<select name="storageYear">
                    <option value="12">1년</option>
                    <option value="36">3년</option>
                    <option value="60">5년</option>
                </select>
            	긴급여부 : 
                <select name="emergancy" id="emergancy">
                    <option value="N">선택안함</option>
                    <option value="Y">긴급</option>
                </select>
                <input type="hidden" value="${ap.emergancy}">
            </div>
            <br>

            <table align="center" class="table-bordered">
                <tr>
                    <th colspan="2" width="200">문서번호</th>
                    <td colspan="3" width="250"><input type="text" name="approvalNo" style="border: none;" value="${ap.approvalNo}" readonly></td>
                    <th colspan="3" width="225">기안부서</th>
                    <td colspan="3" width="225"><input type="text" name="writeDept" style="border: none;" value="${ap.writeDept}" readonly></td>
                </tr>
                <tr>
                    <th colspan="2">보안 등급</th>
                    <td colspan="3">
                        <select name="grade" id="grade">
                            <option value="C">C등급</option>
                            <option value="A">A등급</option>
                            <option value="S">S등급</option>
                        </select>
                        <input type="hidden" id="gradeSample" value="${ap.grade}">
                    </td>
                    <th colspan="3">작성자</th>
                    <td colspan="3">${ap.userNo}</td>
                </tr>
                <tr>
                    <th colspan="2">참 조</th>
                    <td colspan="3" style="border-right: none;" id="ref-line">
                        <input type="text" style="border: none;" value="${ap.reference}&nbsp;${ap.referenceJob}" readonly id="reference">
                        <input type="hidden" style="border: none;" name="read" value="${ap.refNo}">
                    </td>
                    <th colspan="3">열 람</th>
                    <td colspan="3" style="border-right: none;" id="read-line">
                        <input type="text" style="border: none;" value="${ap.read}&nbsp;${ap.readJob}" id="read">
                        <input type="hidden" style="border: none;" name="reference" value="${ap.readNo}">
                    </td>
                </tr>

                <!-- 결재라인 -->
                <tr id="line-list">
                    <th class="text-danger">*결재라인</th>
                    <th width="25" style="border-left: none;">
                        <button type="button" data-target="#confirm-line" data-toggle="modal">
                            <img src="resources/images/plus.png">
                        </button>
                    </th>
                    <c:forEach var="ce" items="${ap.confirmList}" varStatus="i">
                    	<td colspan="3" id="line${i.count}"><input value="${ce.confirmUser}&nbsp;${ce.jobCode}" name="confirmList[${i.count}].confirmUser" readonly>
                    	<input type="hidden" value="${ce.confirmNo}" name="confirmList[${i.count}].confirmNo" readonly>
                    	<input type="hidden" value="${ce.procedureNo}" name="confirmList[${i.count}].procedureNo" readonly></td>
                    </c:forEach>
                </tr>

                <!-- 증명서 일때 -->
                <c:if test="${!empty ce}">
                <tr>
                    <th colspan="2">증명서종류</th>
                    <td colspan="3"><input type="text" class="form-control" name="certificateType" value="${ce.certificateType}"></td>
                    <th colspan="3">용 도</th>
                    <td colspan="3"><input type="text" class="form-control" name="use" value="${ce.use}"></td>
                </tr>
                <tr>
                    <th colspan="2">제출처</th>
                    <td colspan="3"><input type="text" class="form-control" name="whereSubmit" value="${ce.whereSubmit}"></td>
                    <th colspan="3">제출일</th>
                    <td colspan="3"><input type="date" class="form-control" name="submitDate" value="${ce.submitDate}"></td>
                </tr>
                </c:if>

                <!-- 채용요청서 일 때 -->
                <c:if test="${!empty rc}">
                <tr>
                    <th colspan="2">부 서</th>
                    <td colspan="3"><input type="text" class="form-control" name="recruimentDept" value="${rc.recruimentDept}"></td>
                    <th>인 원</th>
                    <td colspan="2"><input type="text" class="form-control" name="employee" value="${rc.employee}"></td>
                    <th>실무경력(년)</th>
                    <td colspan="2"><input type="text" class="form-control" name="workExperience" value="${rc.workExperience}"></td>
                </tr>
                <tr>
                    <th colspan="2">채용희망일</th>
                    <td colspan="3"><input type="date" class="form-control" name="offerDate" value="${rc.offerDate}"></td>
                    <th>자격사항</th>
                    <td colspan="2"><input type="text" class="form-control" name="qualification" value="${rc.qualification}"></td>
                    <th>직위</th>
                    <td colspan="2"><input type="text" class="form-control" name="position" value="${rc.position}"></td>
                </tr>
                </c:if>
            
                <!-- 일반 품의서 일 때 -->
                <c:if test="${!empty er}">
                <tr>
                    <th>시행날짜</th>
                    <td colspan="10"><input type="date" class="form-control" name="imposition" value="${er.imposition}"></td>
                </tr>
                </c:if>

                <!-- 비품구매서 일 때 -->
                <c:if test="${!empty eb}">
                <tr>
                    <th>구매요청부서</th>
                    <td colspan="4">
                        <select name="requestTeam" id="requestTeam">
                            <option value="개발팀">개발팀</option>
                            <option value="영업팀">영업팀</option>
                            <option value="인사팀">인사팀</option>
                            <option value="회계팀">회계팀</option>
                            <option value="경영팀">경영팀</option>
                        </select>
                        <input type="hidden" id="requestTeamSample" value="${eb.requestTeam}">
                    </td>
                    <th>납품요청기한</th>
                    <td colspan="5"><input type="date" class="form-control" name="limitDate" value="${eb.limitDate}"></td>
                </tr>
                <tr>
                    <th>대금지불방법</th>
                    <td colspan="4">
                        <select name="pay" id="pay">
                            <option value="법인카드">법인카드</option>
                            <option value="현금시재">현금시재</option>
                        </select>
                        <input type="hidden" id="paySample" value="${eb.pay}">
                    </td>
                    <th>사용목적</th>
                    <td colspan="5"><input type="text" name="purpose" value="${eb.purpose}"></td>
                </tr>
                </c:if>

                <!-- //////////////////////////////////////// -->
                <tr>
                    <th>제 목</th>
                    <td colspan="10"><input type="text" name="approvalTitle" value="${ap.approvalTitle}"></td>
                </tr>

            </table>
            			
			<c:if test="${empty eb}">
	            <!--비품구매 제외시 보여질 내용-->
	            <div style="width: 100%;">
	            	<c:choose>
	            		<c:when test="${!empty bd}">
			                <textarea name="businessDraftContent" id="summernote">${bd.businessDraftContent}</textarea>
	            		</c:when>
	            		<c:when test="${!empty ce}">
	            			<textarea name="certificateContent" id="summernote">${ce.certificateContent}</textarea>
	            		</c:when>
	            		<c:when test="${!empty rc}">
	            			<textarea name="recruimentContent" id="summernote">${rc.recruimentContent}</textarea>
	            		</c:when>
	            		<c:otherwise>
	            			<textarea name="expenseReportContent" id="summernote">${er.expenseReportContent}</textarea>
	            		</c:otherwise>
	                </c:choose>
	            </div>
            </c:if>
            
            <script>
	            $(function(){  // 긴급
		    		
		    		var emergancy = $("#emergancy").val();
		    		
		    		$("#emergancy>option").each(function(){
		    			if($(this).val() == emergancy){
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
		    	
		    	$(function(){  // 등급
		    		
		    		var grade = $("#gradeSample").val();
		    		
		    		$("#grade>option").each(function(){
		    			if($(this).val() == grade){
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
		    	
		    	$(function(){  // 비품요청팀
		    		
		    		var request = $("#requestTeam").val();
		    		
		    		$("#requestTeam>option").each(function(){
		    			if($(this).val() == request){
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
		    	
		    	$(function(){  // 비품구매지급방법
		    		
		    		var pay = $("#paySample").val();
		    		
		    		$("#pay>option").each(function(){
		    			if($(this).val() == pay){
		    				$(this).attr("selected", true);
		    			}
		    		})
		    	})
		    	
		    	function postSubmit(num){
	            	switch(num){
					case 1:	$("#postForm").attr("action", "update.el").submit(); break;
					case 2:	$("#postForm").attr("action", "insert.el").submit(); break;
	            	}
	            }
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
	            <table class="table-bordered" id="equipmentList">
	            	<thead>
			            <tr>
			                <th width="80">품 번<button type="button" class="btn btn-sm" onclick="addItem();">+</button></th>
		                    <th width="220">품 명</th>
		                    <th width="150">규 격</th>
		                    <th width="50">수 량</th>
		                    <th width="50">단 위</th>
		                    <th width="150">금 액(원)</th>
		                    <th width="200">비 고</th>
			            </tr>
		            </thead>
		            <tbody id="item-list">
				        <c:forEach var="it" items="${eb.itemList}" varStatus="i">
				            <tr>
				                <td><input type="text" name="itemList[${i.count}].itemSeq" value="${it.itemSeq}" readonly class="itemSeq"></td>
				                <td><input type="text" name="itemList[${i.count}].itemName" value="${it.itemName}"></td>
				                <td><input type="text" name="itemList[${i.count}].itemSize" value="${it.itemSize}"></td>
				                <td><input type="text" name="itemList[${i.count}].total" value="${it.total}"></td>
				                <td><input type="text" name="itemList[${i.count}].unit" value="${it.unit}"></td>
				                <td><input type="text" name="itemList[${i.count}].amount" value="${it.amount}"></td>
				                <td><input type="text" name="itemList[${i.count}].note" value="${it.note}"></td>
				            </tr>
				        </c:forEach>
			        </tbody>
		        </table>
		        
				<div style="width:100%;" align="right">총 금액 : <input type="text" name="totalPay">
	            	<button type="button" class="btn btn-sm" onclick="allTotalPay();"><span class="spinner-grow text-info spinner-grow-sm"></span>조회</button>
	            </div>
	            <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeList();">한 행 삭제하기</button>
		        <br><br>
		        <p class="text-danger" style="font-size:12px;">* 수정하신 후 추가버튼을 누르면 기존의 아이템으로 초기화 됩니다. 꼭 원하시는만큼 추가버튼을 누르고 수정해주세요.</p>
			</c:if>
            <br><br>

            <div id="attachment-div">
                &nbsp;&nbsp;
                <img src="resources/images/clip.png" width="20px" height="20px">
                <c:choose>
                	<c:when test="${!empty ap.originName}">
		               	현재 업로드된 파일 : 
		                <a href="${ap.filePath}" download="${ap.originName}">${ap.originName}</a>
		               	<input type="hidden" name="originName" value="${ap.originName}">
		               	<input type="hidden" name="filePath" value="${ap.filePath}">
                	</c:when>
                	<c:otherwise>
                		첨부파일 (0)개
                	</c:otherwise>
                </c:choose>
            </div>
        	<input type="file" name="upfile" class="form-control-file border" style="margin-top: 30px;">
   			<p id="fileNotice" class="text-danger">* 1개의 파일만 첨부할 수 있습니다</p>
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
                            <input type="text" class="form-control" placeholder="이름으로 검색" style="width:100%;" onkeyup="searchConfirm(this.value);" name="keyword">
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
                        <button type="button" class="btn btn-sm" onclick="list(1);" id="readbtn">열람</button>
                        <button type="button" class="btn btn-sm" onclick="list(2);">참조</button>
                        <button type="button" class="btn btn-sm text-danger" onclick="list(3);">*결재1</button>
                        <button type="button" class="btn btn-sm" onclick="list(4);" id="sign2btn">결재2</button>
                        <button type="button" class="btn btn-sm" onclick="list(5);" id="sign3btn">결재3</button>
                    </div>

                    <!-- 화면에 뿌려주기 -->
                    <div id="nameCheck">
                        <p id="yoelam"></p><button type="button" class="btn btn-sm" onclick="minuspeople(1);">x</button>
                        <p id="chamjo"></p><button type="button" class="btn btn-sm" onclick="minuspeople(2);">x</button>
                        <p id="sign1" class="lineNo"></p><button type="button" class="btn btn-sm" onclick="minuspeople(3);">x</button>
                        <p id="sign2" class="lineNo"></p><button type="button" class="btn btn-sm" onclick="minuspeople(4);">x</button>
                        <p id="sign3" class="lineNo"></p><button type="button" class="btn btn-sm" onclick="minuspeople(5);">x</button>
                    </div>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                	<button type="button" class="btn btn-sm btn-warning" onclick="minusList();">전체삭제</button>
                    <button type="button" class="btn btn-sm btn-danger" onclick="confirmList();" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">닫기</button>
                </div>
              
            </div>
          </div>
        </div>
        
      </div>
		
	</div> <!-- outer end -->
	
	<script>
			// 비품용
			var count = 3;
	
			$(function(){
				$("#yoelam").text($("input[id='read']").val());
				$("#chamjo").text($("input[id='reference']").val());
				$("#sign1").text($("input[name='confirmList[1].confirmUser']").val());
				$("#sign2").text($("input[name='confirmList[2].confirmUser']").val());
				$("#sign3").text($("input[name='confirmList[3].confirmUser']").val());
			})
			
			$(function(){ // 
				
				let approvalNo = $("input[name='approvalNo']").val();
				var ano = approvalNo.substring(3,5);
				console.log(ano);
				
				if(ano == "EB"){
            		$("#readbtn").attr("disabled", true);
            		$("#sign2btn").attr("disabled", true);
            		$("#sign3btn").attr("disabled", true);
            	}

			})

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
                            	   + "<td width='48'><input type='checkbox' name='job' value='"+list[i].jobCode+"'></td>"
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
            } 
			
			function searchConfirm(keyword){
            	
				$("input[name='keyword']").keyup(function(e){
                    if(e.keyCode == 13){
		            	$.ajax({
			            	url:"searchConfirm.el",
			            	data:{keyword:keyword},
			            	success:function(result){
			            		
			            		let listresult = "";
			            		for(let i in result){
			            			listresult += "<tr>"
				                         	   + "<td width='48'><input type='checkbox'></td>"
				                        	   + "<td width='150' class='noCheck'>" + result[i].userNo + "</td>"
				                        	   + "<td width='100' class='nameCheck'>" + result[i].userName + "</td>"
				                        	   + "<td width='100' class='jobCheck'>" + result[i].jobName + "</td>"
				                			   + "</tr>"
			            		}
			            		$(".sawon-list>tbody").html(listresult);
			            	},error:function(){
		            			console.log("사원조회용 ajax통신 실패");
		            		}
		            	})
		            }
				})
        	}
			/*ajax끝*/
            
            // 결재버튼 플러스 마이너스까지 일단 완성 체크박스랑 사원비교 아직,,,
            /*버튼 클릭시 결재 화면에 뿌려질 용도*/
            function list(num){

                var nameCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".nameCheck").text();
                var jobCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".jobCheck").text();
            	var noCheck = $(".sawon-list>tbody>tr>td>input:checked").parent().siblings(".noCheck").text();
            	
            	if(num == 1){ // 열람 참조시
            		
            		var read = "";
            		read += "<input type='text' style='border:none;' readonly id='read'>"
            			  + "<input type='hidden' name='read' id='readNo'>"
            		
            		$("#read-line").html(read);
            				
            	}else if(num == 2){
					
            		var ref = "";
            		ref += "<input type='text' style='border:none;' readonly id='reference'>"
            			 + "<input type='hidden' name='reference' id='refNo'>"
            		
            		$("#ref-line").html(ref);	
            			 
            	}else if(num == 3){
            		
            		var value = "";
	            	value += "<td colspan='3'>"
	            	       + "<input type='text' style='border: none;' id='confirm1' readonly>" 
	            	       + "<input type='hidden' name='confirmList[1].confirmNo' id='clist1'>"
	            	       + "<input type='hidden' name='confirmList[1].procedureNo' value='1'>"
	            	       + "</td>"
	            	       	       
            	}else if(num == 4){
            		
            		var value = "";
	            	value += "<td colspan='3'>"
	            	       + "<input type='text' style='border: none;' id='confirm2' readonly>" 
	            	       + "<input type='hidden' name='confirmList[2].confirmNo' id='clist2'>"
	            	       + "<input type='hidden' name='confirmList[2].procedureNo' value='2'>"
	            	       + "</td>"
            		
            	}else if(num == 5){
            		
            		var value = "";
	            	value += "<td colspan='3'>"
	            	       + "<input type='text' style='border: none;' id='confirm3' readonly>" 
	            	       + "<input type='hidden' name='confirmList[3].confirmNo' id='clist3'>"
	            	       + "<input type='hidden' name='confirmList[3].procedureNo' value='3'>"
	            	       + "</td>"
            		
            	}
            	
	            	$("#line-list").html($("#line-list").html() + value);

                switch(num){
                    case 1:$("#yoelam").text(nameCheck + " " + jobCheck),$("#readNo").val(noCheck); break;
                    case 2:$("#chamjo").text(nameCheck + " " + jobCheck),$("#refNo").val(noCheck); break;
                    case 3:$("#sign1").text(nameCheck + " " + jobCheck),$("#clist1").val(noCheck); break;
                    case 4:$("#sign2").text(nameCheck + " " + jobCheck),$("#clist2").val(noCheck); break;
                    case 5:$("#sign3").text(nameCheck + " " + jobCheck),$("#clist3").val(noCheck); return;
                }
                
             	// 결재자 값 비교해서 선택 불가하게 하기
               	let sign1 = $("#sign1").text();
               	let fsign = sign1.slice(-2);
               	
               	if(fsign == '이사'){
               		$('input:checkbox[name="job"]').each(function(){
                   		if($(this).val() == 4 || $(this).val() == 3 || $(this).val() == 2 || $(this).val() == 1){
                   			this.disabled = true;
                   		}
                   	})
               	}else if(fsign == '과장'){
               		$('input:checkbox[name="job"]').each(function(){
                   		if($(this).val() == 3 || $(this).val() == 2 || $(this).val() == 1){
                   			this.disabled = true;
                   		}
                   	})
               	}else if(fsign == '대리'){
               		$('input:checkbox[name="job"]').each(function(){
                   		if($(this).val() == 2 || $(this).val() == 1){
                   			this.disabled = true;
                   		}
                   	})
               	}else if(fsign == '주임'){
               		$('input:checkbox[name="job"]').each(function(){
                   		if($(this).val() == 1){
                   			this.disabled = true;
                   		}
                   	})
               	} // 결재비교 끝
	
                
            }
            
            function minuspeople(num){ // 하나씩 삭제
            	
            	if(num == 1){
                	$("#yoelam").text("");
                	$("#read-line>input").remove();
            	}else if(num == 2){
            		$("#chamjo").text("");
            		$("#ref-line>input").remove(); 
            	}else if(num == 3){
            		$("#sign1").text("");
            		$("#line-list>td:first").remove();
            	}else if(num == 4){
            		$("#sign2").text("");
            		$("#line-list>td:first").next().remove();
            	}else{
            		$("#sign3").text("");
            		$("#line-list>td:last").remove();
            	}
            }
            
            function minusList(){
            	// 기존 결재라인 전체삭제
            	$("#line-list>td").remove();
            	$("#nameCheck>p").text("");
            	$("#ref-line>input").remove();
            	$("#read-line>input").remove();
            	
            	confcount = 0;
            	confprocedure = 1;
            }
            
            function confirmList(){           	
            	
            	// 사원+직급 뿌려주기
            	$("#read").val($("#yoelam").text());
            	$("#reference").val($("#chamjo").text());
            	$("#confirm1").val($("#sign1").text());
            	$("#confirm2").val($("#sign2").text());
            	$("#confirm3").val($("#sign3").text());
            	
            	
            }
            

            //------------------------------------------결재자 끝

			
            //-----------------------------------------비품
            
			function addItem(){
            	
				// 비품 추가
					
	
        
		   console.log(count);
				
            	var value = "";
            	value += "<tr>"
            	       + "<td><input type='text' name='itemList[" + count + "].itemSeq' class='form-control' value='" + count + "' readonly></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].itemName' class='form-control'></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].itemSize' class='form-control'></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].total' class='form-control num" + count + "'></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].unit' class='form-control' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].amount' class='form-control pay" + count + "'></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].note' class='form-control'></td>" 
            		   + "</tr>"
            	
            	$("#item-list").html($("#item-list").html() + value);
            		   
           		count++;
           		procedure++;
           		
            }
			
			function removeList(){ // 한 행 삭제
            	
            	var tablelt = $("#equipmentList tr").length;
            	            	
            	if(tablelt > 1){
            		
            		$("#equipmentList>tbody>tr:last").remove();
            		
            	}else{
            		
            		alert("한 행은 반드시 존재해야합니다!");
            		return false;
            	}
            	
            	count--;
            	procedure--;
            	
            }
			
			function allTotalPay(){
            	
           		var totalPay = 0;
            	var tablelt = $("#equipmentList tr").length;
       			
				for(let i=1; i<tablelt; i++){
           			totalPay += $("input[name='itemList[" + i + "].amount'").val() * $("input[name='itemList[" + i + "].total'").val()
				}
           		$("input[name='totalPay']").val(totalPay);
            	
            }
        </script>

</body>
</html>