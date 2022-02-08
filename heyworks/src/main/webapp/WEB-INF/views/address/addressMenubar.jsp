<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>
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
.btn{
    width: 150px;
    height: 40px;
    margin: 10px 0px 0px 15px;
    font-size: 13px;
    font-weight: bold;
}
.addressgroup{
    margin: 10px 0px 0px 25px;
}
.group{
   
    width:100px;
    height:30px;
    line-height:30px;
    text-align:center;
    cursor:pointer;  
    font-size: 14px;
    font-weight: bolder;
}
.groupDetail{
   
    width:100px;
    height:30px;
    margin-top:3px;
    padding:5px;
    box-sizing:border-box;
    display:none;
    font-size: 13px;
    font-weight: bold;
    margin-left: 15px;
}
.groupDetail>a{
    color: black;

    
}
a:hover{
    color: rgb(63, 145, 213);
}



</style>

<script>
    $(function(){
        $(".group").click(function(){
            const $p = $(this).nextAll();

            if($p.css("display") == "none") {
                $(this).siblings("div").slideUp();   // silblings : 현재 동위요소 선택

                $p.slideDown();
            }else{
                $p.slideUp();
            }
        })

    })

  



</script>
</head>
<body>

    <div id="menubar">
        <p> <i class="fas fa-angle-double-right"></i>  주소록 </p>
        <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#addAdress"><i class="fas fa-user-plus"> 주소추가 </i></button> 
        <button type="button" class="btn btn-secondary"> <i class="fas fa-folder-plus"> 그룹추가</i></button>
        <br><br>

        <i class="fas fa-star" style="margin-left: 15px; color: rgb(240, 240, 36);"><a href="" style="color: black; font-size: 14px;"> 즐겨찾는주소록</a></i>
        <br>

        <!-- <ul id="lnb">
            <li>
                <a href="">개인주소록</a>
                <ul>
                    <li><a href=""><i class="far fa-address-book"> 전체</i></a></li>
                    <li><a href=""><i class="far fa-folder"> 거래처</i></li>
                    <li><a href=""><i class="far fa-folder"> 그룹사</i></a></li>

                </ul>

            </li>

            <li>

                <a href="">사내주소록</a>
                <ul>
                    <li><a href=""><i class="far fa-address-book"> 전체</i></a> </li>
                    <li><a href=""><i class="far fa-folder"> 개발팀</i></a></li>
                    <li><a href=""><i class="far fa-folder"> 인사팀</i></a></li>
                    <li><a href=""><i class="far fa-folder"> 회계팀</i></a></li>
                 </ul>
            </li>
     </ul> -->

   

        <div class="addressgroup">
        <!-- 그룹생성에따라 만들어지게 -->
        <div class="group"> 개인주소록</div>
        <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a></div>
        <div class="groupDetail"><a href=""><i class="far fa-folder"> 거래처</i></a></div>
        <div class="groupDetail"><a href=""><i class="far fa-folder"> 그룹사</i></a></div>
        </div>
        
        <div class="addressgroup">
        <div class="group">사내주소록</div>
        <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
        <div class="groupDetail"><a href=""><i class="far fa-folder"> 개발팀</i></a></div>
        <div class="groupDetail"><a href=""><i class="far fa-folder"> 인사팀</i></a></div>
        <div class="groupDetail"><a href=""><i class="far fa-folder"> 회계팀</i></a></div>
        </div>
        
    </div>


     <!-- 연락처추가 모달창 -->
            
     <div class="container">
            
        
        <!-- The Modal -->
        <div class="modal" id="addAdress">
        <div class="modal-dialog">
            <div class="modal-content">
            
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                Modal body..
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
            
            </div>
        </div>
        </div>
        
    </div>


   

        
</body>
</html>