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
    #replyContent{width: 730px;}
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
	            <a class="btn btn-sm text-primary" onclick="postSubmit(1)">내용수정</a>
	            <a class="btn btn-sm text-danger" onclick="postSubmit(2)">기안취소</a>
            </c:if>

            <!-- 결재자 -->
            <c:if test="${loginUser.userName eq ap.confirmList[0].confirmUser}">
	            <a class="btn btn-sm text-primary" onclick="postSubmit(3)">결재</a>
	            <a class="btn btn-sm text-danger" onclick="postSubmit(4)">반려</a>
			</c:if>
			
            <!-- 반려시 -->
            <c:if test="${ap.status eq '반려'}">
            	<a href="" class="btn btn-sm text-danger" onclick="postSubmit(5)">재기안</a>
			</c:if>
            <!-- 관리자가 복구시 -->
            <c:if test="${loginUser.adminYn eq 'Y' && loginUser.deptCode eq 3}">
            	<a class="btn btn-sm text-warning" onclick="postSubmit(6)">복구하기</a>
            </c:if>
        </div>

        <form id="postForm" action="" method="post">
        	<input type="hidden" name="ano" value="${ap.approvalNo}">
        	<input type="hidden" name="filePath" value="${ap.filePath}">
        </form>
        
        <script>
        	function postSubmit(num){

				switch(num){
				case 1:	$("#postForm").attr("action", "updateForm.el").submit(); break;
				case 2:	$("#postForm").attr("action", "delete.el").submit(); break;
				case 3:	$("#postForm").attr("action", "confirm.el").submit(); break;
				case 4:	$("#postForm").attr("action", "reject.el").submit(); break;
				case 5:	$("#postForm").attr("action", "retryForm.el").submit(); break;
				case 6:	$("#postForm").attr("action", "recover.el").submit(); break;
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
                  		<img src="resources/images/511608.png"><br><br>
                  		${ap.confirmList[0].confirmDate}
              		</c:if>
                </td>
                <td>
                    <c:if test="${ap.confirmList[1].confirmStatus eq '승인'}">
                  		<img src="resources/images/511608.png"><br><br>
                  		${ap.confirmList[1].confirmDate}
              		</c:if>
                </td>
                <td colspan="2">
                    <c:if test="${ap.confirmList[2].confirmStatus eq '승인'}">
                  		<img src="resources/images/511608.png"><br><br>
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
                <td colspan="2">${ap.reference}</td>
                <th>열 람</th>
                <td colspan="3">${ap.read}</td>
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
        <c:if test="${ap.status eq 'N'}">
        	<div>반려사유 : 
        		${ap.confirmList[0].rejectReason}
        		${ap.confirmList[1].rejectReason}
        		${ap.confirmList[2].rejectReason}
        	</div>
		</c:if>
        <br>

        <div id="attachment-div">
            &nbsp;&nbsp;
            <img src="resources/images/124506.png" width="20px" height="20px">
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
            <table>
                <tr style="height: 40px;">
                    <th width="120">강동원&nbsp;팀장</th>
                    <td width="700">아주 잘 작성했어요. 이대로 진행하세요</td>
                    <td width="100" style="font-size: 11px; color: lightgrey;">
                        2022/02/02 16:20
                    </td>
                </tr>
            </table>
        </div>
        <br>

        <div id="reply-insert">
            <div id="replyName">김삼조&nbsp;사원</div>
            <div id="replyContent"><input type="text" class="form-control" placeholder="댓글을 입력해주세요."></div>
            <button type="submit" class="btn btn-sm">등록</button>
        </div>

    </div>
		
	</div>

</body>
</html>