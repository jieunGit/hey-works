package com.kh.hey.reserve.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.reserve.model.vo.Reservation;

@Repository
public class ReservationDao {

	
	public int selectListCount(SqlSessionTemplate sqlSession, Employee loginUser) {
		return sqlSession.selectOne("reservationMapper.selectListCount", loginUser);
	}
	
	public ArrayList<Reservation> myReserveList(SqlSessionTemplate sqlSession, PageInfo pi, Employee loginUser) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //건너뛸게시물의갯수
		int limit = pi.getBoardLimit();  //몇개를조회할건지
		//mybatis에서 제공하는 클래스
		RowBounds rowBounds = new RowBounds(offset, limit);
		//전달값 없으므로 null
		return (ArrayList)sqlSession.selectList("reservationMapper.myReserveList", loginUser, rowBounds);
		
		
	}
}
