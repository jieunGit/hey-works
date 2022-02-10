<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
d<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        margin-top:20px;
 		margin-left:20px;
        width: 900px;
        height: 900px;
    }
    #btnNsearch>*{float: left;}
    #btns{width: 640px;}
    .table-hover *{
        height: 40px;
        font-size: 12px;
    }
    .table-hover th{background-color: rgb(245, 244, 244);}
    .table-hover td{text-align: center;}
    .table-hover button{
        font-size: 10px;
        width: 65px;
        height: 25px;
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
        <!-- 진행중인문서 -->
        <a href="" class="subject">진행중인문서</a>
        <br><br>

        <div id="btnNsearch">
            <div id="btns">
                <button type="button" class="btn btn-sm">전체</button>
                <button type="button" class="btn btn-sm">결재대기</button>
                <button type="button" class="btn btn-sm">결재예정</button>
                <button type="button" class="btn btn-sm">참조/열람대기</button>
            </div>

            <form>
                <div align="right">
                    <input type="text" name="" value="" placeholder="검색하기">
                    <button type="submit" class="btn btn-sm">검색</button>
                </div>
            </form>
        </div>
        <br><br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="120">문서번호</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="200">제목</th>
                    <th wdith="70">첨부</th>
                    <th width="100">현재결재자</th>
                    <th width="100">최종결재자</th>
                    <th width="80">결재상태</th>
                    <th width="100">기안일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>SA-RE-00001</td>
                    <td>박보검</td>
                    <td>
                        <img src="resources/images/179386.png" style="width: 25%; height: 45%;" >
                    </td>
                    <td>개발팀 인원채용보고의 건</td>
                    <td>
                        <img src="resources/images/2586886.png" style="width: 85%; height: 70%;" >
                    </td>
                    <td>공유</td>
                    <td>강보람</td>
                    <td>
                        <button class="btn btn-sm" style="background-color: rgb(241, 196, 15);">결재대기</button>
                    </td>
                    <td>2022-02-01</td>
                </tr>
            </tbody>
        </table>

    	</div>
	</div>
	
</body>
</html>