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
        height: 2000px;
    }
    #btns{width: 100%;}
    .table-striped *{
        height: 40px;
        font-size: 13px;
    }
    .table-striped th{background-color: rgb(241, 244, 248);}
    .table-striped td{text-align: center;}
    .table-striped a{
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
    #insert-area{
        border: 1px solid gray;
        padding: 5px;
        padding-top: 10px;
        width: 100%;
        height: 500px;
    }
    #insert-area>*{float: left;}
    #insert-area>p{
        width: 100%;
        font-size: 15px;
        font-weight: 700;
    }
    .check-user{
        border: 1px solid gray;
        margin-left: 10px;
        font-size: 12px;
        width: 210px;
        height: 200px;
    }
    .check-user>p{
        background-color: rgb(241, 244, 248);
        width: 100%;
        height: 40px;
        text-align: center;
        line-height: 40px;
        margin-bottom: 0px;
    }
</style>
</head>
<body>
	
	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="sidebar.jsp" />
		
		<div class="elec-outer">

        <a href="" class="subject">전자결재관리자</a>
        <br><br>

        <form>
            <div align="right">
                <input type="text" name="" value="" placeholder="검색하기">
                <button type="submit" class="btn btn-sm">검색</button>
            </div>
        </form>
        <br>

        <table align="center" class="table-striped">
            <thead>
                <tr align="center">
                    <th width="50"><input type="checkbox" onclick="allCheck(this);"></th>
                    <th width="100">사번</th>
                    <th width="100">이름</th>
                    <th width="100">팀</th>
                    <th width="100">직위</th>
                    <th wdith="100">사내전화</th>
                    <th width="250">이메일</th>
                    <th width="100"><a class="btn btn-sm btn-danger">해제하기</a></th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
            	<c:when test="${!empty adlist}">
            		<c:forEach var="ad" items="${adlist}">
		                <tr>
		                    <td><input type="checkbox" name="userNo" value="${ad.userNo}" class="boxes"></td>
		                    <td>${ad.userNo}</td>
		                    <td>${ad.userName}</td>
		                    <td>${ad.deptName}</td>
		                    <td>${ad.jobName}</td>
		                    <td>${ad.class}</td>
		                    <td>${ad.email}</td>
		                    <td><a class="btn btn-sm btn-outline-danger">해제하기</a></td>
		                </tr>
	                </c:forEach>
                </c:when>
                <c:otherwise>
                	<tr>
                		<th colspan="8">조회된 사원이 없습니다.<th>
                	</tr>
                </c:otherwise>
            </c:choose>    
            </tbody>
        </table>

        <br><br>
        <button class="btn btn-sm" style="background-color:rgb(235, 235, 236);">전자결재 관리자 추가하기</button>
        <br><br>

        <div id="insert-area">

            <p>&nbsp;&nbsp;&nbsp;삼조전자 관리자 목록</p>

            <div class="check-user" style="overflow: auto;">

                <p id="jobCode1" onclick="jobList(4);">과장</p>
                <table class="table" id="gwajang">
                    <tr>
                        <td width="20"><input type="checkbox" onclick="viewName(this, 1);" ></td>
                        <td width="100">200100005</td>
                        <td width="80" class="sawon-name1">박보검</td>
                    </tr>
                </table>
            </div>
            <div class="check-user" style="overflow: auto;">
                <p id="jobCode2" onclick="jobList(3);">대리</p>
                <table class="table" id="daeli">
                    <tr>
                        <td width="20"><input type="checkbox" onclick="viewName(this, 2);" ></td>
                        <td width="100">200100005</td>
                        <td width="80" class="sawon-name2">이제훈</td>
                    </tr>
                </table>
            </div>
            <div class="check-user" style="overflow: auto;">
                <p id="jobCode3" onclick="jobList(2);">주임</p>
                <table class="table" id="juim">
                    <tr>
                        <td width="20"><input type="checkbox" onclick="viewName(this, 3);" ></td>
                        <td width="100">200100005</td>
                        <td width="80" class="sawon-name3">조인성</td>
                    </tr>
                </table>
            </div>
            <div class="check-user" style="overflow: auto;">
                <p id="jobCode4" onclick="jobList(1);">사원</p>
                <table class="table" id="sawon">
                    <tr>
                        <td width="20"><input type="checkbox" onclick="viewName(this, 4);" ></td>
                        <td width="100"><p>200100005</p></td>
                        <td width="80"><p class="sawon-name4">서강준</p></td>
                    </tr>
                </table>
            </div>

            <br><br>
            <div style="width: 100%; border: 1px solid lightgray; margin-top: 30px;"></div>
            
            <div>
                <p id="checkName1"></p>
                <p id="checkName2"></p>
                <p id="checkName3"></p>
                <p id="checkName4"></p>
            </div>

            <!-- checkbox에 체크시 나타나게 -->
            <div id="chuga" style="display: none;">
                <p>다음과 같은 사원들을 관리자로 추가하시겠습니까?</p>
                <button class="btn btn-sm btn-outline-primary">추가하기</button>
            </div>
        </div>

    </div>

    <script>
        /*전체 체크*/
        function allCheck(check){
            const confirm = check.checked;
            if(confirm){
                $(".boxes").attr("checked", true);
            }else{
                $(".boxes").attr("checked", false);
            }
        }
        
        /*직급 */
        
        

        /*체크시 이름 뿌리기*/
        function viewName(show, num){
            
            const confirm2 = show.checked;

            let name = $(".sawon-name" + num).text();
            let code = $("#jobCode" + num).text();

            if(confirm2){

                for(let i=1; i<5; i++){

                    if(num == i){
                        
                        $("#checkName" + num).text(name + " " + code);                   
                        
                    }
                   
                }

            }else{
                    $("#checkName" + num).text("");
            }

        }

    

        $(function(){ //수정하기
            const test2 = $(".table input[type='checkbox']");
            const test3 = test2.checked;
            console.log(test2);
            if(test3){

                console.log(test3)

                $("#chuga").show();
            }else{
                $("#chuga").hide();
            }
        })
    </script>
	</div>
	
</body>
</html>