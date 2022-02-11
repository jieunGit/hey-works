package com.kh.hey.reserve.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.reserve.model.dao.ReservationDao;
import com.kh.hey.reserve.model.vo.Reservation;



@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	//페이징 예약수 알아오기
	@Override
	public int selectListCount(Employee loginUser) {
	
		return rDao.selectListCount(sqlSession, loginUser);
	}
	
	@Override
	public ArrayList<Reservation> myReserveList(PageInfo pi, Employee loginUser ) {
		
		return rDao.myReserveList(sqlSession, pi, loginUser);
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