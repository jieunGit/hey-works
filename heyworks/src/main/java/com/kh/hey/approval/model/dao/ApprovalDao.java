package com.kh.hey.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;

@Repository
public class ApprovalDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String userName) {
		
		return sqlSession.selectOne("approvalMapper.selectListCount", userName);
		
	} // 결재자 기준 결재대기 게시글 갯수 조회
	
	public ArrayList<Approval> selectStandByList(SqlSessionTemplate sqlSession, PageInfo pi, String userName){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectStandByList", userName, rowBounds);
		
	} // 결재자 기준 결재대기 게시글 페이징처리와 함께 조회
	
	public int selectSubmitListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("approvalMapper.selectSubmitListCount", map);
		
	} // 기안자 기준 결재대기, 결재예정 게시글 갯수 조회
	
	public ArrayList<Approval> selectSubmitStandByList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSubmitStandByList", map, rowBounds);
		
	} // 결재자 기준 결재대기 게시글 페이징처리와 함께 조회

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // end ApprovalDao
