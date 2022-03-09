<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/color-calendar@1.0.5/dist/bundle.js"></script>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/color-calendar@1.0.5/dist/css/theme-basic.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/color-calendar@1.0.5/dist/css/theme-glass.css"
    />
    
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

<style>
	.outer{
		width:1200px;
		height:1200px;
		margin:auto;
	}
	.outer>div{float:left;}
	#mainView{
		margin: auto;
        margin-top:20px;
        width: 1100px;
        height: 900px;
        margin-left:20px;
	}
	#mainView>div{
		float: left; 
		border: 3px solid rgba(24, 121, 201, 0.11);
		
	}
	#employee, #mail, #elec-approval, #book{
		width: 270px;
		height: 330px;
	}
	#tna, #todo{
		width: 270px;
		height: 450px;
	}
	
	
 	#calendar1{	
	margin: auto;
	width: 540px;
	height: 450px;
	}
	.caltitle{
	font-weight: 700;
	padding: 10px;
	padding-bottom: 0;
	
	}
	#calendar-b{
	margin: auto;
	width: 400px;
	height: 370px;
}
	
	
	
	#mail, #calendar1{margin-left:20px;}
	#profile{
		width: 180px;
		height: 180px;
		margin: auto;
		margin-top: 40px;
		border-radius: 100%;
		border: 1px solid lightgray;	
	}
	#name{
		width: 100%;
		text-align: center;
		margin-top: 10px;
	}
	#name>h5{font-weight: 700;}
	#name>p{color: gray;}
	.title{
		padding: 10px;
		font-weight: 700;
	}

	/*근태관리 버튼*/
	.in-btn, .out-btn{
		width:110px;
        height:42px;
        border-radius:20px;
        border:none;
        background:rgb(63, 145, 213);
        color:white;
        font-size:17px;
        font-weight:500;
		transition: all 0.4s;
	}
	.in-btn:focus, .out-btn:focus{
		outline:none;
	}
	.in-btn:hover, .out-btn:hover{
		background:white;
		color:rgb(63, 145, 213);
		border: 1px solid rgb(63, 145, 213);
	}
	#approvalTable{
		font-size:10px;
		font-weight:400;
	}
	#approvalTable:hover{
		cursor:pointer;
	}


	/* TODOLIST CSS */
	.todo-wrapper {
    /* justify-content: center; */
    /* margin-left: 10rem; */
    width: 250px;

}

.todo-title {
    /* padding: 0.8rem; */
    /* margin-top: 10px; */
    /* margin-bottom: 20px; */
    text-align: center;
    color: rgb(63, 145, 213);
    font-size: 1.1rem;
    font-weight: bold;
}

.todo-box {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 10px;
}

.todo-input-box {
    display: flex;
    flex-wrap: nowrap;
    flex-direction: row;
    height: 3rem;
    border-bottom: 1px solid #ddd;
    justify-content: flex-start;
    align-items: center;
}

button {
    background-color: transparent;
    border: 0;
}

.complete-all-btn {
    color: gray;
    min-width: none;
    min-height: none;
    width: 1.5rem;
    height: 1.5rem;
    margin: 0.5rem 0.5rem;
    border-radius: 50px;
    cursor: pointer;
    font-size: 0.8rem;
    
}

.complete-all-btn.checked {
    color: green
}

.todo-input {
    width: 80%;
    text-align: center;
    border: 0;
    outline: none;
    font-size: 0.8rem;
}

.todo-item {
    position: relative;
    display: flex;
	list-style-type :none;
    flex-wrap: nowrap;
    flex-direction: row;
	list-style-position :inside;
    justify-content: space-between;
    align-items: center;
    height: 2.5rem;
    border-bottom: 1px solid #ddd;
}

.todo-item:hover .delBtn {
    opacity: 1;
}

.checkbox {
    min-width: none;
    min-height: none;
    width: 1.5rem;
    height: 1.2rem;
    /* margin: 0.5rem 0.5rem; */
    border-radius: 50px;
    border: 1px solid lightgray;
    cursor: pointer;
    text-align: center;
    font-size: 0.6rem;
}

.todo-item.checked .checkbox{
    border: 2px solid darkgray;
    color: black;
}

.todo {
    font-size: 0.75rem;
    padding: 0 1rem;
    width: 80%;
}

.todo-item.checked .todo{
 font-style: italic;
 text-decoration: line-through;
 color: lightgray;
}

.delBtn {
    opacity: 1;
    width: 3rem;
    height: 3rem;
    font-size: 0.9rem;
    font-weight: lighter;
    cursor: pointer;
}
.left-items{
    font-size: 0.8rem;
}
.todo-bottom {
    height: 3rem;
    display: flex;
    flex-wrap: nowrap;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.button-group{
    flex-direction: row;
    flex-wrap: nowrap;
}

.button-group button {
    border: 1px solid #eee;
    padding: 0.2rem 0.5rem;
    margin: 0 0.5rem;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.8rem;
}

.button-group button.selected {
    border: 2px solid rosybrown;
    padding: 0.2rem 0.5rem;
    margin: 0 0.5rem;
    border-radius: 8px;
}

.clear-completed-btn:hover {
    font-style: italic;
    text-decoration: underline;
    cursor: pointer;
}
.show-completed-btn{
    font-size: 0.8rem;
}

.edit-input {
    position: absolute;
    left: 0;
    top: 0;
    width: 590px;
    height: 2.8rem;
    margin: 0;
}

p.info {
    margin-top: 1.5rem;
    text-align: center;
    color: #ccc;
}
/* TODOSLIT CSS  끝 ----------- */
</style>
</head>
<body>

	<div class="outer">
	
		<jsp:include page="common/menubar.jsp" />
		
		<div id="mainView">
			<div id="employee">
				<div id="profile">
					<img src="${ emp.image }" width="180px" height="180px" style="border-radius:100px;">
				</div>
				<div id="name">
					<h5>${ emp.userName }</h5>
					<p>삼조전자 | ${ emp.deptName }</p>
				</div>
			</div>
			<div id="mail">
				<div class="title">
					새로온 메일(0)
					<hr>
					새로온 메일이 없습니다.
				</div>
				<div>

				</div>
			</div>
			<div id="elec-approval">
				<div class="title">
					결재예정문서(<span class="text-danger">${apList.size()}</span>)
					<hr>
					<table id="approvalTable" class="table" style="table-layout:fixed">
						<c:choose>
							<c:when test="${!empty apList}">
								<c:forEach var="ap" items="${apList}" begin="0" end="5">
								<input type="hidden" value="${ap.approvalNo}" name="ano">
									<tr>
										<td>${ap.userNo}</td>
										<td style="text-overflow:ellipsis; overflow:hidden"><nobr>${ap.approvalTitle}</nobr></td>
										<td class="text-secondary">${fn:substring(ap.createDate, 5,10)}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3">결재 대기중인 문서가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div>

				</div>
			</div>
			<div id="book">
				<div class="title">
					<a href="myReserve.re" style="color: black;">오늘의 예약목록</a>
					<hr>
					<table class="table">
					<c:choose>
						<c:when test="${!empty list}">
							
							<thead style="font-size: 11px; text-align: center;">
								<tr>
									<th width="30%" > 자원명</th>
									<th > 예약시간</th>
								</tr>
								
							</thead>
							<tbody style="font-size: 11px; text-align: center;" >
								<c:forEach var="r" items="${list}" begin="0" end="2">
									<tr>
										<td>${r.resourceName}</td>
										<td>${r.startDate} ~<br>${r.endDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:when>
						<c:otherwise>
								<tr>
									<td colspan="3">예약 목록이 비어있습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div>

				</div>
			</div>
			<div id="tna">
				<div class="title">
					근태관리
					<hr>
				</div>
				<div class="tna-content" align="center">
					<p id="live-date" class="live-date" style="font-size:22px;"></p>
					<strong id="live-time" class="live-time" style="font-size:35px;"></strong><br><br>
					<br>
					<table class="click-time">
						<tr>
							<th style="font-size:15px; border:none;">출근시간</th>
							<td class="click-td" id="click-td1" style="text-align:right;" width="120px"></td>
						</tr>
						<tr>
							<th style="font-size:15px; border:none;">퇴근시간</th>
							<td class="click-td" id="click-td2" style="text-align:right;" width="120px"></td>
						</tr>
					</table>
					<hr style="margin:10px;"><br>
					
					<button class="in-btn" id="in-btn" style="margin-right:15px;">출근</button> 
					<button class="out-btn" id="out-btn">퇴근</button><br>
				</div>
			</div>
			<div id="calendar1">
				<div class="caltitle">
					일정
					<hr>
				</div>
				
      <div id="calendar-b"></div>
				
			</div>
			<div id="todo">
				<div class="title">
					<div class="todo-title">ToDoList</div>
					<hr>

					<div class="todo-wrapper">
						<div class="todo-box">
						
						<!-- <form name="todoInsert" action="todolistInsert.to" method="post"> -->
							<div class="todo-input-box">
								<!-- <button class="complete-all-btn">✔</button> -->
								<input type="text" class="todo-input" id="contentTag" name="todoContent" placeholder="해야 할 일을 입력해주세요.">
		
								<button type="submit" style="display: none;">??</button>
							</div>
						<!-- </form> -->
							
							<ul class="todo-list" style="list-style: none; padding-left: 10px;" >
								<c:forEach var="t" items="${ todoList }" begin="0" end="5">
									<c:choose>
										<c:when test="${ t.checkStatus eq 'Y'}">
											<li class="todo-item" >
												<div class="checkbox chkbtn" style="color: black;">✔</div>
												<div class="todo todocontent" contenteditable="true" >${t.todoContent}</div>
												<input type="hidden" name="checkNo" value="${t.checkNo}" id="checkNoTag">
									   
												<button class="delBtn">x</button>
											</li>
										</c:when>
										<c:otherwise>
											<li class="todo-item checked">
												<div class="checkbox completebtn"></div>
												
												<div class="todo">${t.todoContent}</div>
											  
												<input type="hidden" name="checkNo" value="${t.checkNo}" id="checkNoTag">
												<button class="delBtn">x</button>
											</li>
		
										</c:otherwise>
								</c:choose>
								</c:forEach>
		
							  
							</ul>
							<div class="todo-bottom" style="margin-top: 1px;">
								<div class="left-items">&nbsp;${count} items left</div>
								<!-- <div class="button-group">
									<button class="show-all-btn selected" data-type="all">All</button>
									<button class="show-active-btn" data-type="active">Active</button>
									<button class="show-completed-btn" data-type="completed">Completed</button>
								</div> -->
								<button class="clear-completed-btn" style="font-size: 0.8rem;">Clear Completed</button>
							</div>


						
						</div>
						<!-- <p class='info'>더블클릭 시 수정 가능!</p> -->
					   
					</div>
				</div>
				<div>

				</div>
			</div>
		</div>

		
	</div>

	
	<script>
		// 근태관리 - 실시간 날짜, 시간 
		function setClock(){
			var dateInfo = new Date(); 
			var hour = modifyNumber(dateInfo.getHours());
			var min = modifyNumber(dateInfo.getMinutes());
			var sec = modifyNumber(dateInfo.getSeconds());
			var year = dateInfo.getFullYear();
			var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해줌
			var date = dateInfo.getDate();
			document.getElementById("live-time").innerHTML = hour + ":" + min + ":" + sec;
			document.getElementById("live-date").innerHTML = year + "년 " + month + "월 " + date + "일";
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

		// 근태관리 -출퇴근 버튼 클릭시 이벤트
		document.getElementById("in-btn").onclick = function(i){

			// 출근버튼 비활성화, 출근 alert
			i.target.style.backgroundColor = "lightgrey";
			alertify.alert("출근하였습니다.");
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

		document.getElementById("out-btn").onclick = function(e){

			if(confirm("정말 퇴근하시겠습니까?") == true){

				e.target.style.backgroundColor = "lightgrey";
				e.target.disabled = true;

				let t = new Date().toTimeString().split(" ")[0];

				document.getElementById("click-td2").innerHTML = t;
				
				alertify.alert("퇴근하였습니다.");
				// 퇴근시간 update
				$.ajax({
				url:"clockout.wo",
				success:function(result){
					console.log("통신 성공");
					
				},error:function(){
					console.log("퇴근 업데이트 ajax 통신 실패");
				}
			  })
			
			}else{
				return false;
			}
		}
		
		// 전자결재 상세보기-------------------------------------------
		$("#approvalTable tr").click(function(){
			location.href="detail.el?ano=" + $("input[name='ano']").val();
		})
		
		

		// todolist ajax --------------------------------------------------------------


		  // todolist 입력

		  $(function(){

				$(document).on('keyup', '.todo-input', function(e){

					var content = $(this).val()

					if(e.keyCode == 13){  

						$.ajax({
							url:"ajaxInsertTodo.to",
							data: {todoContent:content},
							dataType:"JSON",
							success:function(result){

								if (result == 'success') {
								
									location.reload();
								}else{
									alertify.alert("todolist 입력에 실패하였습니다..")
									location.reload();
								}
								
							}
						});

						location.reload();

					}

				
					})


				})









		  // todolist 삭제하기
		  $(function(){
            	$(document).on('click', '.delBtn', function(){
                 var cNo = $(this).siblings("#checkNoTag").val();

                  $.ajax({
                url:"deleteTodolist.to",
                data: { checkNo: cNo},
                dataType:"JSON",
                success:function(json){

                    if (json.result == 1) {
                    
                    location.reload();


                    }else{
                      alertify.alert("todolist 삭제에 실패하였습니다..")
                      location.reload();

                    }
                    
                },
                error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                  }
                });
           
              })
        })

		   // todolist 완료처리하기
		   $(function(){
            	$(document).on('click', '.chkbtn', function(){
                 var cNo = $(this).siblings("#checkNoTag").val();

                  $.ajax({
                url:"completeTodolist.to",
                data: { checkNo: cNo},
                dataType:"JSON",
                success:function(json){

                    if (json.result == 1) {
                    //  alertify.alert("todolist 완료에 성공하였습니다..")
                    
                    location.reload();


                    }else{
                      alertify.alert("todolist 삭제에 실패하였습니다..")
                      location.reload();

                    }
                    
                },
                error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                  }
                });
           
              })
        })

        //todo 복구하기
        $(function(){
            	$(document).on('click', '.completebtn', function(){
                 var cNo = $(this).siblings("#checkNoTag").val();

                  $.ajax({
                url:"restoreTodolist.to",
                data: { checkNo: cNo},
                dataType:"JSON",
                success:function(json){

                    if (json.result == 1) {
                    //  alertify.alert("todolist 완료에 성공하였습니다..")
                    
                    location.reload();


                    }else{
                      alertify.alert("todolist 삭제에 실패하였습니다..")
                      location.reload();

                    }
                    
                },
                error: function(request, status, error){
                    alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                  }
                });
           
              })
        })


         // todolist 수정하기
         $(function(){

            $(document).on('keyup', '.todocontent', function(e){

                var cNo = $(this).siblings("#checkNoTag").val();
                var content = $(this).text()

                if(e.keyCode == 13){  

                    $.ajax({
                        url:"updateTodolist.to",
                        data: { checkNo: cNo, todoContent:content},
                        dataType:"JSON",
                        success:function(result){

                            if (result == 'success') {
                            
                                location.reload();
                            }else{
                                alertify.alert("todolist 수정에 실패하였습니다..")
                                location.reload();
                            }
                            
                        }
                    });

                    location.reload();

                }

               
                })


             })


			 
              // clear-completed 완료된 todolist 지우기
			  $(function(){

				$(document).on('click', '.clear-completed-btn', function(){


						$.ajax({
							url:"deleteComleteTodo.to",
							data: {},
							dataType:"JSON",
							success:function(result){

								if (result == 'success') {
								
									location.reload();
								}else{
									alertify.alert("todolist 삭제에 실패하였습니다..")
									location.reload();
								}
								
							}
						});

						location.reload();

					})


				})
		
				let calB = new Calendar({
			    	  id: "#calendar-b",
			    	  theme: "basic",
			    	  primaryColor: "#3F91D5",
			    	  weekdayType: "short"
			    	 /*   eventsData: [
			    	    {
			    	      id: 1,
			    	      name: "French class",
			    	      start: "2022-03-07T06:00:00",
			    	      end: "2022-03-09T20:30:00"
			    	    },
			    	    {
			    	      id: 2,
			    	      name: "Blockchain 101",
			    	      start: "2022-03-20T10:00:00",
			    	      end: "2022-03-20T11:30:00"
			    	    }
			    	  ]  */
			    	});

		
	</script>
	



</body>
</html>