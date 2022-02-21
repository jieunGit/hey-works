package com.kh.hey.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hey.reserve.model.service.ReservationService;

@Controller
public class TodoListController {
	
	@Autowired 
	private ReservationService tService;
	
	//todolist 화면
		@RequestMapping(value="todolist.to")
		public String myReserveList() {
			
			
			
			return "todo/todoList2";
		}
		
	//todoboard 화면
		@RequestMapping(value="todoboard.to")
		public String myTodoBoard() {
			return "todo/myTodoBoard";
		}
		
	//todocard 화면
		@RequestMapping(value="todoCard.to")
		public String todoCard() {
			return "todo/todoBoardCard";
		}
}
