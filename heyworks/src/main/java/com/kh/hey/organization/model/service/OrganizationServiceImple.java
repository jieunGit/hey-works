package com.kh.hey.organization.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.organization.model.dao.OrganizationDao;
import com.kh.hey.organization.model.vo.Organ;

@Service
public class OrganizationServiceImple implements OrganizationService {

	@Autowired
	private OrganizationDao orDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Organ> selectDept() {
		return orDao.selectDept(sqlSession);
	}
	
	@Override
	public ArrayList<Organ> selectOrgan() {
		return orDao.selectOrgan(sqlSession);
	}
	
	@Override
	public ArrayList<Organ> deptOrgan(int dno) {
		return orDao.deptOrgan(sqlSession, dno);
	}
	
	@Override
	public Organ selectDeptName(int dno) {
		return orDao.selectDeptName(sqlSession, dno);
	}


	@Override
	public ArrayList<Organ> selectEmployee(String userName) {
		return orDao.selectEmployee(sqlSession, userName);
	}

	

	

}
