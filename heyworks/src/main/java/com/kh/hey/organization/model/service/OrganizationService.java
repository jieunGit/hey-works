package com.kh.hey.organization.model.service;

import java.util.ArrayList;

import com.kh.hey.organization.model.vo.Organ;

public interface OrganizationService {
	
	// 0. 부서 전체 갯수 조회
	ArrayList<Organ> selectDept();
	
	// 1. 전체 조직도 조회
	ArrayList<Organ> selectOrgan();
	
	// 2. 조직도 > 임직원 상세조회
	Organ selectEmployee(int userNo);
	
	// 3. 부서별 조직도 조회
	ArrayList<Organ> DeptOrgan(int deptCode);
	


}
