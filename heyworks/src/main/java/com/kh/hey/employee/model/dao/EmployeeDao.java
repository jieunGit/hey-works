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
	
	
	
	public ArrayList<Employee> ajaxSelectEmployeeList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map){
		
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectEmployeeList", map);
		
		
	} // 전자결재 결재자용 사원조회
	
	public ArrayList<Employee> selectDeptList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectDeptList");
		
	} // 전자결재 인서트용 팀 조회
	
	public ArrayList<Employee> ajaxSelectSearchConfirm(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxSelectSearchConfirm", keyword);
	} // 전자결재 결재자 검색용
	
	public ArrayList<Employee> selectAdminList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAdminList");
	}
	
	public ArrayList<Employee> ajaxAdminSearchSelect(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("employeeMapper.ajaxAdminSearchSelect");
	} // 전자결재 관리자 검색용
	
	public int deleteAdmin(SqlSessionTemplate sqlSession, String[] adNo) {
		int result = 0;
		
		for(int i=0; i<adNo.length; i++) {
			result = sqlSession.update("employeeMapper.deleteAdmin", adNo[i]);
		}
		
		return result;
		
	} // 관리자 해제하기
	
	
	public int updateEmployee(SqlSessionTemplate sqlSession, Employee e) {
		return sqlSession.update("employeeMapper.updateEmployee", e);
	} // 회원정보수정
	
	
	
	
	
	
	
	
	
	

}
