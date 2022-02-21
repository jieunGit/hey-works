package com.kh.hey.todo.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.reserve.model.dao.ReservationDao;

@Service
public class todolistServcieImpl {
	
	@Autowired
	private ReservationDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
