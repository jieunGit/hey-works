package com.kh.hey.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.employee.model.vo.Employee;


@Repository
public class EmployeeDao {
	
	public Employee loginEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.selectOne("employeeMapper.loginEmployee", e);
	}
	
	
	/**
	 * @author NURI
	 * @param sqlSession
	 * @param num
	 * @return ArrayList<Employee>
	 */
	public ArrayList<Employee> ajaxSelectEmployeeList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map){
		
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectEmployeeList", map);
		
		
	} // 전자결재 결재자용 사원조회
	
	public ArrayList<Employee> selectDeptList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectDeptList");
		
	} // 전자결재 인서트용 팀 조회
	
	public ArrayList<Employee> ajaxSelectSearchConfirm(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectSearchConfirm", keyword);
	} // 전자결재 결재자 검색용
	
	
	
	
	
	
	
	
	
	
	
	
	

}
