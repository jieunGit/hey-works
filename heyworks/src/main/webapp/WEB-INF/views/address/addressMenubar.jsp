<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                $(this).siblings("p").slideUp();

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
        <button type="button" class="btn btn-primary"><i class="fas fa-user-plus"> 주소추가 </i></button> 
        <button type="button" class="btn btn-secondary"> <i class="fas fa-folder-plus"> 그룹추가</i></button>
        <br><br>

        <!-- <i class="fas fa-folder-plus" style= "margin-left: 40px;"> <a href="" style="color: black; font-size: 14px;"> 그룹추가</a></i> <br><br> -->
        <i class="fas fa-star" style="margin-left: 15px; color: rgb(240, 240, 36);"><a href="" style="color: black; font-size: 14px;"> 즐겨찾는주소록</a></i>
        <br>
        <div class="addressgroup">
        <!-- 그룹생성에따라 만들어지게 -->
        <div class="group"> 개인주소록</div>
        <div class="groupDetail"><a href=""><i class="far fa-address-book"> 전체</i></a> </div>
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
</body>
</html>