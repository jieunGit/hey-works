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
    height:800px;
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

#cardname{
    border: 1px solid red;
    margin-left: 50px;
    font-size: 14px;
    font-weight: bold;
}

#card{
    border: 1px solid red;
    height: 600px;
}
.each_card{
        /* border: solid 1px gray; */
		display: inline-block;
		width: 250px;
		height: 150px;
		cursor: pointer;
		border-radius: 8px;
		margin: 0 20px;
		margin-bottom: 30px;
		float: left;
        background: lightgray;
}
.each_card_box{


}
.add_each_todo{
		border: dashed 1px gray;
		display: table;
	}
.add_todo_box{
    text-align: center;
}
</style>
</head>
<body>

    
    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../todo/todoMenubar.jsp" />


        <div id="center"><br>

            <!-- 제목영역 -->
			<div id="toparea">
				<span>Card</span>
				
			</div>

            <div id="cardname">
                <span>카드이름</span>
                <!-- 즐겨찾기 유무 -->
               <i class="fas fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i></a>
               <!-- <i class="fa-regular fa-star fa-lg" style="margin-left: 15px; color: rgb(240, 240, 36);"></i> -->

           </div>

			<br>

            <div id="card">
                <ul>
                    <li class="each_card">
                        <div class="each_card_box">



                        </div>
                    </li>

                    <li class="each_card">
                        <div class="each_card_box">



                        </div>
                    </li>
                    <li class="each_card">
                        <div class="each_card_box">



                        </div>
                    </li>
                    <li class="each_card">
                        <div class="each_card_box">



                        </div>
                    </li>

                    <li class="each_card add_each_todo" data-toggle="modal" data-target="#addTodoModal">
                        <div class="add_todo_box" style="display: table-cell; vertical-align: middle;">
                            <i class="fa fa-plus" style="color: gray; font-size: 25px;"></i>
                        </div>
                    </li>
    
                </ul>


            </div>


        </div>




    </div>

    



</body>
</html>