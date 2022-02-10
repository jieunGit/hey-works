package com.kh.hey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TodoListController {
	
	//todolist 화면
		@RequestMapping(value="todolist.to")
		public String myReserveList() {
			return "todo+/todoList";
		}
		
	//todoboard 화면
		@RequestMapping(value="todoboard.to")
		public String myTodoBoard() {
			return "todo+/myTodoBoard";
		}
		
	//todocard 화면
		@RequestMapping(value="todoCard.to")
		public String todoCard() {
			return "todo+/todoBoardCard";
		}
}
