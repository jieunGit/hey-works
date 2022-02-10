<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Quintessential&display=swap" rel="stylesheet">
<style>
.outer{
    width:1200px;
    height:1200px;
    margin:auto;
    
}
.outer>div{float:left;}
	
#center{
	   width: 950px;
	   height:100%;
	   display:inline-block;
	   border: 1px solid lightgray;
	  
}
#toparea{
	   width: 500px;
	   height: 50px;
       font-size: 18px;
	   margin-left: 50px;
	   font-weight: bolder;
}

#todo{
    width: 280px;
    height: 500px;
    border: 1px solid lightblue;
    margin: 10px 30px 20px 50px;
    display: inline-block;
    background: rgba(52, 152, 219, 0.22);


}


#title {
    font-family: 'Nanum Brush Script', cursive;
    font-size: 30px;
}
</style>

</head>
<body>


    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../todo+/todoMenubar.jsp" />


        <div id="center"><br>
			
			<!-- 제목영역 -->
			<div id="toparea">
				<span>TODOLIST</span>
				
			</div>
			<br>

            <div id="todo">
      
                    <h1 id="title"style="text-align:center">TO DO LIST</h1>

                    <input type="text" id="input"  class="form-control" style="width: 210px; height: 30px; display: inline-block; ">

                    <button type="button"  id="button" class="btn btn-outline-secondary" style="width: 60px; height : 32px; display: inline-block;">입력</button>
                    <br><br>
                    <!-- 체크리스트 목록 불러오기 -->
                    <ul id="list" class="list-group">
                        <li class="list-group-item">Hello, World!</li>
                    </ul>
            </div>

                    <!-- todolist  -->
                <script>
                    var button = document.getElementById('button');
                    var input = document.getElementById('input');
                    var list = document.getElementById('list');
                    var cnt = 1;

                    button.addEventListener('click', clickButton);

                    function clickButton() {
                    var temp = document.createElement('li');
                    temp.setAttribute("class", "list-group-item");
                    temp.setAttribute("id", "li"+cnt);
                    temp.innerHTML = input.value;
                    temp.innerHTML += "<button style='float: right; height=30px' class='btn btn-outline-secondary' type='button' onclick='remove("+cnt+")'>삭제</button>";
                    list.appendChild(temp);
                    cnt++;
                    
                    }

                    function remove(cnt) {
                    //window.alert(cnt);
                    var li = document.getElementById('li'+cnt);
                    list.removeChild(li);
                    }
                        
                </script>




       


            






        </div>

    </div>
</body>
</html>