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
        background: red;
    }
    #businessDraft{background-color: rgba(52, 152, 219, 0.15);}
    #eqBuy{background-color: rgb(245, 244, 244);}
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />


		<div class="elec-outer">
	        <br>
	
	        <form action="">
	
	            <div class="btn-group">
	                <a href="bdEnrollForm.el" class="btn btn-sm" id="businessDraft">업무기안서</a>
	                <a href="ebEnrollForm.el" class="btn btn-sm" id="eqBuy">비품구매품의서</a>
	            </div>
	
	            <div id="btns" align="right">
	                <button type="submit" class="btn btn-sm btn-primary">결재요청</button>
	                <button type="submit" class="btn btn-sm">임시저장</button>
	                <button type="button" class="btn btn-sm">미리보기</button>
	                <button type="button" class="btn btn-sm">취소</button>
	            </div>
	
	            <br>
	            <hr>
	
	            <div class="custom-control custom-switch" align="right">
	                <input type="checkbox" class="custom-control-input" id="switch1" name="emc">
	                <label class="custom-control-label" for="switch1">긴급</label>
	            </div>
	
	            <table border="1" class="table-bordered">
	                <tr>
	                    <th colspan="2" width="225">문서 종류</th>
	                    <td colspan="3" width="225">업무기안서</td>
	                    <th colspan="3" width="225">작성자</th>
	                    <td colspan="3" width="225">인사팀 강동원</td>
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
	                            <option value="C">C등급</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th colspan="2">참 조</th>
	                    <td colspan="2" style="border-right: none;">
	                        <input type="text" name="" style="border: none;" value="" readonly required>
	                    </td>
	                    <td width="25" style="border-left: none;">
	                        <button type="button">
	                            <img src="resources/images/875068.png">
	                        </button>
	                    </td>
	                    <th colspan="3">열 람</th>
	                    <td colspan="2" style="border-right: none;">
	                        <input type="text" name="" style="border: none;" value="" readonly required>
	                    </td>
	                    <td width="25" style="border-left: none;">
	                        <button type="button">
	                            <img src="resources/images/875068.png">
	                        </button>
	                    </td>
	                </tr>
	                <tr>
	                    <th colspan="2">결재라인</th>
	                    <td colspan="2" style="border-right: none;">
	                        <input type="text" name="" style="border: none;" value="" readonly required>
	                    </td>
	                    <td width="25" style="border-left: none;">
	                        <button type="button">
	                            <img src="resources/images/875068.png">
	                        </button>
	                    </td>
	                    <td colspan="2" style="border-right: none;">
	                        <input type="text" name="" style="border: none;" value="" readonly required>
	                    </td>
	                    <td width="25" style="border-left: none;">
	                        <button type="button">
	                            <img src="resources/images/875068.png">
	                        </button>
	                    </td>
	                    <td colspan="2" style="border-right: none;">
	                        <input type="text" name="" style="border: none;" value="" readonly required>
	                    </td>
	                    <td width="25" style="border-left: none;">
	                        <button type="button">
	                            <img src="resources/images/875068.png">
	                        </button>
	                    </td>
	                </tr>
	                <tr style="height: 80px;">
	                    <td colspan="11" id="form-type">업무기안서</td>
	                </tr>
	                <tr>
	                    <th>제 목</th>
	                    <td colspan="10"><input type="text" class="form-control" name="" required></td>
	                </tr>
	            </table>
	
	            <div id="summernote"></div>
	            <script>
	                $('#summernote').summernote({
	                  tabsize: 2,
	                  width: 898,
	                  height: 300
	                });
	            </script>
	
	            <input type="file" name="" style="margin-top: 30px;"> 1개의 파일만 첨부할 수 있습니다
	
	        </form>
	    </div>

	</div>

</body>
</html>