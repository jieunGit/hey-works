<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/8bf37c071b.js" crossorigin="anonymous"></script>
<style>

#menubar{
    border: 1px solid lightgray;
    width: 180px;
    height: 800px;
    display:inline-block;
}
#menubar>p {
    font-weight: 1000;
    font-size: 17px;
    margin: 10px 10px 0px 30px;
}

#todolist{
    
    margin: 30px 0px 20px 30px;
}
#board{
   
    margin: 10px 0px 20px 30px;
}
#menubar i{
    font-size: 13.5px;
}
#menubar a{
    color: black;
}
</style>
</head>
<body>
    <div id="menubar">
        <p> <i class="fas fa-angle-double-right"></i>  TODO + </p>
        

        <div id="todolist">
            <a href=""><i class="fa-solid fa-list-check"> </i>ToDoList</a>
        </div>
        <div id="board">
            <a href=""><i class="fa-solid fa-chalkboard-user"></i> Board</a>

        </div>
    </div>  
</body>
</html>