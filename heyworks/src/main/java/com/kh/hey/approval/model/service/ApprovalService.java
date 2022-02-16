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
	
	
}
