package com.kh.hey.reserve.model.service;

import com.kh.hey.reserve.model.vo.Reservation;

public interface ReservationService {
	
	//나의 예약목록 조회(select)
	Reservation myReserveList(Reservation re);
	
	
	//예약하기(insert)
	int insertReservation(Reservation re);

	
	//예약수정하기(update)
	int updateReservation(Reservation re);
	
	
	//예약취소하기(update)
	int deleteReservation(Reservation re);
	
	
	
	
}
