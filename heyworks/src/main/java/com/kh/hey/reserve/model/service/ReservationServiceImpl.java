package com.kh.hey.reserve.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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

	//자원 리스트 select
	@Override
	public ArrayList<Resources> menuResourceList() {
		
		return rDao.menuResourceList(sqlSession);
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

	// 입력받은 일시가 중복된 날짜인지 검사
	@Override
	public int checkOverlapRsv(HashMap<String, String> paraMap) {
		
		return rDao.checkOverlapRsv(sqlSession, paraMap);
	}
	// (modal) 예약 테이블에 예약한 값 넣어주기
	@Override
	public int insertReservation(HashMap<String, String> paraMap) {
		
		return rDao.insertReservation(sqlSession, paraMap);
	}
	
	// 예약상세보기
	@Override
	public Reservation readDetailRsvList(String reserveNo) {
		
		return rDao.readDetailRsvList(sqlSession, reserveNo);
	}
	//예약취소하기
	
	@Override
	public int rsvCancel(HashMap<String, String> paraMap) {
		
		return rDao.rsvCancel(sqlSession, paraMap);
	}

	//관리자- 카레고리 리스트
	@Override
	public ArrayList<ResourcesCategory> admincateogryList() {
		
		return rDao.admincateogryList(sqlSession);
	}
	// 관리자- 카테고리 추가하기
	@Override
	public int adminInsertCategory(String categoryName) {
		
		return rDao.adminInsertCategory(sqlSession, categoryName);
	}
	//관리자 - 카테고리 삭제하기
	@Override
	public int adminCategoryDelete(String categoryNo) {
		
		return rDao.adminCategoryDelete(sqlSession, categoryNo);
	}
	// 관리자- 카테고리 이용안내문 수정하기
	@Override
	public int updateCategoryContent(HashMap<String, String> paraMap) {
		
		return rDao.updateCategoryContent(sqlSession, paraMap);
	}

	@Override
	public int resourceInsert(Resources rs) {
		
		return rDao.resourceInsert(sqlSession, rs);
	}

	@Override
	public Resources ResourceUpdateForm(HashMap<String, String> paraMap) {
		
		return rDao.ResourceUpdateForm(sqlSession, paraMap);
	}

	@Override
	public int ResourceUpdate(Resources rs) {
		
		return rDao.ResourceUpdate(sqlSession, rs);
	}

	@Override
	public int deleteResource(HashMap<String, String> paraMap) {
		
		return rDao.deleteResource(sqlSession, paraMap);
	}
	












	


	

}