package com.kh.hey.todo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.todo.model.dao.todolistDao;
import com.kh.hey.todo.model.vo.Todolist;

@Service
public class todolistServcieImpl implements todolistService{
	
	@Autowired
	private todolistDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int todolistCount(String userNo) {
		
		return tDao.todolistCount(sqlSession, userNo);
	}
	@Override
	public ArrayList<Todolist> todolistSelect(String userNo) {
		
		return tDao.todolistSelect(sqlSession, userNo);
	}

	@Override
	public int todolistInsert(Todolist to) {
		
		return tDao.todolistInsert(sqlSession, to);
	}

	@Override
	public int deleteTodolist(HashMap<String, String> paraMap) {
		
		return tDao.deleteTodolist(sqlSession, paraMap);
	}

	@Override
	public int completeTodolist(HashMap<String, String> paraMap) {
		
		return tDao.completeTodolist(sqlSession, paraMap);
	}

	@Override
	public int restoreTodolist(HashMap<String, String> paraMap) {
		
		return tDao.restoreTodolist(sqlSession, paraMap);
	}
	@Override
	public int updateTodolist(Todolist to) {
		
		return tDao.updateTodolist(sqlSession, to);
	}

	

}
