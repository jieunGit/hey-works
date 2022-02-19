package com.kh.hey.organization.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.organization.model.vo.Organ;

@Repository
public class OrganizationDao {
	
	public ArrayList<Organ> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("organMapper.selectDept");
	}
	
	public ArrayList<Organ> selectOrgan(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("organMapper.selectOrgan");
	}
	
	public ArrayList<Organ> deptOrgan(SqlSessionTemplate sqlSession, int dno) {
		return (ArrayList)sqlSession.selectList("organMapper.deptOrgan", dno);
	}
	
	public Organ selectDeptName(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("organMapper.selectDeptName", dno);
	}
	
	public ArrayList<Organ> selectEmployee(SqlSessionTemplate sqlSession, String userName) {
		return (ArrayList)sqlSession.selectList("organMapper.selectEmployee", userName);
	}

}
