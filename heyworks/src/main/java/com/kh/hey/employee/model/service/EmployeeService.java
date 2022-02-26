package com.kh.hey.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hey.employee.model.vo.Employee;

public interface EmployeeService {
	Employee loginEmployee(Employee e);
	
	// 전자결재용
	ArrayList<Employee> ajaxSelectEmployeeList(HashMap<String, Integer> map);
	ArrayList<Employee> selectDeptList();
	ArrayList<Employee> ajaxSelectSearchConfirm(String keyword);
	
	// 전자결재 관리자 조회
	ArrayList<Employee> selectAdminList();
	ArrayList<Employee> ajaxAdminSearchSelect(HashMap<String, String> map);
	
	// 관리자 해제하기
	int deleteAdmin(String[] adNo);
	
	// 관리자 등록하기
	int approvalAdminUpdate(String uno);
	
	// 회원정보수정
	int updateEmployee(Employee e);
	
	// 초기 비밀번호 입력시 비번 변경
	int updatePassword(HashMap<String,String> map);
	
}
