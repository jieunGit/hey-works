package com.kh.hey.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.vo.Message;

@Repository
public class MessageDao {
	
	public int countList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("messageMapper.countList", userNo);
	}

	public ArrayList<Message> listInMsg(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.listInMsg", userNo, rowBounds);
	}
	
	public Message detailInMsg(SqlSession sqlSession, int mno) {
		return sqlSession.selectOne("messageMapper.detailInMsg", mno);
	}
	
	
	// 쪽지 삭제하기
	
	// 쪽지 보관하기
	
	public ArrayList<Message> searchInMsg(SqlSessionTemplate sqlSession, Message msg) {
		return (ArrayList)sqlSession.selectList("messageMapper.searchInMsg", msg);
	}
	
}
