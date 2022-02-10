package com.kh.hey.employee.model.service;

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
		System.out.println("impl");
		Employee loginUser = eDao.loginEmployee(sqlSession, e);
		return loginUser;
		
	}
	

}
