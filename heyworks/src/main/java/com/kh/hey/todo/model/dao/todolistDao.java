package com.kh.hey.todo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.todo.model.vo.Todolist;

@Repository
public class todolistDao {
	
	public int todolistCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("todolistMapper.todolistCount", userNo);
	}
	
	public ArrayList todolistSelect(SqlSessionTemplate sqlSession, String userNo ) {
		
		return (ArrayList)sqlSession.selectList("todolistMapper.todolistSelect", userNo);
		
	}
	public int todolistInsert(SqlSessionTemplate sqlSession, Todolist to) {
		return sqlSession.insert("todolistMapper.todolistInsert", to);
	}
	
	public int deleteTodolist(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.delete("todolistMapper.deleteTodolist", paraMap);
	}
	
	public int completeTodolist(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.update("todolistMapper.completeTodolist", paraMap);
	}
	public int restoreTodolist(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.update("todolistMapper.restoreTodolist", paraMap);
	}
	
	public int updateTodolist(SqlSessionTemplate sqlSession, Todolist to) {
		return sqlSession.update("todolistMapper.updateTodolist", to);
	}
}
