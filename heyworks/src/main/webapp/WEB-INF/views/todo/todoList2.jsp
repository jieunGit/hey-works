<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <link rel="stylesheet" href="reset.css"> -->
<!-- <link rel="stylesheet" href="style.css"> -->
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
	   width: 400px;
	   height: 50px;
       font-size: 18px;
	   margin-left: 50px;
	   font-weight: bolder;
    }

.todo-wrapper {
    justify-content: center;
    margin-left: 3rem;
    width: 400px;
}

.todo-title {
    padding: 0.8rem;
    margin-top: 10px;
    margin-bottom: 20px;
    text-align: center;
    /* color: rosybrown; */
    color: rgb(63, 145, 213);
    font-size: 1.7rem;
}

.todo-box {
    background-color: white;
    border: 1px solid #ddd;
    
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
    font-size: 0.9rem;
}

.todo-item {
    position: relative;
    display: flex;
    flex-wrap: nowrap;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 3rem;
    border-bottom: 1px solid #ddd;
}

.todo-item:hover .delBtn {
    opacity: 1;
}

.checkbox {
    min-width: none;
    min-height: none;
    width: 1.5rem;
    height: 1.5rem;
    margin: 0.5rem 0.5rem;
    border-radius: 50px;
    border: 1px solid lightgray;
    cursor: pointer;
    text-align: center;
    font-size: 0.8rem;
}

.todo-item.checked .checkbox{
    border: 2px solid darkgray;
    color: green;
}

.todo {
    font-size: 0.9rem;
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


</style>

</head>
<body>
    <script type="text/javascript">
        
        //할일 추가 form 서브밋

        function press(f){ if(f.keyCode == 13){  } }

        //할일 삭제 
        function deleteTodolist() {
            $("#checkNoTag").val();

            


        }

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
                    console.log("엔터침");
                    console.log(cNo);
                    console.log(content);

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

             /*
            	$(document).on('click', '.todocontent', function(){
                    var cNo = $(this).siblings("#checkNoTag").val();

                    var content = $(this).text()

                    console.log(cNo);
                    console.log(content);

                    function press(f){ 
                        if(f.keyCode == 13){  

                            update_todo.submit();

                        // $.ajax({
                        // url:"updateTodolist.to",
                        // data: { checkNo: cNo, todoContent:content},
                        // dataType:"JSON",
                        // success:function(json){

                        //     if (json.result == 1) {
                            
                        //     location.reload();


                        //     }else{
                        //     alertify.alert("todolist 수정에 실패하였습니다..")
                        //     location.reload();

                        //     }
                            
                        // },
                        // error: function(request, status, error){
                        //     alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                        // }
                        // });
                    
                    }
                    
                    }
                   
                    */   
               
                })


             })

           
       
  



      

    </script>


    <div class="outer">
		<jsp:include page="../common/menubar.jsp" />
		<jsp:include page="../todo/todoMenubar.jsp" />


        <div id="center"><br>
			
			<!-- 제목영역 -->
			<!-- <div id="toparea">
				<span>TODOLIST</span>
				
			</div>
			<br> -->

            <div class="todo-wrapper">
                <div class="todo-title">ToDoList</div>
                <div class="todo-box">
                
                <form name="todoInsert" action="todolistInsert.to" method="post">
                    <div class="todo-input-box">
                        <button class="complete-all-btn">✔</button>
                        <input type="text" class="todo-input" id="contentTag" name="todoContent" placeholder="해야 할 일을 입력해주세요."  onkeypress="JavaScript:press(this.form)">

                        <button type="submit" style="display: none;">??</button>
                    </div>
                </form>
                    
                    <ul class="todo-list">
                        <c:forEach var="t" items="${ todoList }">
                            <c:choose>
                                <c:when test="${ t.checkStatus eq 'Y'}">
                                <!-- <form action="updateTodo" method="post" name="update_todo" > -->
                                    <li class="todo-item ">
                                        <div class="checkbox chkbtn">✔</div>
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

                        <li class="todo-item">
                            <div class="checkbox"></div>
                            <div class="todo">할일1</div>
                            <button class="delBtn">x</button>
                        </li>
                    
                    </ul>
                    <div class="todo-bottom">
                        <div class="left-items">${count} items left</div>
                        <div class="button-group">
                            <button class="show-all-btn selected" data-type="all">All</button>
                            <button class="show-active-btn" data-type="active">Active</button>
                            <button class="show-completed-btn" data-type="completed">Completed</button>
                        </div>
                        <button class="clear-completed-btn" style="font-size: 0.8rem;">Clear Completed</button>
                    </div>
                </div>
                <!-- <p class='info'>더블클릭 시 수정 가능!</p> -->
               
            </div>
            <!-- <script src="todo.js" ></script> -->



       


            






        </div>

    </div>



    <script>


            const todoInputElem = document.querySelector('.todo-input');
            const todoListElem = document.querySelector('.todo-list');
            const completeAllBtnElem = document.querySelector('.complete-all-btn');
            const leftItemsElem = document.querySelector('.left-items')
            const showAllBtnElem = document.querySelector('.show-all-btn');
            const showActiveBtnElem = document.querySelector('.show-active-btn');
            const showCompletedBtnElem = document.querySelector('.show-completed-btn');
            const clearCompletedBtnElem = document.querySelector('.clear-completed-btn');


           
            let id = 0;  // 할일들의 id
            const setId = (newId) => {id = newId};

            let isAllCompleted = false; // 전체 todos 체크 여부
            const setIsAllCompleted = (bool) => { isAllCompleted = bool};

            let currentShowType = 'all'; // all  | active | complete
            const setCurrentShowType = (newShowType) => currentShowType = newShowType

            // 할일들을 담을 배열 todos
            let todos = [];
            const setTodos = (newTodos) => {       //function(newTodos) { 배열 = newTodos?
                todos = newTodos;
            }

            const getAllTodos = () => {
                return todos;
            }
            const getCompletedTodos = () => {
                return todos.filter(todo => todo.isCompleted === true );
            }
            const getActiveTodos = () => {
                return todos.filter(todo => todo.isCompleted === false);
            }

            const setLeftItems = () => {
                const leftTodos = getActiveTodos()
                leftItemsElem.innerHTML = `${leftTodos.length} items left`
            }

            const completeAll = () => {
                completeAllBtnElem.classList.add('checked');
                const newTodos = getAllTodos().map(todo => ({...todo, isCompleted: true }) )
                setTodos(newTodos)
            }

            const incompleteAll = () => {
                completeAllBtnElem.classList.remove('checked');
                const newTodos =  getAllTodos().map(todo => ({...todo, isCompleted: false }) );
                setTodos(newTodos)
            }

            // 전체 todos의 check 여부 (isCompleted)
            const checkIsAllCompleted = () => {
                if(getAllTodos().length === getCompletedTodos().length ){
                    setIsAllCompleted(true);
                    completeAllBtnElem.classList.add('checked');
                }else {
                    setIsAllCompleted(false);
                    completeAllBtnElem.classList.remove('checked');
                }
            }

            const onClickCompleteAll = () => {
                if(!getAllTodos().length) return; // todos배열의 길이가 0이면 return;

                if(isAllCompleted) incompleteAll(); // isAllCompleted가 true이면 todos를 전체 미완료 처리 
                else completeAll(); // isAllCompleted가 false이면 todos를 전체 완료 처리 
                setIsAllCompleted(!isAllCompleted); // isAllCompleted 토글
                paintTodos(); // 새로운 todos를 렌더링
                setLeftItems()
            }

            const appendTodos = (text) => {
                const newId = id + 1; // 기존에 i++ 로 작성했던 부분을 setId()를 통해 id값을 갱신하였다.
                setId(newId)
                const newTodos = getAllTodos().concat({id: newId, isCompleted: false, content: text })
                // const newTodos = [...getAllTodos(), {id: newId, isCompleted: false, content: text }]
                setTodos(newTodos)
                setLeftItems()
                checkIsAllCompleted();
                paintTodos();
            }

            //할일 삭제 기능
            const deleteTodo = (todoId) => {
                const newTodos = getAllTodos().filter(todo => todo.id !== todoId );
                setTodos(newTodos);
                setLeftItems()
                paintTodos()
            }
            //할일 완료 기능
            const completeTodo = (todoId) => {
                const newTodos = getAllTodos().map(todo => todo.id === todoId ? {...todo,  isCompleted: !todo.isCompleted} : todo )
                setTodos(newTodos);
                paintTodos();
                setLeftItems()
                checkIsAllCompleted();
            }

            const updateTodo = (text, todoId) => {
                const currentTodos = getAllTodos();
                const newTodos = currentTodos.map(todo => todo.id === todoId ? ({...todo, content: text}) : todo);
                setTodos(newTodos);
                paintTodos();
            }

            const onDbclickTodo = (e, todoId) => {
                const todoElem = e.target;
                const inputText = e.target.innerText;
                const todoItemElem = todoElem.parentNode;
                const inputElem = document.createElement('input');
                inputElem.value = inputText;
                inputElem.classList.add('edit-input');
                inputElem.addEventListener('keypress', (e)=>{
                    if(e.key === 'Enter') {
                        updateTodo(e.target.value, todoId);
                        document.body.removeEventListener('click', onClickBody );
                    }
                })

                const onClickBody = (e) => {
                    if(e.target !== inputElem)  {
                        todoItemElem.removeChild(inputElem);
                        document.body.removeEventListener('click', onClickBody );
                    }
                }
                
                document.body.addEventListener('click', onClickBody)
                todoItemElem.appendChild(inputElem);
            }

            const clearCompletedTodos = () => {
                const newTodos = getActiveTodos()
                setTodos(newTodos)
                paintTodos();
            }

            const paintTodo = (todo) => {
                const todoItemElem = document.createElement('li');
                todoItemElem.classList.add('todo-item');

                todoItemElem.setAttribute('data-id', todo.id );

                 //할일 완료 기능
                const checkboxElem = document.createElement('div');
                checkboxElem.classList.add('checkbox');
                checkboxElem.addEventListener('click', () => completeTodo(todo.id))

                //할일 수정하기
                const todoElem = document.createElement('div');
                todoElem.classList.add('todo');
                todoElem.addEventListener('dblclick', (event) => onDbclickTodo(event, todo.id))
                todoElem.innerText = todo.content;

                //x버튼 누르면 삭제
                const delBtnElem = document.createElement('button');
                delBtnElem.classList.add('delBtn');
                delBtnElem.addEventListener('click', () =>  deleteTodo(todo.id))
                delBtnElem.innerHTML = 'X';

                if(todo.isCompleted) {
                    todoItemElem.classList.add('checked');
                    checkboxElem.innerText = '✔';
                }

                todoItemElem.appendChild(checkboxElem);
                todoItemElem.appendChild(todoElem);
                todoItemElem.appendChild(delBtnElem);

                todoListElem.appendChild(todoItemElem);
            }

            const paintTodos = () => {
                todoListElem.innerHTML = null;

                switch (currentShowType) {
                    case 'all':
                        const allTodos = getAllTodos();
                        allTodos.forEach(todo => { paintTodo(todo);});
                        break;
                    case 'active': 
                        const activeTodos = getActiveTodos();
                        activeTodos.forEach(todo => { paintTodo(todo);});
                        break;
                    case 'completed': 
                        const completedTodos = getCompletedTodos();
                        completedTodos.forEach(todo => { paintTodo(todo);});
                        break;
                    default:
                        break;
                }
            }

            const onClickShowTodosType = (e) => {
                const currentBtnElem = e.target;
                const newShowType = currentBtnElem.dataset.type;

                if ( currentShowType === newShowType ) return;

                const preBtnElem = document.querySelector(`.show-${currentShowType}-btn`);
                preBtnElem.classList.remove('selected');

                currentBtnElem.classList.add('selected')
                setCurrentShowType(newShowType)
                paintTodos();
            }

            // 1. 입력에 대한 이벤트 리스터 등록하기
            // 입력되는 값이 enter라면 appendToos()함수에 input의 vlaue 값 넘겨줌 , todoInputElem 초기화
            // const init = () => {
            //     todoInputElem.addEventListener('keypress', (e) =>{
            //         if( e.key === 'Enter' ){
            //             appendTodos(e.target.value); todoInputElem.value ='';
            //         }
            //     })
            //     completeAllBtnElem.addEventListener('click',  onClickCompleteAll);
            //     showAllBtnElem.addEventListener('click', onClickShowTodosType);
            //     showActiveBtnElem.addEventListener('click',onClickShowTodosType);
            //     showCompletedBtnElem.addEventListener('click',onClickShowTodosType);
            //     clearCompletedBtnElem.addEventListener('click', clearCompletedTodos);
            //     setLeftItems()
            // }

            // init()
    </script>
</body>
</html>