package com.kh.hey.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class WorkingDao {

	public int insertClockIn(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.insert("workingMapper.insertClockIn", userNo);
	}
	
	public int insertClockOut(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.insert("workingMapper.insertClockOut", userNo);
	}
}
