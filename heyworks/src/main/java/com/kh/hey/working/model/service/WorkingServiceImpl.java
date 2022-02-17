package com.kh.hey.working.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.working.model.dao.WorkingDao;

@Service
public class WorkingServiceImpl implements WorkingService {

	@Autowired
	private WorkingDao wDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertClockIn(int userNo) {
		return wDao.insertClockIn(sqlSession, userNo);
	}

	@Override
	public int insertClockOut(int userNo) {
		return wDao.insertClockOut(sqlSession, userNo);
	}

}
