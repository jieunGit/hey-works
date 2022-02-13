package com.kh.hey.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;


public interface ApprovalService{
	
	// 1. 게시판 리스트 페이지(페이징처리)-결재자 기준(결재대기)
	int selectListCount(String userName);
	ArrayList<Approval> selectStandByList(PageInfo pi, String userName);
	
	// 1_1. 게시판 리스트 페이지(페이징처리)-기안자 기준(전체, 대기, 진행, 승인, 반려, 임시저장)
	int selectSubmitListCount(HashMap<String, String> map);
	
	// 1_1_1. 게시판 리스트-기안자 기준(전체, 대기, 진행)
	ArrayList<Approval> selectSubmitStandByList(PageInfo pi, HashMap<String, String> map);
	
	// 1_1_2. 게시판 리스트-기안자 기준(승인, 반려, 임시저장)
	ArrayList<Approval> selectSubmitEndList(PageInfo pi, HashMap<String, String> map);
	
	// 2. 게시글 상세조회
	Approval selectApproval(String ano, String formNo);
	
	// 2. 전자결재 공통 게시글 작성하기
	int insertElectronic(Approval a);
	
	// 2-1. 전자결재 업무기안서 작성
	int insertBusinessDraft(Approval a);
	
	// 2-2. 비품구매품의서
	int insertEquipmentBuy(Approval a);
	
	// 2-2-1. 구매비품목록
	int insertItemList(Approval a);
	
	// 2-3. 증명서 신청
	int insertCertificate(Approval a);
	
	// 2-4. 채용요청서
	int insertRecruiment(Approval a);
	
	// 2-5. 일반품의서
	int insertExpenseReport(Approval a);
	
	
	// 3-1. 참조/열람여부 확인(클릭시 update)
	int updateReadReferenceStatus(String read, String reference);
	
	// 4. 전자결재 공통 수정
	int updateElectronic(String approvalNo);
	
	// 4-1. 업무기안서
	int updateBusinessDraft(String approvalNo);
	
	// 4-2. 비품구매품의서
	int updateEquipmentBuy(String approvalNo);
	
	// 4-2-1. 구매비품목록
	int updateItemList(String approvalNo);
	
	// 4-3. 증명서 신청
	int updateCertificate(String approvalNo);
	
	// 4-4. 채용요청서
	int updateRecruiment(String approvalNo);
	
	// 4-5. 일반품의서
	int updateExpenseReport(String approvalNo);
	
	// 5. 전자결재 공통 수정
	int deleteElectronic(String approvalNo);
		
	// 5-1. 업무기안서
	int deleteBusinessDraft(String approvalNo);
	
	// 5-2. 비품구매품의서
	int deleteEquipmentBuy(String approvalNo);
	
	// 5-2-1. 구매비품목록
	int deleteItemList(String approvalNo);
	
	// 5-3. 증명서 신청
	int deleteCertificate(String approvalNo);
	
	// 5-4. 채용요청서
	int deleteRecruiment(String approvalNo);
	
	// 5-5. 일반품의서
	int deleteExpenseReport(String approvalNo);
	
	
	
	
	
}
