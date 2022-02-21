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
	
	int selectReadNrefListCount(String userNo);
	ArrayList<Approval> selectReadReference(PageInfo rrpi, String userNo);
	
	// 2. 모든 양식 게시글 양식종류~결재자까지 상세조회
	Approval selectApproval(String ano);
	
	// 2_1. 상세보기
	Approval selectBusinessDraft(String ano);
	
	Approval selectEquipmentBuy(String ano);
	
	Approval selectCertificate(String ano);
	
	Approval selectRecruiment(String ano);
	
	Approval selectExpenseReport(String ano);
	
	// 3. 작성하기
	// 공통테이블(전자결재 + 결재자)
	int insertApproval(Approval ap);
	int insertConfirm(ArrayList<Approval> confirmList);
	
	// 증명서 신청, 채용요청서, 일반품의서, 업무기안서, 비품구매확인서
	int insertCertificate(Approval ap);
	int insertRecruiment(Approval ap);
	int insertExpenseReport(Approval ap);
	int insertBusinessDraft(Approval ap);
	
	int insertEquipmentBuy(Approval ap);
	int insertItemList(ArrayList<Approval> itemList);
	
	// 4. 삭제하기(기안취소)
	int deleteApproval(String ano);
	
	// 5. 승인하기
	// 결재자 순번 알아오기
	int selectConfirmProcedure(HashMap<String,String> map);
	
	// 첫번째 결재자일때
	int updateConfirmTable(HashMap<String,String> map);
	int updateConfirmApproval(HashMap<String,String> map);
	
	// 마지막 결재자일때
	int selectConfirmPeopleCount(String ano);
	int updateLastConfirm(String ano);
	
	// 6. 반려하기
	int updateConfirmReject(HashMap<String, String> map);

	// 수정하기
	int updateApproval(Approval ap); // 공통테이블 업데이트
	int deleteConfirm(String ano); // 결제자 전체삭제
	
	int updateBusinessDraft(Approval ap); // 업무기안서 업데이트
	
	int updateEquipmentBuy(Approval ap); // 비품구매 업데이트
	int deleteItemList(String ano); // 기존 아이템 삭제
	
	int updateCertificate(Approval ap);
	int updateRecruiment(Approval ap); 
	int updateExpenseReport(Approval ap);
	
	
	
	
	//-----------------------------------------------------------
	// 관리자 삭제목록조회
	int selectDeleteListCount();
	ArrayList<Approval> selectDeleteList(PageInfo pi);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
