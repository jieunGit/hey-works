package com.kh.hey.todo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.todo.model.service.todolistService;
import com.kh.hey.todo.model.vo.Memo;
import com.kh.hey.todo.model.vo.Todolist;

@Controller
public class TodoListController {
	
	@Autowired 
	private todolistService tService;
	
	//todolist 화면
		@RequestMapping(value="todolist.to")
		public String todolistSelect(Model model,HttpSession session) {
			
			//로그인한 사원번호
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			//해야할일 카운팅하기
			int count = tService.todolistCount(userNo);
			
			ArrayList<Todolist> todoList = tService.todolistSelect(userNo);
			
			model.addAttribute("count", count);
			model.addAttribute("todoList", todoList);
			
			return "todo/todoList2";
		}
		
	//todolist 입력하기
		@RequestMapping(value="todolistInsert.to")
		public String todolistInsert(HttpServletRequest request, Model model,HttpSession session, Todolist to) {
			
			//로그인한 사원번호
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			String todoContent = request.getParameter("todoContent");
			to.setTodoContent(todoContent);
			to.setUserNo(userNo);
			
			int result = tService.todolistInsert(to);
			
			if(result > 0) {
				return "redirect:todolist.to";
			}else {
				session.setAttribute("alertMsg", "todolist 추가가 실패되었습니다.");
				return "redirect:todolist.to";
			}
			
		}
			
		//todolist 삭제하기
		@ResponseBody
		@RequestMapping(value="deleteTodolist.to", produces="application/json; charset=utf-8")
		public String deleteTodolist(HttpServletRequest request, HttpSession session, String checkNo) {
		
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			
			HashMap<String, String> paraMap = new HashMap<String, String>();

			paraMap.put("userNo", userNo);
			paraMap.put("checkNo", checkNo);
			
			int result = tService.deleteTodolist(paraMap);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);
			
			return jsonObj.toString();
		}
		
	// todolist 완료처리하기
		@ResponseBody
		@RequestMapping(value="completeTodolist.to", produces="application/json; charset=utf-8")
		public String completeTodolist(HttpServletRequest request, HttpSession session, String checkNo) {
		
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			
			HashMap<String, String> paraMap = new HashMap<String, String>();

			paraMap.put("userNo", userNo);
			paraMap.put("checkNo", checkNo);
			
			int result = tService.completeTodolist(paraMap);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);
			
			return jsonObj.toString();
		}
		
	//todolist 복구하기
		
		@ResponseBody
		@RequestMapping(value="restoreTodolist.to", produces="application/json; charset=utf-8")
		public String restoreTodolist(HttpServletRequest request, HttpSession session, String checkNo) {
		
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			HashMap<String, String> paraMap = new HashMap<String, String>();

			paraMap.put("userNo", userNo);
			paraMap.put("checkNo", checkNo);
			
			int result = tService. restoreTodolist(paraMap);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("result", result);
			
			return jsonObj.toString();
		}
	//todolist 수정하기
		
		@ResponseBody
		@RequestMapping(value="updateTodolist.to")
		public String updateTodolist(HttpServletRequest request, HttpSession session, Todolist to) {
		
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			to.setUserNo(userNo);
			
			System.out.println(to);
			int result = tService.updateTodolist(to);
			
			
			return result > 0 ? "success" : "fail";
	
		}
		
	//todolist 완료된 할일 삭제하기
		
		@RequestMapping(value="deleteComleteTodo.to")
		public String deleteComleteTodo(HttpServletRequest request, HttpSession session) {
		
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			int result = tService.deleteComleteTodo(userNo);
			
			
			return result > 0 ? "success" : "fail";
		
		
		}
		
	//memo select 해오기	
		
		@RequestMapping(value="memoSelect.to")
		public String memoSelect(HttpSession session, Model model) {
			
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			ArrayList<Memo> memo = tService.memoSelect(userNo);
			
			model.addAttribute("memo", memo);
			
			return "todo/memo";
		}
		
	
	//memo insert 하기
		@ResponseBody
		@RequestMapping(value="memoInsert.to")
		public String memoInsert(HttpServletRequest request, Model model,HttpSession session, Memo me) {
			
			//로그인한 사원번호
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			me.setUserNo(userNo);
			
			int result = tService.memoInsert(me);
			
			return result > 0 ? "success" : "fail";
			
		}
		
	
	// 메모 수정하기
		
		@ResponseBody
		@RequestMapping(value="memoUpdate.to")
		public String memoUpdate(HttpServletRequest request, Model model,HttpSession session, Memo me) {
			
			//로그인한 사원번호
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			me.setUserNo(userNo);
			
			int result = tService.memoUpdate(me);
			
			return result > 0 ? "success" : "fail";
			
		}
		
		
	// 메모 삭제하기
		
		@ResponseBody
		@RequestMapping(value="memoDelete.to")
		public String memoDelete(HttpServletRequest request, Model model,HttpSession session, Memo me) {
			
			//로그인한 사원번호
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			
			me.setUserNo(userNo);
			
			int result = tService.memoDelete(me);
			
			return result > 0 ? "success" : "fail";
			
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
