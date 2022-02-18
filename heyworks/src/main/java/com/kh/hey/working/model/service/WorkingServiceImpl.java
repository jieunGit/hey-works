package com.kh.hey.working.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.working.model.dao.WorkingDao;
import com.kh.hey.working.model.vo.Leave;

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
	public int updateClockOut(int userNo) {
		return wDao.updateClockOut(sqlSession, userNo);
	}

	@Override
	public int insertLeave(Leave l) {
		return wDao.insertLeave(sqlSession, l);
	}

}
