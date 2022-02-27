package com.kh.hey.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.vo.Message;
import com.kh.hey.organization.model.vo.Organ;

@Repository
public class MessageDao {
	
	public int countList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("messageMapper.countList", userNo);
	}
	
	public int countOutList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("messageMapper.countOutList", userNo);
	}
	
	public int countKeepList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("messageMapper.countKeepList", userNo);
	}
	
	public int countDelList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("messageMapper.countDelList", userNo);
	}
	
	public ArrayList<Message> listInMsg(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.listInMsg", userNo, rowBounds);
	}
	
	public Message detailInMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.selectOne("messageMapper.detailInMsg", m);
	}
	
	
	// 쪽지 삭제하기
	public int deleteInMsg(SqlSessionTemplate sqlSession, List<Integer> mNos) {
		
		int result =0;
		for(int i=0; i<mNos.size(); i++) {
			result = sqlSession.update("messageMapper.deleteInMsg", mNos.get(i));
		}
		return result;
		
	}
	
	// 쪽지 보관하기
	public int keepInMsg(SqlSessionTemplate sqlSession, List<Integer> mNos) {
		
		int result =0;
		for(int i=0; i<mNos.size(); i++) {
			result = sqlSession.update("messageMapper.keepInMsg", mNos.get(i));
		}
		return result;
		
	}
	
	public ArrayList<Message> searchInMsg(SqlSessionTemplate sqlSession, Message msg, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.searchInMsg", msg, rowBounds);
	}
	
	public int sentOutMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("messageMapper.sentOutMsg", m);
	}
	
	public int sentInMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("messageMapper.sentInMsg", m);
	}
	
	public ArrayList<Organ> searchKeyword(SqlSessionTemplate sqlSession, String userName) {
		return (ArrayList)sqlSession.selectList("organMapper.messageSerchEmployee", userName);
	}
	
	public ArrayList<Message> listOutMsg(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.listOutMsg", userNo, rowBounds);
	}
	
	public Message detailOutMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.selectOne("messageMapper.detailOutMsg", m);
	}
	
	public int deleteOutMsg(SqlSessionTemplate sqlSession, List<Integer> mNos) {
		
		int result =0;
		for(int i=0; i<mNos.size(); i++) {
			result = sqlSession.update("messageMapper.deleteOutMsg", mNos.get(i));
		}
		return result;
		
	}
	
	public ArrayList<Message> searchOutMsg(SqlSessionTemplate sqlSession, Message msg, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.searchOutMsg", msg, rowBounds);
	}
	
	public ArrayList<Message> listKeepMsg(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.listKeepMsg", userNo, rowBounds);
	}
	
	public ArrayList<Message> searchKeepMsg(SqlSessionTemplate sqlSession, Message msg, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.searchKeepMsg", msg, rowBounds);
	}
	
}
