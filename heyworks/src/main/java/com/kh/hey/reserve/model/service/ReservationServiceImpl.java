package com.kh.hey.reserve.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.reserve.model.dao.ReservationDao;
import com.kh.hey.reserve.model.vo.Reservation;



@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public Reservation myReserveList(Reservation re) {
		
		return null;
	}

	@Override
	public int insertReservation(Reservation re) {
		
		return 0;
	}

	@Override
	public int updateReservation(Reservation re) {
		
		return 0;
	}

	@Override
	public int deleteReservation(Reservation re) {
		
		return 0;
	}


	

}