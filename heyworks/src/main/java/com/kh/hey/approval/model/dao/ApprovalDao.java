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
	
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("approvalMapper.selectListCount", map);
		
	} // 게시글 갯수 조회
	
	public ArrayList<Approval> selectStandByList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println(rowBounds);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectStandByList", map, rowBounds);
		
	} // 게시글 페이징처리 조회
	
	

}
