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
	
	//예약수정하기(update)
	int updateReservation(Reservation re);
	
	
	//예약취소하기(update)
	int deleteReservation(Reservation re);
	
	
	
	
}
