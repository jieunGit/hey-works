package com.kh.hey.organization.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
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
	
	public Organ detailEmployee(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("organMapper.detailEmployee", userNo);
	}
	
	public int adCountList(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("organMapper.adCountList", dno);
	}
	
	public ArrayList<Organ> adminDeptOrgan(SqlSessionTemplate sqlSession, int dno, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("organMapper.adminDeptOrgan", dno, rowBounds);
		
	}
	
	public int insertOrgan(SqlSessionTemplate sqlSession, Organ o) {
		return sqlSession.insert("organMapper.insertOrgan", o);
	}
	
	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("organMapper.checkId", id);
	}
	
	public int checkNo(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("organMapper.checkNo", no);
	}
	
	public int updateOrgan(SqlSessionTemplate sqlSession, Organ o) {
		return sqlSession.update("organMapper.updateOrgan", o);
	}
	

}
