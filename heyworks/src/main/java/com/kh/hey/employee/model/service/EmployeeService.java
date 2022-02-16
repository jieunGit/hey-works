package com.kh.hey.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hey.employee.model.vo.Employee;

public interface EmployeeService {
	Employee loginEmployee(Employee e);
	
	// 전자결재용
	ArrayList<Employee> ajaxSelectEmployeeList(HashMap<String, Integer> map);
	ArrayList<Employee> selectDeptList();
	
	
	
	
}
