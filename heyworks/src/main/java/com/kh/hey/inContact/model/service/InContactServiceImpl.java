package com.kh.hey.inContact.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.inContact.model.dao.InContactDao;
import com.kh.hey.inContact.model.vo.InContact;
import com.kh.hey.organization.model.vo.Organ;

@Service
public class InContactServiceImpl implements InContactService  {
	
	@Autowired
	private InContactDao inDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<InContact> selectGroup() {
		return inDao.selectGroup(sqlSession);
	}
	
	@Override
	public ArrayList<Organ> selectDept() {
		return inDao.selectDept(sqlSession);
	}
	
	@Override
	public int insertGroup(String inGroupName) {
		return inDao.insertGroup(sqlSession, inGroupName);
	}

	@Override
	public int insertInCon(InContact incon) {
		return inDao.insertInCon(sqlSession, incon);
	}

	


}