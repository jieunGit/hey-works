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
</style>
</head>
<body>

	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
	
		<div class="elec-outer">
        <br>

        <form action="">

            <div id="btns">
                <button type="submit" class="btn btn-sm btn-primary">결재요청</button>
                <button type="submit" class="btn btn-sm">임시저장<input type="hidden" name="temporary" value="T"></button>
                <button type="button" class="btn btn-sm">미리보기</button>
                <button type="button" class="btn btn-sm">취소</button>
            </div>
            <div id="often-form">
                <a href="" class="btn btn-sm">자주쓰는양식</a>
            </div>

            <br>
            <hr>

            <div class="custom-control custom-switch" align="right">
                <input type="checkbox" class="custom-control-input" id="switch1" name="emc">
                <label class="custom-control-label" for="switch1">긴급</label>
            </div>

            <table border="1" class="table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" width="225">문서 종류</th>
                        <td colspan="3" width="225">
                            <select name="category" id="category">
                                <option value="3">증명서신청</option>
                                <option value="4">채용요청서</option>
                                <option value="5">일반품의서</option>
                            </select>
                        </td>
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
                            <input type="text" name="reference" style="border: none;" value="" readonly required>
                        </td>
                        <td width="25" style="border-left: none;">
                            <button type="button" data-target="#confirm-line" data-toggle="modal">
                                <img src="resources/images/875068.png">
                            </button>
                        </td>
                        <th colspan="3">열 람</th>
                        <td colspan="2" style="border-right: none;">
                            <input type="text" name="" style="border: none;" value="" readonly required>
                        </td>
                        <td width="25" style="border-left: none;">
                            <button type="button" data-target="#confirm-line" data-toggle="modal" >
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
                            <button type="button" data-target="#confirm-line" data-toggle="modal" >
                                <img src="resources/images/875068.png">
                            </button>
                        </td>
                        <td colspan="2" style="border-right: none;">
                            <input type="text" name="" style="border: none;" value="" readonly required>
                        </td>
                        <td width="25" style="border-left: none;">
                            <button type="button" data-target="#confirm-line" data-toggle="modal" >
                                <img src="resources/images/875068.png">
                            </button>
                        </td>
                        <td colspan="2" style="border-right: none;">
                            <input type="text" name="" style="border: none;" value="" readonly required>
                        </td>
                        <td width="25" style="border-left: none;">
                            <button type="button" data-target="#confirm-line" data-toggle="modal" >
                                <img src="resources/images/875068.png">
                            </button>
                        </td>
                    </tr>
                </thead>
                <tbody id="certificate">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">증명서신청</td>
                    </tr>
                    <tr>
                        <th colspan="2">증명서종류</th>
                        <td colspan="3"><input type="text" class="form-control" name="" required></td>
                        <th colspan="2">용 도</th>
                        <td colspan="4"><input type="text" class="form-control" name="" required></td>
                    </tr>
                    <tr>
                        <th colspan="2">제출처</th>
                        <td colspan="3"><input type="text" class="form-control" name="" required></td>
                        <th colspan="2">제출일</th>
                        <td colspan="4"><input type="date" name="" required></td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                        <td colspan="10"><input type="text" class="form-control" name="" required></td>
                    </tr>
                </tbody>
                <tbody style="display: none;" id="recruitment">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">채용요청서</td>
                    </tr>
                    <tr>
                        <th colspan="2">부 서</th>
                        <td colspan="3">
                            <select name="deptCode" id="">
                                <option value="1">개발팀</option>
                                <option value="2">영업팀</option>
                                <option value="3">인사팀</option>
                                <option value="4">회계팀</option>
                                <option value="5">경영팀</option>
                            </select>
                        </td>
                        <th colspan="2">인 원</th>
                        <td colspan="4"><input type="text" class="form-control" name=""></td>
                    </tr>
                    <tr>
                        <th colspan="2">실무경력(년)</th>
                        <td colspan="3"><input type="text" class="form-control" name=""></td>
                        <th colspan="2">채용희망일</th>
                        <td colspan="4"><input type="date" name=""></td>
                    </tr>
                    <tr>
                        <th colspan="2">자격사항</th>
                        <td colspan="3"><input type="text" class="form-control" name=""></td>
                        <th colspan="2">직위</th>
                        <td colspan="4">
                            <select name="jobCode" id="">
                                <option value="1">사원</option>
                                <option value="2">주임</option>
                                <option value="3">대리</option>
                                <option value="4">과장</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                        <td colspan="10"><input type="text" class="form-control" name=""></td>
                    </tr>
                </tbody>
                <tbody style="display: none;" id="expenseReport">
                    <tr style="height: 80px;">
                        <td colspan="11" id="form-type">일반품의서</td>
                    </tr>
                    <tr>
                        <th colspan="2">기안일</th>
                        <td colspan="3"><input type="date" class="form-control" name="" required></td>
                        <th colspan="2">시행날짜</th>
                        <td colspan="4"><input type="date" class="form-control" name="" required></td>
                    </tr>
                    <tr>
                        <th>제 목</th>
                        <td colspan="10"><input type="text" class="form-control" name="" required></td>
                    </tr>
                </tbody>
            </table>

            <div style="width: 100%;">
                <textarea name="" id="summernote">
                    <p id="placeholder" style="display: none;">
                        <br>
                        1. 법규 개정에 따라 다음과 같이 업무 방식을 변경하오니 결재 바랍니다. <br><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        -다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음-
                        <br><br>
                        1.
                    </p>
                </textarea>
            </div>

            <input type="file" name="" style="margin-top: 30px;"> 1개의 파일만 첨부할 수 있습니다

        </form>
        
    </div>

    <!--결재버튼(수정하기)-->
    

    <script>
        $('#summernote').summernote({
          placeholder: '양식을 작성 해 주세요',
          tabsize: 2,
          width: 898,
          height: 300
        });

        /*카테고리별로 다르게보이기*/
        $("#category").change(function(){
            if($(this).find("option:selected").val() == 3){
                
                $("#recruitment").hide();
                $("#expenseReport").hide();
                $("#placeholder").hide();
                $("#certificate").show();

            }else if($(this).find("option:selected").val() == 4){

                $("#certificate").hide();
                $("#expenseReport").hide();
                $("#placeholder").hide();
                $("#recruitment").show();

            }else{

                $("#certificate").hide();
                $("#recruitment").hide();
                $("#expenseReport").show();
                $("#placeholder").show();

            }
        })
    </script>
	</div>

</body>
</html>