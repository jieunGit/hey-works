package com.kh.hey.reserve.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	public ArrayList<Resources> menuResourceList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reservationMapper.menuResourceList");
		
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
	
	public int checkOverlapRsv(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.selectOne("reservationMapper.checkOverlapRsv", paraMap);
	}
	
	public int insertReservation(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.insert("reservationMapper.insertReservation", paraMap);
	}
	
	public Reservation readDetailRsvList(SqlSessionTemplate sqlSession, String reserveNo) {
		return sqlSession.selectOne("reservationMapper.readDetailRsvList", reserveNo);
	}
	
	public int rsvCancel(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		
		return sqlSession.delete("reservationMapper.rsvCancel", paraMap);
	}
	
	public ArrayList<ResourcesCategory> admincateogryList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.admincateogryList");
	}
	
	public int adminInsertCategory(SqlSessionTemplate sqlSession, String categoryName) {
		return sqlSession.insert("reservationMapper.adminInsertCategory", categoryName);
	}
	
	public int adminCategoryDelete(SqlSessionTemplate sqlSession, String categoryNo) {
		return sqlSession.insert("reservationMapper.adminCategoryDelete", categoryNo);
	}
	
	public int updateCategoryContent(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.update("reservationMapper.updateCategoryContent", paraMap);

	}
	
	public int resourceInsert(SqlSessionTemplate sqlSession, Resources rs) {
		return sqlSession.insert("reservationMapper.resourceInsert", rs);
		
	}
	
	public Resources ResourceUpdateForm(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.selectOne("reservationMapper.ResourceUpdateForm", paraMap);
		
	}
	
	public int ResourceUpdate(SqlSessionTemplate sqlSession, Resources rs) {
		return sqlSession.insert("reservationMapper.ResourceUpdate", rs);
	}
	
	public int deleteResource(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.selectOne("reservationMapper.deleteResource", paraMap);
	}
}
