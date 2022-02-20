package com.kh.hey.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.dao.ReplyDao;
import com.kh.hey.common.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Reply> ajaxSelectReplyList(String ano) {
		return rDao.ajaxSelectReplyList(sqlSession, ano);
	}

	@Override
	public int ajaxInsertReply(Reply r) {
		return rDao.ajaxInsertReply(sqlSession, r);
	}

	@Override
	public int ajaxDeleteReply(String replyNo) {
		return rDao.ajaxDeleteReply(sqlSession, replyNo);
	}

	@Override
	public int ajaxUpdateReply(Reply r) {
		return rDao.ajaxUpdateReply(sqlSession, r);
	}

}
