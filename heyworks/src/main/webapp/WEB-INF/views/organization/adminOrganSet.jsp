<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도관리</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
        margin: auto;
        margin-top:20px;
        margin-left:40px;
        width: 900px;
        height: 900px;
    }
    .inform {
        height: 70px;
        border-bottom: 1px solid lightgray;
    }
    #inform1 {
        font-weight: bold;
        font-size: 20px;
        padding: 20px 0px 0px 20px;
    }



    ul, ol, li {
        list-style: none;
    }
    /*부서박스css*/
    li>div {
        height: 30px;
        width: 225px;
        background: #e8ecef;
        line-height: 28px;
        cursor: text;
        position: relative;
        border-radius: 2px;
    }
    ol {
        display: block;
        list-style-type: decimal;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }
    li>ol>li {
        padding-left: 249px;
        background: url(https://hr.office.hiworks.com/static/images/insa/line_org_01.png) 106px 15px no-repeat;
    }
    .test1 {
        background: url(https://hr.office.hiworks.com/static/images/insa/line_org_02.png) 106px 0 repeat-y;
        color: #444;
        margin-bottom: 60px;
    }
    .test1 li>ol>li:last-child {
        background: #fff url(https://hr.office.hiworks.com/static/images/insa/line_org_03.png) 106px 0 no-repeat;
    }
    .test1 li>ol>li {
        margin-top: 15px;
        padding-left: 249px;
        background: url(https://hr.office.hiworks.com/static/images/insa/line_org_01.png) 106px 15px no-repeat;
    }
    ol ol {
        margin-block-start: 0px;
        margin-block-end: 0px;
    }
    ol {
        display: block;
        list-style-type: decimal;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }
    .test1 li {
        margin-top: 15px;
    }
</style>
</head>
<body>

   <div class="outer">
   
        <jsp:include page="../common/menubar.jsp" />
        <jsp:include page="sidebar.jsp" />
    
        <div class="contents">
            
            <!--안내문구-->
            <div class="inform">
                <p id="inform1">* 조직도 관리</p>
            </div>
                
            <!--조직도-->
            <div class="organ">

                <ol class="test1">
                    <li>
                        <div>xx팀</div>
                        <ol>
                            <li>
                                <div>하위1</div>
                            </li>
                            <li>
                                <div>하위2</div>
                            </li>
                            <li>
                                <div>하위3</div>
                            </li>
                            <li>
                                <div>하위4</div>
                                <ol>
                                    <li>
                                        <div>하위1</div>
                                    </li>
                                    <li>
                                        <div>하위2</div> 
                                    </li>
                                    <li>
                                        <div>하위3</div>
                                        <ol>
                                            <li>
                                                <div>하위1</div>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>
                                        <div>하위4</div>
                                    </li>
                                    <li>
                                        <div>하위5</div>
                                    </li>
                                    <li>
                                        <div>하위6</div>
                                    </li>
                                </ol>
                            </li>
                        </ol>
                    </li>
                </ol>



            </div>



        </div>
   </div>
   

</body>
</html>