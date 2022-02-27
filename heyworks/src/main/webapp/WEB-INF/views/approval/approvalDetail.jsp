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
    #reply-insert>div{float: left;}
    #replyName{
        width: 120px; 
        line-height: 40px;
        font-weight: 600;
    }
    #replyContent{width: 700px;}
    #form-left>*{
    	float:left;
    }
    #form-left{margin-bottom:40px;}
    #reason{width:850px;}
    #reply-list input{
    	width:100%;
    	border:1px solid tomato;
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
	            <button type="button" class="btn btn-sm" onclick="history.back();">목록으로</button>
	
	            <!-- 작성자 -->
	            <c:if test="${loginUser.userName eq ap.userNo}">
		            <c:if test="${ap.status eq '결재대기'}">
			            <a class="btn btn-sm text-primary" onclick="postSubmit(1)">내용수정</a>
			            <a class="btn btn-sm text-danger" onclick="postSubmit(2)">기안취소</a>
		            </c:if>
				</c:if>
	            <!-- 결재자 -->
	            <c:if test="${loginUser.userName eq ap.confirmList[0].confirmUser and ap.confirmList[0].confirmStatus eq '결재예정'
	            or loginUser.userName eq ap.confirmList[1].confirmUser and ap.confirmList[1].confirmStatus eq '결재예정'
	            or loginUser.userName eq ap.confirmList[2].confirmUser and ap.confirmList[2].confirmStatus eq '결재예정'}">
		            <a class="btn btn-sm text-primary" onclick="postSubmit(3)">결재</a>
		            <a class="btn btn-sm text-danger" onclick="deny();" id="rjbtn1">반려</a>
				</c:if>
				
	            <!-- 반려시 -->
	            <c:if test="${ap.status eq '반려'}">
	            	<a class="btn btn-sm text-danger" onclick="postSubmit(1)">재기안</a>
				</c:if>
				
	            <!-- 관리자가 복구시 -->
	            <c:if test="${loginUser.adminYn eq 'Y' and ap.status eq '기안회수(삭제)'}">
	            	<a class="btn btn-sm text-warning" onclick="restoration();">복구하기</a>
	            </c:if>
	            
				<!-- 열람/참조 -->
	            <c:if test="${loginUser.userName eq ap.read and ap.readStatus eq 'N' or loginUser.userName eq ap.reference and ap.referenceStatus eq 'N'}">
	            	<a class="btn btn-sm text-success" onclick="check();">열람/참조</a>
	            </c:if>
	        </div>
		
		<div id="form-left">

	        <form id="postForm" action="" method="post">
	        	<input type="hidden" name="ano" value="${ap.approvalNo}">
	        	<input type="hidden" name="filePath" value="${ap.filePath}">
	        	<input type="hidden" name="userNo" value="${loginUser.userNo}">
	        	<input type="text" class="form-control" name="rejectReason" placeholder="*반려사유입력" id="reason" required>
	        	<input type="hidden" name="confirmStatus" value="Y">
	        </form>
	        <button class="btn btn-sm text-danger" id="rjbtn2" onclick="postSubmit(4);">반려</button>
        </div>
        
        <script>
        	function postSubmit(num){

				switch(num){
				case 1:	$("#postForm").attr("action", "updateForm.el").submit(); break;
				case 2:	$("#postForm").attr("action", "delete.el").submit(); break;
				case 3:	$("#postForm").attr("action", "confirm.el").submit(); break;
				case 4:	$("#postForm").attr("action", "reject.el").submit(); break;
				}
				
        	}
        	$(function(){
        		$("#reason").hide();
        		$("#rjbtn2").hide();
        	})
        	
        	function deny(){
        		$("#reason").show();
        		$("#rjbtn1").hide();
        		$("#rjbtn2").show();
        	}
        	
        	function restoration(){
    			
    			var arraynum = $("input[name='ano']").val();
    			
    			console.log(arraynum);
    			
    			if(confirm("문서를 복구하시겠습니까?") == true){

    				$.ajax({
    					url:"restore.el",
    					type:"post",
    					data:{approvalNo:arraynum},
    					success:function(result){
    						
    						if(result == 'S'){
    							return new swal({
    								title:"문서가 정상적으로 복구되었습니다!",
    								icon:"success",
    								closeOnClickOutside:false
    							})
    							.then((value) => {
    								if(value){
    									location.href="deletelist.el"
    								}
    							})
    						}else{
    							return new swal({
    								title:"문서 삭제 실패",
    								icon:"error",
    								closeOnClickOutside:false
    							})
    							.then((value) => {
    								if(value){
    									location.reload();
    								}
    							})
    							
    						}
    					},error:function(request, error){
    						alert(error);
    						console.log(error);
    						console.log("삭제문서 복구용 ajax통신 실패");
    					}
    				})
    			
    			}else{
    				return;
    			}
    			
    		}
        </script>
            

        <hr>
	
        <div id="form-type">${ap.formNo}</div>
        <br>

        <div align="right">기안일 : ${ap.createDate}&nbsp;&nbsp;&nbsp;보존연한 : ${ap.storageYear}</div>

        <table align="center" class="table-bordered">
            <tr>
                <th width="150">문서번호</th>
                <td width="300" colspan="2">${ap.approvalNo}</td>
                <th width="150">기안부서</th>
                <td width="300" colspan="3">${ap.writeDept}</td>
            </tr>
            <tr>
                <th>보안등급</th>
                <td colspan="2">${ap.grade}</td>
                <th>작성자</th>
                <td colspan="3">${ap.userNo}</td>
            </tr>
            <!-- 결재라인 -->
            <tr>
                <th rowspan="3" width="150">신청상태</th>
                <td rowspan="3" width="150">${ap.status}</td>
                <th rowspan="3" width="150">결재상태</th>
                <th width="150">${ap.confirmList[0].jobCode}</th>
                <th width="150">${ap.confirmList[1].jobCode}</th>
                <th colspan="2" width="150">${ap.confirmList[2].jobCode}</th>
            </tr>
            <tr style="height: 110px;">
                <td>
              		<c:if test="${ap.confirmList[0].confirmStatus eq '승인'}">
                  		<img src="resources/images/ok.png"><br><br>
                  		${ap.confirmList[0].confirmDate}
              		</c:if>
              		<c:if test="${ap.confirmList[0].confirmStatus eq '반려'}">
                  		<img src="resources/images/rejected.png"><br><br>
                  		${ap.confirmList[0].confirmDate}
              		</c:if>
                </td>
                <td>
                    <c:if test="${ap.confirmList[1].confirmStatus eq '승인'}">
                  		<img src="resources/images/ok.png"><br><br>
                  		${ap.confirmList[1].confirmDate}
              		</c:if>
              		<c:if test="${ap.confirmList[1].confirmStatus eq '반려'}">
                  		<img src="resources/images/rejected.png"><br><br>
                  		${ap.confirmList[1].confirmDate}
              		</c:if>
                </td>
                <td colspan="2">
                    <c:if test="${ap.confirmList[2].confirmStatus eq '승인'}">
                  		<img src="resources/images/ok.png"><br><br>
                  		${ap.confirmList[2].confirmDate}
              		</c:if>
              		<c:if test="${ap.confirmList[2].confirmStatus eq '반려'}">
                  		<img src="resources/images/rejected.png"><br><br>
                  		${ap.confirmList[2].confirmDate}
              		</c:if>
                </td>
            </tr>
            <tr>
                <th width="150">${ap.confirmList[0].confirmUser}</th>
                <th width="150">${ap.confirmList[1].confirmUser}</th>
                <th width="150" colspan="2">${ap.confirmList[2].confirmUser}</th>
            </tr>
            <tr>
                <th>참 조</th>
                <td colspan="2">${ap.reference}&nbsp;${ap.referenceJob}</td>
                <th>열 람</th>
                <td colspan="3">${ap.read}&nbsp;${ap.readJob}</td>
            </tr>

            <!-- 증명서 일때 -->
            <c:if test="${!empty ce}">
            <tr>
                <th>증명서종류</th>
                <td colspan="2">${ce.certificateType}</td>
                <th>용 도</th>
                <td colspan="3">${ce.use}</td>
            </tr>
            <tr>
                <th>제출처</th>
                <td colspan="2">${ce.whereSubmit}</td>
                <th>제출일</th>
                <td colspan="3">${ce.submitDate}</td>
            </tr>
            </c:if>

            <!-- 채용요청서 일 때 -->
            <c:if test="${!empty rc}">
	            <tr>
	                <th>부 서</th>
	                <td>${rc.recruimentDept}</td>
	                <th>인 원</th>
	                <td>${rc.employee}</td>
	                <th>실무경력(년)</th>
	                <td>${rc.workExperience}</td>
	            </tr>
	            <tr>
	                <th>채용희망일</th>
	                <td>${rc.offerDate}</td>
	                <th>자격사항</th>
	                <td>${rc.qualification}</td>
	                <th>직위</th>
	                <td>${rc.position}</td>
	            </tr>
            </c:if>
           
            <!-- 일반 품의서 일 때 -->
            <c:if test="${!empty er}">
	            <tr>
	                <th>시행날짜</th>
	                <td colspan="6">${er.imposition}</td>
	            </tr>
            </c:if>

            <!-- 비품구매서 일 때 -->
            <c:if test="${!empty eb}">
	            <tr>
	                <th>구매요청부서</th>
	                <td colspan="2">${eb.requestTeam}</td>
	                <th>납품요청기한</th>
	                <td colspan="3">${eb.limitDate}</td>
	            </tr>
	            <tr>
	                <th>대금지불방법</th>
	                <td colspan="2">${eb.pay}</td>
	                <th>사용목적</th>
	                <td colspan="3">${eb.purpose}</td>
	            </tr>
	        </c:if>

            <!-- //////////////////////////////////////// -->
            <tr>
                <th>제 목</th>
                <td colspan="6">${ap.approvalTitle}</td>
            </tr>

			<c:if test="${empty eb}">
            <!--비품구매 제외시 보여질 내용-->
            <tr style="height: 400px;">
                <td colspan="7"style="text-align: left;"> <!-- 위치 수정하기... -->
                	${bd.businessDraftContent}
                	${ce.certificateContent}
                	${rc.recruimentContent}
                	${er.expenseReportContent}
                </td>
            </tr>
            </c:if>
        </table>

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
		                <td>${it.itemName}</td>
		                <td>${it.itemSize}</td>
		                <td>${it.total}</td>
		                <td>${it.unit}</td>
		                <td>${it.amount}</td>
		                <td>${it.note}</td>
		            </tr>
		        </c:forEach>
		        <tr>
		        	<th colspan="6">총 금액</th>
		        	<td>${eb.totalPay}</td>
		        </tr>
	        </table>
		</c:if>
		
        <!-- 반려시 보여질 곳 -->
        <br>
        <c:if test="${ap.status eq '반려'}">
        	<div>반려사유 : 
        		${ap.confirmList[0].rejectReason}
        		${ap.confirmList[1].rejectReason}
        		${ap.confirmList[2].rejectReason}
        	</div>
		</c:if>
        <br>

        <div id="attachment-div">
            &nbsp;&nbsp;
            <img src="resources/images/clip.png" width="20px" height="20px">
           	<c:choose>
           		<c:when test="${!empty ap.originName}">
           			첨부파일 (1)개 <a href="${ap.filePath}" download="${ap.originName}">${ap.originName}</a>
           		</c:when>
           		<c:otherwise>
           			첨부파일 (0)개
           		</c:otherwise>
           	</c:choose>
        </div>

        <hr>

        <div>
            <table id="reply-list"> <!-- 댓글용 테이블 -->
            	
            </table>
        </div>
        <br>

        <div id="reply-insert">
            <div id="replyName">${loginUser.userName}</div>
            <div id="replyContent"><input type="text" class="form-control" placeholder="댓글을 입력해주세요." id="reply-content"></div>
            <button type="button" class="btn btn=sm" onclick="insertReply();">등록</button>
        </div>

    </div>
		
	</div>
	
	<script>
		const loginName = '${loginUser.userName}';
	
		$(function(){
			selectReplyList();
			//setInterval(selectReplyList, 1000);
			
		}) // 댓글 실시간 조회용

		function insertReply(){
			if($("#reply-content").val().trim().length != 0){
				$.ajax({
					url:"rinsert.rp",
					data:{refBoardNo:'${ap.approvalNo}',
						replyContent:$("#reply-content").val(),
						userNo:${loginUser.userNo}
					},
					success:function(result){
						
						if(result == 'S'){
							alertify.alert("댓글이 등록되었습니다.");
    						$("#replyContent").val("");
    						selectReplyList();
    					}else{
    						alertify.alert("댓글등록 실패!");
    					}
						
					},error:function(){
						console.log("댓글 작성용 ajax통신 실패");
					}
				})
			}
			
		}
		
		function selectReplyList(){
			
			$.ajax({
				url:"rlist.rp",
				data:{ano:'${ap.approvalNo}'},
				success:function(rlist){
										
					let list = "";
					for(let i in rlist){
						list += "<tr style='height: 40px;' class='originReply'>"
	                    	  + "<th width='130'>" + rlist[i].userNo + "&nbsp;" + rlist[i].jobName + "</th>"
	                          + "<td width='600'>" + rlist[i].replyContent + "</td>"
	                          + "<td width='100' style='font-size: 12px; color: lightgrey;'>" + rlist[i].createDate + "</td>"
	                          + "<td width='100' class='updelbtn'>";
	                    if(loginName == rlist[i].userNo){      
	                    list += "<button class='btn btn-sm' onclick='updateForm(this);'>수정</button><button class='btn btn-sm' onclick='deleteReply(this);'>삭제</button>"
	                          + "<input type='hidden' name='replyName' value='"+ rlist[i].userNo + "'></td>"
	                          + "</tr>" 
	                          + "<tr style='display:none' class='updateReply'>"
	                          + "<th width='130'>" + "<input type='text' name='replyNo' value='"+ rlist[i].replyNo + "' style='color:white; width:120px; border:none;'></th>"
	                          + "<td width='700' colspan='2'>" + "<input type='text' name='replyContent' class='form-control' value='"+ rlist[i].replyContent + "'></td>"
	                          + "<td width='100'>"
	                          + "<button class='btn btn-sm' onclick='updateReply(this);'>수정</button><button class='btn btn-sm' onclick='cancleUpdate(this);'>취소</button></td>"
	                          + "</tr>"
	                          
	                    }else{
	                    	list += "</td></tr>"
	                    }     
					}
					
					
					$("#reply-list").html(list);

				},error:function(){
					console.log("댓글 조회용 ajax통신 실패");
				}
			})
		}
		
		
		$(function(){
			
			const replyName = document.getElementsByName('replyName').value;
			console.log(replyName);

			$("#reply-list>tr input[type='hidden']").each(function(){
				
				if(loginName == replyName){
					
				}
				
			})
			

			
		})
		
		function deleteReply(){
			
			$.ajax({
				url:"delete.rp",
				data:{
					replyNo:$("input[name='replyNo']").val()
				},success:function(result){
					
					if(result == 'S'){
						alertify.alert("댓글이 삭제되었습니다.");
						selectReplyList();
					}else{
						alertify.alert("댓글삭제 실패!");
					}
					
				},error:function(){
					console.log("댓글작성용 ajax통신 실패");
				}
			})
			
		}
		
		function updateForm(updatebtn){ // 수정폼으로 연결
			
			$(updatebtn).parent().parent().attr('style', "display:none;");
			$(updatebtn).parent().parent().next().attr('style', "display:''");
			
		}
		
		function cancleUpdate(canclebtn){ // 취소눌렀을때
			
			$(canclebtn).parent().parent().prev().attr('style', "display:'';");
			$(canclebtn).parent().parent().attr('style', "display:none");
			
		}
		
		function updateReply(update){ // 수정하기
			
			const replyNo = $(update).parent().parent().find("input[name='replyNo']").val();
			const replyContent = $(update).parent().parent().find("input[name='replyContent']").val();

			$.ajax({
				url:"update.rp",
				type:"post",
				data:{
					replyNo:replyNo,
					replyContent:replyContent,
					refBoardNo:'${ap.approvalNo}'
				},success:function(result){
					
					if(result == 'S'){
						alertify.alert("댓글 수정에 성공했습니다.");
						selectReplyList();
					}else{
						alertify.alert("댓글수정 실패!");
					}
					
				},error:function(){
					console.log("댓글수정용 ajax통신 실패");	
				}
			})
		}
		

		function check(){
			$.ajax({
					url:"check.el",
					data:{
						approvalNo:'${ap.approvalNo}',
						userNo:${loginUser.userNo},
						read:'${ap.read}',
						reference:'${ap.reference}',
						userName:'${loginUser.userName}'
					},
					success:function(result){
						
						if(result == 'S'){
							return new swal({
								title:"문서가 열람/참조 되었습니다.",
								icon:"success",
								closeOnClickOutside:false
							})
							.then((value) => {
								if(value){
									location.reload();
								}
							})
						}else{
							return new swal({
								title:"문서 처리 실패!",
								icon:"error",
								closeOnClickOutside:false
							})
							.then((value) => {
								if(value){
									location.reload();
								}
							})
						}
					},error:function(){
						cosole.log("열람 참조용 ajax통신 실패")
					}
				})
		}
	</script>

		  
		  
</body>
</html>