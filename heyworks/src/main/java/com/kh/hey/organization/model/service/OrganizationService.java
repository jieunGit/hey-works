package com.kh.hey.organization.model.service;

import java.util.ArrayList;

import com.kh.hey.organization.model.vo.Organ;

public interface OrganizationService {
	
	// 0. 부서 전체 갯수 조회
	ArrayList<Organ> selectDept();
	
	// 1. 전체 조직도 조회
	ArrayList<Organ> selectOrgan();
	
	// 3. 부서별 조직도 조회
	// 3-1. 선택한 부서 조회
	Organ selectDeptName(int dno);
	ArrayList<Organ> deptOrgan(int dno);
	
	// 3. 조직도 > 임직원 상세조회
	ArrayList<Organ> selectEmployee(String userName);
	
	
	


}
