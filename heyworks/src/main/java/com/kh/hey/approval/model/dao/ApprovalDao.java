package com.kh.hey.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	public int selectListCount(String status, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("approvalMapper.selectListCount");
		
	} // 게시글 갯수 조회
	
	public ArrayList<Approval> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String status){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectList", null, rowBounds);
		
	} // 게시글 페이징처리 조회
	
	

}
