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
    height:auto;
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

.titleBox{
		background-color: white;
		padding: 15px;
		padding-left: 30px;
	}
	
	.titleBox h2{
		margin: 0;
		font-weight: bold;
		color: #6a6a69;
	}
	
	.container{
		background-color: white;
		margin-top: 2%;
		width: 97%;
	}
	
	ul{
		padding: 0;
		margin: 0;
	}
	
	h5.titleText{
		font-weight: bold;
		padding-bottom: 2%;
		font-size: 12pt;
		color: #6e757b;
	}
	
	.secondTitle{
		padding-top: 5%;
	}
	
	#bookmark{
		margin-bottom: 5%;
        margin-left: 25px;
	}
	
	.star_box{
		float: right;
		font-size: 13pt;
	}
	
	/*  클릭시, 별 색상 css */
	.star_color_pink{
		color: orange;
	}
	
	.each_todo{
		border: solid 1px gray;
		display: inline-block;
		width: 250px;
		height: 250px;
		cursor: pointer;
		border-radius: 8px;
		margin: 0 20px;
		margin-bottom: 30px;
		float: left;
	}
	
	.content_box{
		border: solid 0px red;
		word-break:break-all;
		min-height: 80px;
		max-height: 80px;
		padding: 0 20px;
		overflow: hidden;
	    display: -webkit-box;
	    -webkit-line-clamp: 4;
	    -webkit-box-orient: vertical;
	}

	div#board .each_todo{
		float: left;
	}
	
	.add_each_todo{
		border: dashed 1px gray;
		display: table;
	}
	
	.each_todo_box{
		padding: 20px;
	}
	
	.each_todo:hover{
		background-color: #edf1f5;
	}
	
	.add_todo_box{
		text-align: center;
	}
		
	
	
	/* todo 추가 modal */
	.container{
		width: 97%;
		margin: 0 auto;
	}
	
	.table-borderless > tbody > tr > td,
	.table-borderless > tbody > tr > th,
	.table-borderless > tfoot > tr > td,
	.table-borderless > tfoot > tr > th,
	.table-borderless > thead > tr > td,
	.table-borderless > thead > tr > th {
	    border: none;
	}
	
	th{
		font-size: 12pt;
	}
	
	.content{
		resize: none;
	}
	
	.todo_text{
		font-weight: bold;
	}
	
	.blueBtn{
		border-radius: 4px;
		background-color: #0F4C81;
		color: white;
	}
	
	.grayBtn{
		border-radius: 4px;
		background-color: #D8D8D8;
		color: gray;
	}
	
	.redBtn{
		border-radius: 4px;
		background-color: #d53641;
		color: white;
	}

    .colorSelect{
        width: 50px;
        height: 20px;
        display: inline-block;
        margin-left: 40px;
        cursor: pointer;
    }
</style>
</head>
<body>

    
    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../todo/todoMenubar.jsp" />


        <div id="center"><br>
            <div class="container">
	
                <div id="bookmark">
                    <h5 class="titleText">MEMO</h5>
                    <ul class="bookmarkUl">

                        <li class="each_todo add_each_todo" data-toggle="modal" data-target="#addMemoModal">
                            <div class="add_todo_box" style="display: table-cell; vertical-align: middle;">
                                <i class="fa fa-plus" style="color: gray; font-size: 25px;"></i>
                            </div>
                        </li>

                        <li class="each_todo add_each_todo" data-toggle="modal" data-target="#addMemoModal">
                            <div class="add_todo_box" style="display: table-cell; vertical-align: middle;">
                                <i class="fa fa-plus" style="color: gray; font-size: 25px;"></i>
                            </div>
                        </li>


                        <li class="each_todo add_each_todo" data-toggle="modal" data-target="#addTodoModal">
                            <div class="add_todo_box" style="display: table-cell; vertical-align: middle;">
                                <i class="fa fa-plus" style="color: gray; font-size: 25px;"></i>
                            </div>
                        </li>
                    
                    </ul>

                    <li class="each_todo add_each_todo" data-toggle="modal" data-target="#addTodoModal">
                        <div class="add_todo_box" style="display: table-cell; vertical-align: middle;">
                            <i class="fa fa-plus" style="color: gray; font-size: 25px;"></i>
                        </div>
                    </li>
                </div>
                
                
               
                
            </div>
            


    </div>

    



    <%-- 메모 추가 모달 --%>
	<div id="addMemoModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
	 <div class="modal-dialog">
	   <!-- Modal content-->
	   <div class="modal-content">
	     <div class="modal-header">
             <h4 class="modal-title" style="font-weight: bold; font-size: 15px;">MEMO 등록</h4>
	       <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
	     </div>
	     <div class="modal-body">
            <div class="container">
				<form name="addTodoFrm">
					<%-- 임시 회원번호 --%>
					 <table class="table table-borderless">
				      <tbody>
                            <span style="font-size: 13.5px; margin-right: 30px;">색상 선택 : </span>
                            <div class="colorSelect" style="background:rgba(52, 152, 219, 0.38)" ><input type="hidden" value="rgba(52, 152, 219, 0.38)" id="colorTag"></div>
                            <div class="colorSelect" style="background:rgba(52, 152, 219, 0.64)" ><input type="hidden" value="rgba(52, 152, 219, 0.64)" id="colorTag"></div>
                            <div class="colorSelect" style="background:rgba(241, 196, 15, 0.26)" ><input type="hidden" value="rgba(241, 196, 15, 0.26)" id="colorTag"></div>

				      </tbody>
				    </table>
                    
					
					<button class="btn btn-danger" style="float: right;" type="button" class="close" data-dismiss="modal" onclick="window.closeModal()" >취소</button>
					<button class="btn btn-info" style="float: right; margin-right: 5px;" type="button" onclick="submitBtn()">등록</button>
				</form>
			</div>
	     </div>
	   </div>
	 </div>
	</div>
	



    <script>
          $(function(){

                $(document).on('click', '.colorSelect', function(){
                    
                        var memoColor = $(this).children("#colorTag").val();
                        console.log(memoColor);
                        
                        $.ajax({
                            url:"addMemo.to",
                            data: {memoColor:memoColor},
                            dataType:"JSON",
                            success:function(result){

                                if (result == 'success') {
                                    alertify.alert("메모 생성 성공하였습니다..")
                                }else{
                                    alertify.alert("메모 생성에 실패하였습니다..")
                                }
                                
                            }
                        });

                        location.reload();

                    })


            })




    </script>

</body>
</html>