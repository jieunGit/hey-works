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
#note{
    margin-left: 50px;
}
</style>
</head>
<body>
    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../reserve/reserveMenubar.jsp" />
		
		
		

		<div id="detail">
            <br>
			<div id="toparea"><span>자원 관리</span></div>
			<br>

            <div id="resourcename">
                <span style="font-size: 14px;">회의실</span>
            </div>

            <div id="settingbar">
                <span style="font-weight: bold;">이용안내</span>&nbsp;&nbsp;
                <a href="resourceList.re?cno=${rc.categoryNo}" style="color: black;">자원관리</a>

            </div>

            <div class="line"></div>
           <br>
            <span style="font-size: 14px; margin-left: 50px;"> ※첫페이지에 나오는 안내문을 작성할 수 있습니다.</span>

            <br><br>

            <!-- 썸머노트 -->
            <form action="updateContent.re" method="post">
                <div id="note">
                    <input type="hidden" value="${rc.categoryNo}" name="categoryNo">
                            <textarea id="summernote" name="categoryContent">
                                ${rc.categoryContent}
                            </textarea>
                    
                    </div>

                
                <br>
                <div id="btnarea" style="margin-left: 385px;">
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>


    </div>


    <script>
        $(document).ready(function() {
          //여기 아래 부분
          $('#summernote').summernote({
              width : 850,
              height: 500,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: 300,             // 최대 높이
              focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",					// 한글 설정
              placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
    
              });
          });
    </script>


</body>
</html>