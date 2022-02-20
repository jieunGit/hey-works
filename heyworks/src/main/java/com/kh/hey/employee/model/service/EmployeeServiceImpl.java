package com.kh.hey.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.employee.model.dao.EmployeeDao;
import com.kh.hey.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Employee loginEmployee(Employee e) {
		Employee loginUser = eDao.loginEmployee(sqlSession, e);
		return loginUser;
		
	}

	/**
	 * @author NURI
	 */
	@Override
	public ArrayList<Employee> ajaxSelectEmployeeList(HashMap<String, Integer> map) {
		
		return eDao.ajaxSelectEmployeeList(sqlSession, map);
		
	} // 전자결재 결재자용 사원조회

	@Override
	public ArrayList<Employee> selectDeptList() {
		
		return eDao.selectDeptList(sqlSession);
		
	} // 전자결재 인서트용

	@Override
	public ArrayList<Employee> ajaxSelectSearchConfirm(String keyword) {
		return eDao.ajaxSelectSearchConfirm(sqlSession, keyword);
	} // 전자결재 결재자 검색용
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
