package com.kh.hey.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.dao.MessageDao;
import com.kh.hey.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao msgDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countList(int userNo) {
		return msgDao.countList(sqlSession, userNo);
	}

	@Override
	public ArrayList<Message> listInMsg(int userNo, PageInfo pi) {
		return msgDao.listInMsg(sqlSession, userNo, pi);
	}

	@Override
	public Message detailInMsg(int mno) {
		return msgDao.detailInMsg(sqlSession, mno);
	}

	@Override
	public int deleteInMsg(int inMsgNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int keepInMsg(int inMsgNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Message> searchInMsg(Message msg) {
		return msgDao.searchInMsg(sqlSession, msg);
	}

	@Override
	public int replyMsg() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sentMsg() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
