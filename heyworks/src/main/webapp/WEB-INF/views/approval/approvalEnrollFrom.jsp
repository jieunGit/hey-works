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
    #btns{width: 400px;}
    #often-form{
        width: 500px;
        text-align: right;
    }
    #often-form>a{background-color: rgba(52, 152, 219, 0.15);}
    .custom-switch{width: 100%;}
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
    /*결재버튼클릭시*/
    summary{
        font-weight: 700;
        padding-left: 10px;
    }
    details img{
        width: 15px; 
        height: 15px;
        margin-left: 20px;
        margin-top: 5px;
    }
    .sawon{height: auto;}
    .sawon *{float: left;}
    .sawon>div{
        width: 100%;
    }
    .sawon button{
        padding: 0px;
        width: 50px;
        background-color: lightcyan;
    }
    .sawon>table td{height: 100%;}
    
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

            <div id="btns">
                <button type="submit" class="btn btn-sm btn-primary">결재요청</button>
                <a href="tempInsert.el" class="btn btn-sm">임시저장</a>
                <a href="" class="btn btn-sm">미리보기</a>
                <button type="button" class="btn btn-sm" onclick="history.back();">취소</button>
            </div>
            <div id="often-form">
                <a href="bdEnrollForm.el" class="btn btn-sm">자주쓰는양식</a>
            </div>

            <br>
            <hr>

            <div class="custom-control custom-switch" align="right">
                <input type="checkbox" class="custom-control-input" id="switch1" name="emergancy" value="Y">
                <label class="custom-control-label" for="switch1">긴급</label>
            </div>

            <table border="1" class="table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" width="225">문서 종류</th>
                        <td colspan="3" width="225">
                            <select name="formNo" id="category">
                                <option value="3">증명서신청</option>
                                <option value="4">채용요청서</option>
                                <option value="5">일반품의서</option>
                            </select>
                            <input type="hidden" name="confirmList[0].formNo">
                        </td>
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
                                <option value="C">C등급</option>
                                <option value="A">A등급</option>
                                <option value="S">S등급</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">참 조</th>
                        <td colspan="3" style="border-right: none;">
                            <input type="text" style="border: none;" id="reference" readonly>
                            <input type="hidden" name="reference" id="refNo">
                        </td>
                        <th colspan="3">열 람</th>
                        <td colspan="3" style="border-right: none;">
                            <input type="text" style="border: none;" id="read" readonly>
                            <input type="hidden" name="read" id="readNo">
                        </td>
                    </tr>
                    <tr id="line-list">
                        <th>결재라인</th>
                        <td width="25" style="border-left: none;">
                            <button type="button" data-target="#confirm-line" data-toggle="modal" >
                                <img src="resources/images/875068.png">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">제 목</th>
                        <td colspan="9"><input type="text" class="form-control" name="approvalTitle"></td>
                    </tr>
                </thead>
                <tbody id="certificate">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">증명서신청</td>
                    </tr>
                    <tr>
                        <th colspan="2">증명서종류</th>
                        <td colspan="3"><input type="text" class="form-control" name="certificateType"></td>
                        <th colspan="2">용 도</th>
                        <td colspan="4"><input type="text" class="form-control" name="use"></td>
                    </tr>
                    <tr>
                        <th colspan="2">제출처</th>
                        <td colspan="3"><input type="text" class="form-control" name="whereSubmit"></td>
                        <th colspan="2">제출일</th>
                        <td colspan="4"><input type="date" name="submitDate"></td>
                    </tr>
                </tbody>
                <tbody style="display: none;" id="recruitment">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">채용요청서</td>
                    </tr>
                    <tr>
                        <th colspan="2">부 서</th>
                        <td colspan="3">
                            <select name="recruimentDept" id="recruimentDept">
                            	<c:forEach var="d" items="${deptList}">
                                	<option value="${d.deptName}">${d.deptName}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <th colspan="2">인 원</th>
                        <td colspan="4"><input type="number" class="form-control" name="employee"></td>
                    </tr>
                    <tr>
                        <th colspan="2">실무경력(년)</th>
                        <td colspan="3"><input type="text" class="form-control" name="workExperience"></td>
                        <th colspan="2">채용희망일</th>
                        <td colspan="4"><input type="date" name="offerDate"></td>
                    </tr>
                    <tr>
                        <th colspan="2">자격사항</th>
                        <td colspan="3"><input type="text" class="form-control" name="qualification"></td>
                        <th colspan="2">직위</th>
                        <td colspan="4">
                            <select name="position" id="position">
                                <option value="사원">사원</option>
                                <option value="주임">주임</option>
                                <option value="대리">대리</option>
                                <option value="과장">과장</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
                <tbody style="display: none;" id="expenseReport">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">일반품의서</td>
                    </tr>
                    <tr>
                        <th colspan="7">시행날짜</th>
                        <td colspan="4"><input type="date" class="form-control" name="imposition"></td>
                    </tr>
                </tbody>
            </table>

            <div style="width: 100%;">
                <textarea name="" id="summernote"></textarea>
            </div>
			<br><br>
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
    

	    <script>
	        $('#summernote').summernote({
	          tabsize: 2,
	          width: 898,
	          height: 300
	        });
	
	        /*카테고리별로 다르게보이기*/
	        $("#category").change(function(){
	            if($(this).find("option:selected").val() == 3){
	                
	                $("#recruitment").hide();
	                $("#expenseReport").hide();
	                $("#certificate").show();
	                
	                document.getElementById("summernote").setAttribute('name', "certificateContent");
	
	            }else if($(this).find("option:selected").val() == 4){
	
	                $("#certificate").hide();
	                $("#expenseReport").hide();
	                $("#recruitment").show();
	                
	                document.getElementById("summernote").setAttribute('name', "recruimentContent");
	
	            }else{
	
	                $("#certificate").hide();
	                $("#recruitment").hide();
	                $("#expenseReport").show();
	                
	                document.getElementById("summernote").setAttribute('name', "expenseReportContent");
	
	            }
	            
	        })
	    </script>


</body>
</html>