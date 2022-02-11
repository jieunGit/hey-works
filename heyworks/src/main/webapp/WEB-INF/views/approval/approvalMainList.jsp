<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
	.outer{
		width:1200px;
		height:1200px;
	    margin:auto;
	}
	.outer>div{float:left;}
    .elec-outer{
        margin: auto;
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 900px;
    }
    .table-bordered *{
        height: 40px;
    }
    .table-bordered th{
        background-color: rgb(245, 244, 244);
    }
    .table-bordered td{
        text-align: center;
    }
    .subject{
        color: black;
        font-size: 20px;
        font-weight: 800;
    }
    .subject:hover{
        color: black;
        text-decoration: none;
    }
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
	        <!-- 결재 대기 문서 -->
	        <a href="" class="subject">결재 대기 문서</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="120">기안일</th>
	                    <th width="170">결재양식</th>
	                    <th width="80">긴급</th>
	                    <th width="380">제목</th>
	                    <th wdith="40">첨부</th>
	                    <th width="110">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>2022-02-01</td>
	                    <td>채용요청서</td>
	                    <td>
	                        <img src="resources/images/179386.png" style="width: 30%; height: 65%;" >
	                    </td>
	                    <td>개발팀 인원채용보고의 건</td>
	                    <td>
	                        <img src="resources/images/2586886.png" style="width: 80%; height: 70%;" >
	                    </td>
	                    <td>강동원</td>
	                </tr>
	            </tbody>
	        </table>
	
	        <!-- 결재 진행 문서 -->
	        <hr>
	        <a href="" class="subject">참조/열람 문서</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="120">기안일</th>
	                    <th width="170">결재양식</th>
	                    <th width="80">긴급</th>
	                    <th width="380">제목</th>
	                    <th wdith="40">첨부</th>
	                    <th width="110">결재상태</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>2022-01-01</td>
	                    <td>업무기안서</td>
	                    <td>
	                        <img src="resources/images/179386.png" style="width: 30%; height: 65%;" >
	                    </td>
	                    <td>인사팀 업무협조요청으로 인한 기안서 전달드립니다.</td>
	                    <td>
	                        <img src="resources/images/2586886.png" style="width: 80%; height: 70%;" >
	                    </td>
	                    <td>
	                        <button class="btn btn-sm" style="background-color: rgb(186, 216, 159);">결재대기</button>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <!-- 완료 문서 -->
	        <hr>
	        <a href="" class="subject">완료 문서</a>
	        <br><br>
	
	        <table border="1" align="center" class="table-bordered">
	            <thead>
	                <tr align="center">
	                    <th width="150">문서번호</th>
	                    <th width="100">기안일</th>
	                    <th width="120">결재양식</th>
	                    <th width="380">제목</th>
	                    <th wdith="40">첨부</th>
	                    <th width="110">작성자</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>SA-RE-00001</td>
	                    <td>2022-01-10</td>
	                    <td>채용요청서</td>
	                    <td>인사팀 인원 채용 보고건</td>
	                    <td>
	                        <img src="resources/images/2586886.png" style="width: 80%; height: 70%;" >
	                    </td>
	                    <td>이제훈</td>
	                </tr>
	            </tbody>
	        </table>
	
	    </div>
	</div>
	

</body>
</html>