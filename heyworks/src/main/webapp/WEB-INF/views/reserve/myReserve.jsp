<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	
   #menubar{
   	 border: 1px solid red;
	 width: 180px;
	 height: 800px;
   }

   #detail{
	   border: 1px solid blue;
	   width: 950px;
	   height:100%;
   }

</style>
</head>
<body>

	<div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		
		
		 <div id="menubar">
            
        </div>

		<div id="detail">
			

		</div>
	
	</div>
	

	
</body>
</html>