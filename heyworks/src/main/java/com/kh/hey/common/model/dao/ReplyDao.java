package com.kh.hey.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.Reply;

@Repository
public class ReplyDao {

	public ArrayList<Reply> ajaxSelectReplyList(SqlSessionTemplate sqlSession, String ano){
		return (ArrayList)sqlSession.selectList("replyMapper.ajaxSelectReplyList", ano);
	}
	
	public int ajaxInsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("replyMapper.ajaxInsertReply", r);
	}
	
	public int ajaxDeleteReply(SqlSessionTemplate sqlSession, String replyNo) {
		return sqlSession.update("replyMapper.ajaxDeleteReply", replyNo);
	}
	
	public int ajaxUpdateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("replyMapper.ajaxUpdateReply", r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
