package com.kh.hey.todo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hey.todo.model.vo.Todolist;

public interface todolistService {

	//해야할일 카운팅하기
	int todolistCount(String userNo);
	//todolist 조회하기
	ArrayList<Todolist> todolistSelect(String userNo);
	
	//todolist 입력하기
	int todolistInsert(Todolist to);
	
	//todolist 삭제하기
	int deleteTodolist(HashMap<String, String> paraMap);
	//todolist 완료바꾸기
	int completeTodolist(HashMap<String, String> paraMap);
	
	//todolist 복구하기
	int  restoreTodolist(HashMap<String, String> paraMap);
	
	//todolist 수정하기
	int updateTodolist(Todolist to);
}
