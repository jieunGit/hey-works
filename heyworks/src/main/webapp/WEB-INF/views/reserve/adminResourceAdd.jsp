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



#detail{
    width: 950px;
    height:800px;
    display:inline-block;
    border: 1px solid lightgray;
}


#toparea{
    width: 200px;
    height: 50px;

    margin-left: 50px;
    font-weight: bolder;
}

#resourcename{
    width: 200px;
    height: 50px;

    margin-left: 50px;
    font-weight: bolder;

}

#settingbar{
    margin-left: 50px;
    font-size: 14px;
}

.line{
    background: lightgray;
    width: 900px;
    height: 1px;
    margin-left: 50px;

}

#resourceAddTable{
    margin-left: 50px;
   
}
#resourceAddTable tr{
    text-align: center;
     height: 60px;
}

#resource_content{
   height: 200px;
   resize: none;
}
#btnarea{
   
    
    margin: auto;
    text-align: center;

}

</style>
</head>
<body>
    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
		
		

		<div id="detail">
            <br>
			<div id="toparea"><span>카테고리 관리</span></div>
			<br>

            <div id="resourcename">
                <span style="font-size: 14px;">자원추가</span>
            </div>
            <div class="line"></div>
            <br><br>
            <div id="resourceAddTable">
                <table>
                    <tr>
                        <th width=300px>자원이름</th>
                        <th width=500px><input class="form-control type="text" name="resource_name" id="resource_name"></th>
                    </tr>

                    <tr>
                        <th>자원설명</th>
                        <th><textarea type="text" class="form-control name="resource_content" id="resource_content" placeholder="내용을 입력해주세요"></textarea></th>

                    </tr>

                    <tr>
                        <th>사용여부</th>
                        <th>
                            <input type="radio" id="use" name = "using" Value="use" checked>
                            <label for="use">사용함</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="notuse" name = "using" Value="notuse">
                            <label for="notuse">사용안함</label>
                        </th>
                    </tr>
                </table>
           
            </div>
            <br><br>
            <div id="btnarea" >
                <button type="button" class="btn btn-primary" style="width: 80px;" >저장</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-secondary" style="width: 80px;">삭제</button>
            </div>




    </div>


</body>
</html>