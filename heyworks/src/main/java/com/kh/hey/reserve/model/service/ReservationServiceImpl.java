package com.kh.hey.reserve.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.reserve.model.dao.ReservationDao;
import com.kh.hey.reserve.model.vo.Reservation;
import com.kh.hey.reserve.model.vo.Resources;
import com.kh.hey.reserve.model.vo.ResourcesCategory;



@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//카테고리 리스트 select
	@Override
	public ArrayList<ResourcesCategory> MenuCategoryList() {
		
		return rDao.MenuCategoryList(sqlSession);
	}


	//페이징 예약수 알아오기
	@Override
	public int selectListCount(String userNo) {
	
		return rDao.selectListCount(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Reservation> myReserveList(PageInfo pi,String userNo ) {
		
		return rDao.myReserveList(sqlSession, pi, userNo);
	}

	//카테고리 정보
	@Override
	public ResourcesCategory categoryInfo(int categoryNo) {
		
		return rDao.categoryInfo(sqlSession, categoryNo);
	}

	//카테고리별 자원 list 조회
	
	@Override
	public ArrayList<Resources> resourceList(int categoryNo) {
		
		return rDao.resourceList(sqlSession, categoryNo);
	}




	// 예약정보 불러오기(회원번호, 자원번호로 검색)
	@Override
	public ArrayList<Reservation> selectRsvList(Map<String, String> paraMap) {
		
		return rDao.selectRsvList(sqlSession, paraMap);
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