package com.kh.hey.working.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.working.model.vo.AllLeave;
import com.kh.hey.working.model.vo.Leave;
import com.kh.hey.working.model.vo.Working;

@Repository
public class WorkingDao {

	public int insertClockIn(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.insert("workingMapper.insertClockIn", userNo);
	}
	
	public int updateClockOut(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("workingMapper.updateClockOut", userNo);
	}
	
	public int insertLeave(SqlSessionTemplate sqlSession, Leave l) {
		
		return sqlSession.insert("workingMapper.insertLeave", l);
	}
	
	public AllLeave selectMyleaveStatus(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("workingMapper.selectMyleaveStatus", userNo);
	}
	
	public ArrayList<Leave> selectMyleave(SqlSessionTemplate sqlSession, int userNo){
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectMyleave", userNo);
	}
	
	public int selectAleaveListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("workingMapper.selectAleaveListCount");
	}
	
	public ArrayList<AllLeave> selectAleaveList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectAleaveList", null, rowBounds);
	}
	
	public int selectAleaveSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("workingMapper.selectAleaveSearchCount", map);
	}
	
	public ArrayList<AllLeave> selectAleaveSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectAleaveSearch", map, rowBounds);
	}
	
	public AllLeave selectAleaveForm(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("workingMapper.selectAleaveForm", userNo);
	}
	
	public int updateLeaveStatus(SqlSessionTemplate sqlSession, AllLeave al) {
		return sqlSession.update("workingMapper.updateLeaveStatus", al);
	}
	
	public ArrayList<Working> selectMyallStatus(SqlSessionTemplate sqlSession, Map<String, Object> map){
		return (ArrayList)sqlSession.selectList("workingMapper.selectMyallStatus", map);
	}
	
	public int selectAtnaListCount(SqlSessionTemplate sqlSession) {
		//System.out.println(map);
		return sqlSession.selectOne("workingMapper.selectAtnaListCount");
	}
	
	
	public ArrayList<Working> selectAtnaList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectAtnaList", rowBounds);
	}
	
	public int selectAtnaSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("workingMapper.selectAtnaSearchCount", map);
	}
	
	public ArrayList<Working> selectAtnaSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectAtnaSearch", map, rowBounds);
	}

	public int selectAleaveAppListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("workingMapper.selectAleaveAppListCount");
	}
	
	public ArrayList<Leave> selectAleaveAppList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("workingMapper.selectAleaveAppList", null, rowBounds);
	}
	
	public Leave selectLeaveApplyForm(SqlSessionTemplate sqlSession, int leaveAno) {
		return sqlSession.selectOne("workingMapper.selectLeaveApplyForm", leaveAno);
	}
	
	public int updateApplyLeaveStatus(SqlSessionTemplate sqlSession, int leaveAno) {
		return sqlSession.update("workingMapper.updateApplyLeaveStatus", leaveAno);
	}
	
	public int deleteApplyLeave(SqlSessionTemplate sqlSession, int leaveAno) {
		return sqlSession.delete("workingMapper.deleteApplyLeave", leaveAno);
	}
}
