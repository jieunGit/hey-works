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
    display: inline-block;
    margin-left: 65px;
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
    height: 50px;
    margin-left: 500px;

}
.categorybtn{
    width: 120px;
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
                <span style="font-size: 14px;">카테고리목록</span>
            </div>

            <div id="settingBtn" style="display: inline-block;">
                <button type="button" class="btn btn-outline-secondary" id="categorybtn" data-toggle="modal" data-target="#categoryadd" 
                style="font-size: 12px; font-weight: bolder;">+카테고리추가</button>
            </div>
            

            <br>
            <div class="container" style="width: 850px;">
            <table class="table">
                <thead class="thead-light">
                  <tr>
                    <th width=300px>카테고리이름</th>
                    <th width=300px>자원수</th>
                    <th width=250px>관리</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>회의실</td>
                    <td>3</td>
                    <td>
                        <a href="" style="color: gray;"><i class="fa-solid fa-gear"></i></a></i> | 
                        <a href="" style="color:red;"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>차량</td>
                    <td>2</td>
                    <td>
                        <a href="" style="color: gray;"><i class="fa-solid fa-gear"></i></a></i> | 
                        <a href="" style="color:red;"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>비품</td>
                    <td>2</td>
                    <td>
                        <a href="" style="color: gray;"><i class="fa-solid fa-gear"></i></a></i> | 
                        <a href="" style="color:red;"><i class="fa-solid fa-trash-can"></i></a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
        </div>







    </div>




      <!-- 카테고리추가 모달창 -->
      <div class="modal" id="categoryadd">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" style="background: rgb(63, 145, 213);">
              <span style="font-size: 15px; font-weight: bolder;">카테고리 추가</span>

              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
                <span style="display: inline-block; margin-left: 40px; "><h4 style="font-size: 15px; font-weight: bold;" >카테고리 이름 : </h4></span>&nbsp;&nbsp;
                <input name="groupname"  class="form-control" placeholder="그룹명을 입력해주세요"style="display: inline-block; width:310px">	
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              
                <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 100px; height: 40px; font-size: 14px;">
                    추가</button>
            </div>
      
          </div>
        </div>
      </div>

</body>
</html>