package com.kh.hey.reserve.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.reserve.model.vo.Reservation;
import com.kh.hey.reserve.model.vo.Resources;
import com.kh.hey.reserve.model.vo.ResourcesCategory;

@Repository
public class ReservationDao {

	public ArrayList<ResourcesCategory> MenuCategoryList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.MenuCategoryList");
		
	}
	public int selectListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("reservationMapper.selectListCount", userNo);
	}
	
	public ArrayList<Reservation> myReserveList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //건너뛸게시물의갯수
		int limit = pi.getBoardLimit();  //몇개를조회할건지
		//mybatis에서 제공하는 클래스
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reservationMapper.myReserveList", userNo, rowBounds);
		
	}
	
	public ResourcesCategory categoryInfo(SqlSessionTemplate sqlSession, int categoryNo) {
		return sqlSession.selectOne("reservationMapper.categoryInfo", categoryNo);
	}
	
	public ArrayList<Resources> resourceList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.resourceList", categoryNo);
	}
	
	public ArrayList<Reservation> selectRsvList(SqlSessionTemplate sqlSession, Map<String, String> paraMap) {
		return(ArrayList)sqlSession.selectList("reservationMapper.selectRsvList", paraMap);
	}
	

}
