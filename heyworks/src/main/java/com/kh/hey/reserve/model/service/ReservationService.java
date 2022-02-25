package com.kh.hey.reserve.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.reserve.model.vo.Reservation;
import com.kh.hey.reserve.model.vo.Resources;
import com.kh.hey.reserve.model.vo.ResourcesCategory;

public interface ReservationService {
	
	//자원 카테고리 조회
	ArrayList<ResourcesCategory> MenuCategoryList();
	
	//자원 조회
	ArrayList<Resources> menuResourceList();
	
	//나의 예약목록 조회(select)
	int selectListCount(String userNo);
	ArrayList<Reservation> myReserveList(PageInfo pi, String userNo);
	
	
	//카테고리 정보
	ResourcesCategory categoryInfo(int categoryNo);
	
	//카테고리별 자원list 조회
	ArrayList<Resources> resourceList(int categoryNo);
	
	
	// 예약정보 불러오기(회원번호, 자원번호로 검색)
	ArrayList<Reservation> selectRsvList(Map<String, String> paraMap);
	
	// 입력받은 일시가 중복된 날짜인지 검사
	int checkOverlapRsv(HashMap<String, String> paraMap);
	
	//예약하기(insert)
	int insertReservation(HashMap<String, String> paraMap);
	
	//예약 상세보기
	Reservation readDetailRsvList(String reserveNo);
	
	
	//예약 취소하기
	int rsvCancel(HashMap<String, String> paraMap);
	
	
	// 관리자 카레고리 list 
	ArrayList<ResourcesCategory> admincateogryList();
	
	//관리자- 모달창 카레고리명 추가
	int  adminInsertCategory(String categoryName);
	
	//관리자 - 카테고리 삭제
	int adminCategoryDelete(String categoryNo);
	
	//관리자 - 카테고리 이용안내문 수정
	int updateCategoryContent(HashMap<String, String> paraMap);
	
	//관리자 - 카테고리 자원 추가
	int resourceInsert(Resources rs);
	
	// 관리자 - 카테고리 자원 수정하기 페이지
	Resources ResourceUpdateForm(HashMap<String, String> paraMap);
	
	// 관리자 - 카테고리 자원 수정하기
	int ResourceUpdate(Resources rs);
	
	//관리자 - 카테고리 자원 삭제하기
	int  deleteResource(HashMap<String, String> paraMap);
}
