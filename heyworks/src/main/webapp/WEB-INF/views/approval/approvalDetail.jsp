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
            <a href="" class="btn btn-sm">목록으로</a>

            <!-- 작성자 -->
            <a href="" class="btn btn-sm text-primary">내용수정</a>
            <a href="" class="btn btn-sm text-danger">기안취소</a>

            <!-- 결재자 -->
            <button type="button" class="btn btn-sm text-primary">결재</button>
            <button type="button" class="btn btn-sm text-danger">반려</button>

            <!-- 반려시 -->
            <a href="" class="btn btn-sm text-danger">재기안</a>

            <!-- 관리자가 복구시 -->
            <button type="button" class="btn btn-sm text-warning">복구하기</button>
        </div>

        <hr>

        <div id="form-type">${ap.approvalTitle}</div>
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
                <th width="150">${ap.firstJcode}</th>
                <th width="150">${ap.secondJcode}</th>
                <th colspan="2" width="150">${ap.thirdJcode}</th>
            </tr>
            <tr style="height: 110px;">
                <td>
                    <img src="resources/images/511608.png"><br><br>
                    ${ap.firstDate}
                </td>
                <td>
                    <img src="resources/images/511608.png"><br><br>
                    ${ap.secondDate}
                </td>
                <td colspan="2">
                    <img src="resources/images/511608.png"><br><br>
                    ${ap.thirdDate}
                </td>
            </tr>
            <tr>
                <th width="150">${ap.firstUser}</th>
                <th width="150">${ap.secondUser}</th>
                <th width="150" colspan="2">${ap.thirdUser}</th>
            </tr>
            <tr>
                <th>참 조</th>
                <td colspan="2">${ap.reference}</td>
                <th>열 람</th>
                <td colspan="3">${ap.read}</td>
            </tr>

            <!-- 증명서 일때 -->
            <tr>
                <th>증명서종류</th>
                <td colspan="2"></td>
                <th>용 도</th>
                <td colspan="3"></td>
            </tr>
            <tr>
                <th>제출처</th>
                <td colspan="2"></td>
                <th>제출일</th>
                <td colspan="3"></td>
            </tr>

            <!-- 채용요청서 일 때 -->
            <tr>
                <th>부 서</th>
                <td></td>
                <th>인 원</th>
                <td></td>
                <th>실무경력(년)</th>
                <td></td>
            </tr>
            <tr>
                <th>채용희망일</th>
                <td></td>
                <th>자격사항</th>
                <td></td>
                <th>직위</th>
                <td></td>
            </tr>
           
            <!-- 일반 품의서 일 때 -->
            <tr>
                <th>시행날짜</th>
                <td colspan="6"></td>
            </tr>

            <!-- 비품구매서 일 때 -->
            <tr>
                <th>구매요청부서</th>
                <td colspan="2"></td>
                <th>납품요청기한</th>
                <td colspan="3"></td>
            </tr>
            <tr>
                <th>대금지불방법</th>
                <td colspan="2"></td>
                <th>사용목적</th>
                <td colspan="3"></td>
            </tr>

            <!-- //////////////////////////////////////// -->
            <tr>
                <th>제 목</th>
                <td colspan="6">${ap.approvalTitle}</td>
            </tr>

            <!--비품구매 제외시 보여질 내용-->
            <tr style="height: 400px;">
                <td colspan="7"style="text-align: left;"> <!-- 위치 수정하기... -->
                	${ap.businessDraftContent}
                </td>
            </tr>
        </table>

        <!-- 비품구매 내용 -->
        <table class="table-bordered">
            <tr>
                <th width="50">품 번</th>
                        <th width="250">품 명</th>
                        <th width="150">규 격</th>
                        <th width="50">단 위</th>
                        <th width="50">수 량</th>
                        <th width="150">금 액(원)</th>
                        <th width="200">비 고</th>
            </tr>
            <tr>
                <td>1</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>2</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>3</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>

        <!-- 반려시 보여질 곳 -->
        <br>
        <div>반려사유 : 내용부족</div>

        <br>

        <div id="attachment-div">
            &nbsp;&nbsp;
            <img src="resources/images/124506.png" width="20px" height="20px">
           	 첨부파일 ()개 ${ap.originName}
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