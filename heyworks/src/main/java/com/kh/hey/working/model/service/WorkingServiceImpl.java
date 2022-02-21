package com.kh.hey.working.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.working.model.dao.WorkingDao;
import com.kh.hey.working.model.vo.AllLeave;
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

	@Override
	public ArrayList<Leave> selectMyleave(int userNo) {
		return wDao.selectMyleave(sqlSession, userNo);
	}

	// 관리자 - 휴가현황 관련 
	@Override
	public int selectAleaveListCount() {
		return wDao.selectAleaveListCount(sqlSession);
	}

	@Override
	public ArrayList<AllLeave> selectAleaveList(PageInfo pi) {
		return wDao.selectAleaveList(sqlSession, pi);
	}

	@Override
	public int selectAleaveSearchCount(HashMap<String, String> map) {
		return wDao.selectAleaveSearchCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<AllLeave> selectAleaveSearch(HashMap<String, String> map, PageInfo pi) {
		return wDao.selectAleaveSearch(sqlSession, map, pi);
	}
	
	@Override
	public int updateAleave(Leave l) {
		return 0;
	}





}
