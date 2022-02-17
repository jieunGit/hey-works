<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sidebar{
        border:1px solid lightgray;
	    width:180px;
	    height:800px;
        display:inline-block;
    }
    .sidebar>*{margin-left:15px;}
    .sidebar-title{font-size:20px; font-weight:bold;}
    .click-td{text-align:right; border:none;}
    button{margin-top:7px;}
    /*실시간 날짜, 시간*/
    .date{font-size:15px;}
    .time{
        font-size:30px;
    }
    .in-btn, .out-btn{
        width:65px;
        height:37px;
        border-radius:20px;
        border:none;
        background:rgb(63, 145, 213);
        color:white;
        font-size:15px;
        font-weight:600;
    }
    .ot-btn{
        width:147px;
        height:37px;
        border-radius:20px;
        border:none;
        background:lightgrey;
        color:white;
        font-size:15px;
        font-weight:600;
    }
    .in-btn, .out-btn, .ot-btn:hover{cursor:pointer;}
    ul{list-style:none; padding-left:0px; margin-top:10px;}
    a{text-decoration:none; color:black;}
    ul>li{margin-top:10px;}

</style>
</head>
<body>

    <div class="sidebar">
        <br>
        <div class="sidebar-title">
            >> 근태관리
        </div><br>

        <p id="date" class="date"></p>
        <strong id="time" class="time"></strong><br><br>

        <table class="click-time">
            <tr>
                <th style="font-size:13px;">출근시간</th>
                <td class="click-td" id="click-td1" width="90px"></td>
            </tr>
            <tr>
                <th style="font-size:13px;">퇴근시간</th>
                <td class="click-td" id="click-td2" ></td>
            </tr>
        </table>
        <hr style="margin-right:15px;">

        <button class="in-btn" id="btn1" style="margin-left:15px;">출근</button> 
        <button class="out-btn" id="btn2">퇴근</button><br>

        <!--출퇴근 버튼 클릭시 이벤트-->
        <script>
            document.getElementById("btn1").onclick = function(i){

            	// 출근버튼 비활성화, 출근 alert
                i.target.style.backgroundColor = "lightgrey";
                alert("출근하였습니다.");
                i.target.disabled = true;

                // 출근시간 옆에 누른 시간 찍힘
                let t = new Date().toTimeString().split(" ")[0];
                document.getElementById("click-td1").innerHTML = t;
                
                // 출근시간 insert 
                $.ajax({
                url:"clockin.wo",
                success:function(result){
				 console.log("통신 성공");
                },error:function(){
                    console.log("출근 인서트 ajax 통신 실패");
                }
              })
                
            }

            document.getElementById("btn2").onclick = function(e){

                if(confirm("퇴근하시겠습니까?") == true){

                    e.target.style.backgroundColor = "lightgrey";
                    e.target.disabled = true;

                    let t = new Date().toTimeString().split(" ")[0];
                
                    document.getElementById("click-td2").innerHTML = t;

                    // 퇴근시간 update
                    $.ajax({
                    url:"clockout.wo",
                    success:function(result){
    				 console.log("통신 성공");
                    },error:function(){
                        console.log("퇴근 인서트 ajax 통신 실패");
                    }
                  })
                  
                }else{
                    return false;
                }
            }
        </script>
        

        <button class="ot-btn" style="margin-left:15px;">연장근무신청</button>
        <br><br><br>

        <div class="sidebar-menu">
            <ul>
                <li style="font-size:15px;"><strong>내 근무</strong>
                    <ul>
                        <li style="margin-left:15px;"><a href="">근무/휴가</a></li>
                        <li style="margin-left:15px;"><a href="">근무/휴가현황</a></li>
                        <li style="margin-left:15px;"><a href="">부서 근무현황</a></li>
                    </ul>
                </li><br><br>

                <!--관리자만-->
                <li style="font-size:15px;"><strong>근무관리</strong>
                    <ul>
                        <li style="margin-left:15px;"><a href="">전사 휴가현황</a></li>
                        <li style="margin-left:15px;"><a href="">휴가 신청내역</a></li>
                        <li style="margin-left:15px;"><a href="">연장근무 신청내역</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <!--실시간 날짜, 시간-->
        <script>
            function setClock(){
                var dateInfo = new Date(); 
                var hour = modifyNumber(dateInfo.getHours());
                var min = modifyNumber(dateInfo.getMinutes());
                var sec = modifyNumber(dateInfo.getSeconds());
                var year = dateInfo.getFullYear();
                var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해줌
                var date = dateInfo.getDate();
                document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
                document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
            }
            function modifyNumber(time){
                if(parseInt(time)<10){
                    return "0"+ time;
                }
                else
                    return time;
            }
            window.onload = function(){
                setClock();
                setInterval(setClock,1000); //1초마다 setClock 함수 실행
            }

        </script>

    </div>
</body>
</html>