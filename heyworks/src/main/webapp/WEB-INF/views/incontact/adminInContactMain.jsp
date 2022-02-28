<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/013417db0e.js" crossorigin="anonymous"></script>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
        margin: auto;
        margin-top:20px;
        margin-left:40px;
        width: 900px;
        height: 900px;
    }
    .contents .searchbar {
        margin-top: 30px;
        margin-bottom: 20px;
    }
    .contents .input-group {
        width: 250px;
    }
    #count {
        margin-top: 40px;
        margin-left: 10px;
        font-size: 16px;
        float: left;
    }
    .searchbar {
        width: 250px;
        float: right;
    }
    .contents .table th, td {
        text-align: center;
        font-size: small;
    }
    .addresstable th{
	    font-size: 14px;
    }
    .addresstable td{
        font-size: 13px;
    }
    .contents button {
        width: 80px;
    }
    .modal {
        text-align: center;
    }
    #footer{
        width: 800px;
        margin-left:40px;
    }
    #footer a{
        color: black;
        font-size: 13px;
    }
    @media screen and (min-width: 768px) {
        .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
        }
    }
    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }
    .pagination { margin-top: 100px; }
</style>
</head>
<body>

    <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="adminInContactSidebar.jsp" />

        
   
        <div class="contents">

            <div class="top">

                <span id="count">사내주소록 n개</span>

                <!-- 검색바 -->
                <form class="searchbar">
                    <div class="input-group">
                    <input type="text" class="form-control" placeholder="이름 검색">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" style="width: 34px;">
                        <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                    </div>
                </form>

                
            </div>
            

            <!-- 받은쪽지내용 -->
            <table class="table">
                <thead>
                    <tr>
                        <th style="width:10px;"></th>
                        <th width=10px; ><input type="checkbox" id="chkAll" name="chkAll"></th>
                        <th width=80px;>
                            <span class="title_sort">이름</span>
                            <span class="data">name</span>
                            <span id="nameicon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
                            <span class="sort">${sort}</span>
                        </th>
                        <th width=130px;>전화번호</th>
                        <th width=150px;>이메일</th>
                        <th width=100px;>회사명</th>
                        <th width=80px;>
                            <span class="title_sort">부서<ins class="ic"></ins></span>
                            <span class="data">dept_title</span>
                            <span id="depticon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
                            <span class="sort">${sort}</span>
                        </th>
                        <th width=70px;>
                            <span class="title_sort">직위<ins class="ic"></ins></span>
                            <span class="data">job_title</span>
                            <span id="positionicon" style="cursor: pointer;"><i class="fa fa-sort"></i></span>
                            <span class="sort">${sort}</span>
                        </th>
                        <th width=70px;>그룹</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
                </tbody>
            </table>

            <!-- 삭제|보관 버튼 -->
            <div id="footer">
                <a onclick="deleteValue();">삭제</a>|
                <a href=""> 그룹설정</a>
                
                
        </div>  

            <!-- 삭제 Modal -->
            <div id="delete" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            쪽지를 삭제하시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button type="button" class="btn btn-danger">삭제</button>
                        </div>
                    </div>
            
                </div>
            </div>

            <!-- 보관 Modal -->
            <div id="keep" class="modal fade" role="dialog">
                <div class="modal-dialog modal-sm">
            
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                            쪽지를 보관함으로 이동하시겠습니까?
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right: 22px;">취소</button>
                            <button type="button" class="btn btn-success">보관</button>
                        </div>
                    </div>
            
                </div>
            </div>   
            
            <!-- 페이징바 -->
            <ul class="pagination" style="margin-left: 350px;">
                <li><a href="#"><</a></li>
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">></a></li>
            </ul>
            
            
        </div>
    </div>
   

</body>
</html>