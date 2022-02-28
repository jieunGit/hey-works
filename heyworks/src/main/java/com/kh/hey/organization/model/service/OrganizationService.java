package com.kh.hey.organization.model.service;

import java.util.ArrayList;

import com.kh.hey.common.model.vo.PageInfo;
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
	
	// 5. 관지라모드 임직원조회
	// 5-1. 부서별인원검색
	int adCountList(int dno);
	ArrayList<Organ> adminDeptOrgan(int dno, PageInfo pi);
	
	// 6. 사용자추가 요청
	// 6-1. Id유효성검사
	// 6-2. 사번유효성검사
	int insertOrgan(Organ o);
	int checkId(String id);
	int checkNo(int no);
	
	// 7. 사용자정보 수정요청
	int updateOrgan(Organ o);

}
