package com.kh.hey.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.employee.model.vo.Employee;


@Repository
public class EmployeeDao {
	
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		System.out.println("dao");
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}

}
