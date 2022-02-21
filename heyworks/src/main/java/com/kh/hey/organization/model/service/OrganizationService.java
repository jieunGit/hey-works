package com.kh.hey.organization.model.service;

import java.util.ArrayList;

import com.kh.hey.organization.model.vo.Organ;

public interface OrganizationService {
	
	// 1. 전체 조직도 조회
	// 1-1. 전체 부서 조회
	ArrayList<Organ> selectOrgan();
	ArrayList<Organ> selectDept();
	
	// 2. 부서별 조직도 조회
	// 2-1. 선택한 부서 조회
	Organ selectDeptName(int dno);
	ArrayList<Organ> deptOrgan(int dno);
	
	// 3. 임직원 검색
	ArrayList<Organ> selectEmployee(String userName);
	
	// 4. 임직원 상세조회
	Organ detailEmployee(int userNo);
	
	


}
