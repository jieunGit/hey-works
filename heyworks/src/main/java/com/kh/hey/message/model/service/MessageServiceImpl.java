package com.kh.hey.message.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.dao.MessageDao;
import com.kh.hey.message.model.vo.Message;
import com.kh.hey.organization.model.vo.Organ;

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
	public int countOutList(int userNo) {
		return msgDao.countOutList(sqlSession, userNo);
	}
	
	@Override
	public int countKeepList(int userNo) {
		return msgDao.countKeepList(sqlSession, userNo);
	}

	@Override
	public int countDelList(int userNo) {
		return 0;
	}

	@Override
	public ArrayList<Message> listInMsg(int userNo, PageInfo pi) {
		return msgDao.listInMsg(sqlSession, userNo, pi);
	}

	@Override
	public Message detailInMsg(Message m) {
		return msgDao.detailInMsg(sqlSession, m);
	}

	@Override
	public int deleteInMsg(List<Integer> mNos) {
		return msgDao.deleteInMsg(sqlSession, mNos);
	}

	@Override
	public int keepInMsg(List<Integer> mNos) {
		return msgDao.keepInMsg(sqlSession, mNos);
	}

	@Override
	public ArrayList<Message> searchInMsg(Message msg, PageInfo pi) {
		return msgDao.searchInMsg(sqlSession, msg, pi);
	}

	@Override
	public int sentOutMsg(Message m) {
		return msgDao.sentOutMsg(sqlSession, m);
	}
	
	@Override
	public int sentInMsg(Message m) {
		return msgDao.sentInMsg(sqlSession, m);
	}
	
	@Override
	public ArrayList<Organ> searchKeyword(String userName) {
		return msgDao.searchKeyword(sqlSession, userName);
	}

	@Override
	public ArrayList<Message> listOutMsg(int userNo, PageInfo pi) {
		return msgDao.listOutMsg(sqlSession, userNo, pi);
	}

	@Override
	public Message detailOutMsg(Message m) {
		return msgDao.detailOutMsg(sqlSession, m);
	}

	@Override
	public int deleteOutMsg(List<Integer> mNos) {
		return msgDao.deleteOutMsg(sqlSession, mNos);
	}

	@Override
	public ArrayList<Message> searchOutMsg(Message msg, PageInfo pi) {
		return msgDao.searchOutMsg(sqlSession, msg, pi);
	}

	@Override
	public ArrayList<Message> listKeepMsg(int userNo, PageInfo pi) {
		return msgDao.listKeepMsg(sqlSession, userNo, pi);
	}

	@Override
	public ArrayList<Message> searchKeepMsg(Message msg, PageInfo pi) {
		return msgDao.searchKeepMsg(sqlSession, msg, pi);
	}

	

	

	
	
	
}
