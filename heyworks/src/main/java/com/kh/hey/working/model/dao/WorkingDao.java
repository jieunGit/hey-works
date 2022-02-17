package com.kh.hey.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class WorkingDao {

	public int insertClockIn(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.insert("workingMapper.insertClockIn", userNo);
	}
	
	public int updateClockOut(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("workingMapper.updateClockOut", userNo);
	}
}
