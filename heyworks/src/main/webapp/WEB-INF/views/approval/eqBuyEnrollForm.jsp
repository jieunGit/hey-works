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
    .elec-outer{
        margin: auto;
        margin-left:20px;
        width: 900px;
        height: 900px;
    }
    .elec-outer div{
        float: left;
    }
    #btns{
        width: 695px;
        text-align: right;
    }
    .custom-switch{width: 100%;}
    .custom-switch>*{float: left;}
    .custom-switch>p{
        text-align: left;
        color: rgb(243, 136, 136);
        width: 95%;
    }
    .custom-switch>input, .custom-switch>label{
        width: 5%;
    }
    .table-bordered *{
        height: 40px;
        text-align: center;
    }
    .table-bordered input, .table-bordered select{width: 100%;}
    .table-bordered button>img{
        width: 15px; 
        height: 15px;
    }
    .table-bordered button{
        border: none; 
        background-color: white;
    }
    #form-type{
        font-size: 35px;
        font-weight: 800;
    }
    .custom-control-label::after{
        background: rgb(231, 122, 122);
    }
    #businessDraft{background-color: rgb(245, 244, 244);}
    #eqBuy{background-color: rgba(52, 152, 219, 0.15);}
    
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
    #fileNotice{
    	font-size:12px;
    	color:red;
    }
    .itemSeq{width:50px; padding:0px;}
    .itemSeq>button{width:30px;}
</style>
</head>
<body>

	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
        <br>

        <form action="insert.el" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userNo" value="${loginUser.userNo}">
       	<input type="hidden" name="writeDept" value="${loginUser.deptName}">
        <input type="hidden" name="formNo" value="2">

            <div class="btn-group">
                <a href="bdEnrollForm.el" class="btn btn-sm" id="businessDraft">업무기안서</a>
	            <a href="ebEnrollForm.el" class="btn btn-sm" id="eqBuy">비품구매품의서</a>
            </div>

            <div id="btns" align="right">
                <button type="submit" class="btn btn-sm btn-primary">결재요청</button>
                <button type="submit" class="btn btn-sm">임시저장</button>
                <button type="button" class="btn btn-sm">미리보기</button>
                <button type="button" class="btn btn-sm" onclick="history.back();">취소</button>
            </div>

            <br>
            <hr>

            <div class="custom-control custom-switch" align="right">
                <p>** 해당 문서는 2개 이상의 비품을 신청할때만 사용 가능합니다</p>
                <input type="checkbox" class="custom-control-input" id="switch1" name="emergancy" value="Y">
                <label class="custom-control-label" for="switch1">긴급</label>
            </div>

            <table class="table-bordered">
                <tr>
                    <th colspan="2" width="225">문서 종류</th>
                    <td colspan="3" width="225">비품구매품의서</td>
                    <th colspan="3" width="225">작성자</th>
                    <td colspan="3" width="225">${loginUser.deptName}&nbsp;${loginUser.userName}</td>
                </tr>
                <tr>
                    <th colspan="2">보존 연한</th>
                    <td colspan="3">
                        <select name="storageYear">
                            <option value="12">1년</option>
                            <option value="36">3년</option>
                            <option value="60">5년</option>
                        </select>
                    </td>
                    <th colspan="3">보안 등급</th>
                    <td colspan="3">
                        <select name="grade">
                            <option value="S">S등급</option>
                            <option value="A">A등급</option>
                            <option value="C" selected>C등급</option>
                        </select>
                    </td>
                </tr>
                <tr  id="line-list">
                    <th colspan="2">참 조</th>
                    <td colspan="3" style="border-right: none;">
                        <input type="text" style="border: none;" id="reference" readonly>
                        <input type="hidden" name="reference" id="refNo">
                    </td>
                    <th colspan="2">결 재</th>
                    <td width="25" style="border-left: none;">
                      <button type="button" data-target="#confirm-line" data-toggle="modal" >
                          <img src="resources/images/875068.png">
                      </button>
                    </td>
                    <td colspan="2" style="border-right: none;">
                        <input type="text" style="border: none;" id="confirm0" readonly required>
                        <input type='hidden' name='confirmList[0].confirmNo' id='clist0'>
	            	    <input type='hidden' name='confirmList[0].procedureNo' value='1'>
                    </td>
                </tr>
                <tr style="height: 80px;">
                    <td colspan="11" id="form-type">비품구매품의서</td>
                </tr>
                <tr>
                    <th>제 목</th>
                    <td colspan="10"><input type="text" class="form-control" name="approvalTitle" required></td>
                </tr>
                <tr>
                    <th colspan="2">구매요청부서</th>
                    <td colspan="3">
                        <select name="requestTeam" id="recruimentDept">
                           	<c:forEach var="d" items="${deptList}">
                               	<option value="${d.deptName}">${d.deptName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <th colspan="2">납품요청기한</th>
                    <td colspan="4"><input type="date" name="limitDate"></td>
                </tr>
                <tr>
                    <th colspan="2">대금지불방법</th>
                    <td colspan="3">
                        <select name="pay">
                            <option value="법인카드">법인카드</option>
                            <option value="현금시재">현금시재</option>
                        </select>
                    </td>
                    <th colspan="2">사용목적</th>
                    <td colspan="4"><input type="text" name="purpose" class="form-control"></td>
                </tr>
            </table>

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
                
                </tbody>
            </table>
            <br>
            <div style="width:100%;" align="right">총 금액 : <input type="text" name="totalPay"><button type="button" class="btn btn-sm" onclick="totalPay();">조회</button></div>
            <br>
            <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeList();">한 행 삭제</button>
            

            <input type="file" name="upfile" class="form-control-file border" style="margin-top: 30px;">
            <p id="fileNotice">* 1개의 파일만 첨부할 수 있습니다</p>

        </form>
    </div>
    
    <!--결재버튼(수정하기)-->
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
                    <button type="button" class="btn btn-sm btn-danger" onclick="confirmList();" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">닫기</button>
                </div>
              
            </div>
          </div>
        </div>
        
      </div>
	</div>
	
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
            	
            	$("#confirm-line input[type:checkbox]").attr("checked", false); // 체크박스 해제하기 아직 미구현
            	
            }
            
            $("#confirm-line input[type='checkbox']").checked(function(){
            	
            	
            	
            })
            
            //------------------------------------------결재자 끝
            
            //----------------------비품시작
            function addItem(){
            	
            	var value = "";
            	value += "<tr>"
            	       + "<td><input type='text' name='itemList[" + count + "].itemSeq' class='form-control' value='" + procedure + "' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].itemName' class='form-control' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].itemSize' class='form-control' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].total' class='form-control num' id='num[" + count + "]' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].unit' class='form-control' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].amount' class='form-control pay' id='pay[" + count + "]' required></td>" 
            	       + "<td><input type='text' name='itemList[" + count + "].note' class='form-control'></td>" 
            		   + "</tr>"
            	
            	$("#item-list").html($("#item-list").html() + value);
            		   
           		count++;
           		procedure++;
           		
            }
            
            function removeList(){
            	
            	var tablelt = $("#equipmentList tr").length;
            	            	
            	if(tablelt > 2){
            		
            		$("#equipmentList>tbody:last>tr:last").remove();
            		
            	}else{
            		
            		alert("한 행은 반드시 존재해야합니다!");
            		return false;
            	}
            	
            	count--;
            	procedure--;
            	
            }
            
            function totalPay(){ // 수정하기
            	
           		var totalPay = "";
            	var tablelt = $("#equipmentList tr").length;
            	console.log(tablelt);
       			
				for(i=0; i<tablelt-1; i++){
           			totalPay = parseInt(totalPay) + parseInt($(".pay").val() * $(".num").val());
				}
           			console.log(totalPay);
           		
            	
            }
        </script>


</body>
</html>