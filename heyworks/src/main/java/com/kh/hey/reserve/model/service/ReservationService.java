package com.kh.hey.reserve.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.reserve.model.vo.Reservation;
import com.kh.hey.reserve.model.vo.Resources;
import com.kh.hey.reserve.model.vo.ResourcesCategory;

public interface ReservationService {
	
	//자원 카테고리 조회
	ArrayList<ResourcesCategory> MenuCategoryList();

	//나의 예약목록 조회(select)
	int selectListCount(String userNo);
	ArrayList<Reservation> myReserveList(PageInfo pi, String userNo);
	
	
	//카테고리 정보
	ResourcesCategory categoryInfo(int categoryNo);
	
	//카테고리별 자원list 조회
	ArrayList<Resources> resourceList(int categoryNo);
	
	
	// 예약정보 불러오기(회원번호, 자원번호로 검색)
	ArrayList<Reservation> selectRsvList(Map<String, String> paraMap);
	
	//예약하기(insert)
	int insertReservation(Reservation re);

	
	//예약수정하기(update)
	int updateReservation(Reservation re);
	
	
	//예약취소하기(update)
	int deleteReservation(Reservation re);
	
	
	
	
}
