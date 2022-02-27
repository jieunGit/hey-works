package com.kh.hey.working.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.working.model.dao.WorkingDao;
import com.kh.hey.working.model.vo.AllLeave;
import com.kh.hey.working.model.vo.Leave;
import com.kh.hey.working.model.vo.Working;

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
	public AllLeave selectMyleaveStatus(int userNo) {
		return wDao.selectMyleaveStatus(sqlSession, userNo);
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
	public AllLeave selectAleaveForm(int userNo) {
		return wDao.selectAleaveForm(sqlSession, userNo);
	}

	@Override
	public int updateLeaveStatus(AllLeave al) {
		return wDao.updateLeaveStatus(sqlSession, al);
	}

	@Override
	public ArrayList<Working> selectMyallStatus(Map<String, Object> map) {
		return wDao.selectMyallStatus(sqlSession, map);
	}

	// 관리자 근무현황 
	@Override
	public int selectAtnaListCount() {
		return wDao.selectAtnaListCount(sqlSession);
	}

	@Override
	public ArrayList<Working> selectAtnaList(PageInfo pi) {
		return wDao.selectAtnaList(sqlSession, pi);
	}

	@Override
	public int selectAtnaSearchCount(HashMap<String, String> map) {
		return wDao.selectAtnaSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Working> selectAtnaSearch(HashMap<String, String> map, PageInfo pi) {
		return wDao.selectAtnaSearch(sqlSession, map, pi);
	}

	@Override
	public int selectAleaveAppListCount() {
		return wDao.selectAleaveAppListCount(sqlSession);
	}

	@Override
	public ArrayList<Leave> selectAleaveAppList(PageInfo pi) {
		return wDao.selectAleaveAppList(sqlSession, pi);
	}

	@Override
	public Leave selectLeaveApplyForm(int leaveAno) {
		return wDao.selectLeaveApplyForm(sqlSession, leaveAno);
	}

	@Override
	public int updateApplyLeaveStatus(int leaveAno) {
		return wDao.updateApplyLeaveStatus(sqlSession, leaveAno);
	}

	@Override
	public int deleteApplyLeave(int leaveAno) {
		return wDao.deleteApplyLeave(sqlSession, leaveAno);
	}




}
