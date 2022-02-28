package com.kh.hey.working.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.working.model.vo.AllLeave;
import com.kh.hey.working.model.vo.Leave;
import com.kh.hey.working.model.vo.Working;

public interface WorkingService {

	// 출근시간 insert
	int insertClockIn(int userNo);
	
	// 퇴근시간 update
	int updateClockOut(int userNo);
	
	// 휴가신청 insert
	int insertLeave(Leave l);
	
	// 개인 휴가현황 select
	AllLeave selectMyleaveStatus(int userNo);
	
	// 휴가신청내역 select
	ArrayList<Leave> selectMyleave(int userNo);
	
	// 근태/휴가 현황 select 
	ArrayList<Working> selectMyallStatus(Map<String, Object> map);
	
	
	// 관리자
	
	// 전사 휴가현황 리스트 페이지 (페이징)
	int selectAleaveListCount();
	ArrayList<AllLeave> selectAleaveList(PageInfo pi);
	
	// 전사 휴가현황 검색 
	int selectAleaveSearchCount(HashMap<String, String> map);
	ArrayList<AllLeave> selectAleaveSearch(HashMap<String, String> map, PageInfo pi);
	
	// 전사 휴가현황 수정폼
	AllLeave selectAleaveForm(int userNo);
	
	// 전사 휴가현황 수정용 서비스 update
	int updateLeaveStatus(AllLeave al);
	
	// 전사 근무현황 리스트 페이지 (페이징)
	int selectAtnaListCount();
	//ArrayList<Working> selectAtnaList(PageInfo pi);
	ArrayList<Working> selectAtnaList(PageInfo pi);

	// 전사 근무현황 검색 
	int selectAtnaSearchCount(HashMap<String, String> map);
	ArrayList<Working> selectAtnaSearch(HashMap<String, String> map, PageInfo pi);
	
	// 전사 휴가신청 리스트 페이지
	int selectAleaveAppListCount();
	ArrayList<Leave> selectAleaveAppList(PageInfo pi);
	
	// 전사 휴가신청 상태 수정폼
	Leave selectLeaveApplyForm(int leaveAno);
	
	// 휴가신청 상태 변경
	int updateApplyLeaveStatus(int leaveAno);
	
	// 휴가신청 삭제
	int deleteApplyLeave(int leaveAno);
	
	// 전사 근무현황 상세 (수정폼)
	Working selectAtnaForm(int userNo);
	
	// 전사 근태현황 수정 update
	int updateTnaUpdate(Working w);
}
