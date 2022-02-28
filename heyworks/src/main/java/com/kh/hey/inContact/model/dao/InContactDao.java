package com.kh.hey.inContact.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.inContact.model.vo.InContact;
import com.kh.hey.organization.model.vo.Organ;

@Repository
public class InContactDao {
	
	public ArrayList<InContact> selectGroup(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("inConMapper.selectGroup");
	}
	
	public ArrayList<Organ> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("organMapper.selectOrgan");
	}
	
	public int insertGroup(SqlSessionTemplate sqlSession, String inGroupName) {
		return sqlSession.insert("inConMapper.insertGroup", inGroupName);
	}
	
	public int insertInCon(SqlSessionTemplate sqlSession, InContact incon) {
		return sqlSession.insert("inConMapper.insertInCon", incon);
	}

}