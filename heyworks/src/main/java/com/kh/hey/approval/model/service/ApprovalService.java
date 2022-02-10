package com.kh.hey.approval.model.service;

import java.util.ArrayList;



import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;


public interface ApprovalService{
	
	// 1. 게시판 리스트 페이지(페이징처리)
	int selectListCount(String status);
	ArrayList<Approval> selectList(PageInfo pi, String status);
	
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
	
	// 3. 게시글 상세조회
	Approval selectElectronic(String approvalNo);
	
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
