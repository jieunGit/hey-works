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

#settingBtn{
    border: solid 1px red;
    height: 50px;
}
.btn{
    width: 80px;
    height: 30px;
    font-size: 12px;
    margin-left: 60px;
}

.table th{
    text-align: center;
    font-size: 14px;
}
.table td{
    text-align: center;
    font-size: 13px;
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
                <span style="font-size: 14px;">회의실</span>
            </div>

            <div id="settingbar">
                <a href="" style="color: black;">이용안내</a>&nbsp;&nbsp;
                <span style="font-weight: bold;">자원관리</span>

            </div>

            <div class="line"></div>
            <br>
            <div id="setiingBtn">
                <button type="button" class="btn btn-outline-secondary" style="font-size: 12px;">자원추가</button>
                <button type="button" class="btn btn-outline-secondary" style="font-size: 12px; margin-left: 10px;">순서변경</button>
            </div>

            <br>
            <div class="container" style="width: 850px;">
            <table class="table">
                <thead class="thead-light">
                  <tr >
                    <th width=300px height=30px >자원이름</th>
                    <th width=300px>관리</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>회의실1</td>
                    <td><a href="" style="color: black;"><i class="fa-solid fa-gear"></i></a></i></td>
                   
                  </tr>
                  <tr>
                    <td>회의실2</td>
                    <td><a href="" style="color: black;"><i class="fa-solid fa-gear"></i></a></i></td>
                  
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    
                  </tr>
                </tbody>
              </table>
            </div>
        </div>







    </div>


</body>
</html>