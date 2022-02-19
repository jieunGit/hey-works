package com.kh.hey.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.working.model.vo.Leave;

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
}
