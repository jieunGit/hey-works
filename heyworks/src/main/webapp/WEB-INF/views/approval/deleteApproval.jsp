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
        margin-top:20px;
        width: 900px;
        height: 900px;
    }
    #btns{width: 100%;}
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
        <a href="" class="subject">삭제문서목록</a>
        <br><br>

        <form>
            <div align="right">
                <input type="text" name="" value="" placeholder="검색하기">
                <button type="submit" class="btn btn-sm">검색</button>
            </div>
        </form>
        <br>

        <table align="center" class="table-hover">
            <thead>
                <tr align="center">
                    <th width="160">문서번호</th>
                    <th width="80">작성자</th>
                    <th width="70">긴급</th>
                    <th width="400">제목</th>
                    <th wdith="70">첨부</th>
                    <th width="140">기안일</th>
                </tr>
            </thead>
            <tbody>
                <!--결재대기-->
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
                    <td>2022-02-01</td>
                </tr>
                <!--참조/열람-->
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
                    <td>2022-02-01</td>
                </tr>
                <!--결재예정-->
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
                    <td>2022-02-01</td>
                </tr>
                <!--완료-->
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
                    <td>2022-02-01</td>
                </tr>
            </tbody>
        </table>

    </div>
    
	</div>

</body>
</html>