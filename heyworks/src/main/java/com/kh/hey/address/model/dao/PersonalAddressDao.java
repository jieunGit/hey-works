package com.kh.hey.address.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hey.address.model.vo.Address;
import com.kh.hey.address.model.vo.AddressGroup;
import com.kh.hey.common.model.vo.PageInfo;

@Repository
public class PersonalAddressDao {
	
	public ArrayList<AddressGroup> adGroupList(SqlSessionTemplate sqlSession, String userNo) {
		return (ArrayList)sqlSession.selectList("addressMapper.adGroupList", userNo);
		
	}
	public int selectListCount(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.selectOne("addressMapper.selectListCount", userNo);
	}
	
	public ArrayList<Address> allAddressList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //건너뛸게시물의갯수
		int limit = pi.getBoardLimit();  //몇개를조회할건지
		//mybatis에서 제공하는 클래스
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("addressMapper.allAddressList", userNo, rowBounds);
	}
	
	public int groupListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("addressMapper.groupListCount", map);
	}
	
	public ArrayList<Address> groupAdList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //건너뛸게시물의갯수
		int limit = pi.getBoardLimit();  //몇개를조회할건지
		//mybatis에서 제공하는 클래스
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("addressMapper.groupAdList", map, rowBounds);
	}
	
	public int insertAddress(SqlSessionTemplate sqlSession, Address ad) {
		
		return sqlSession.insert("addressMapper.insertAddress", ad);
	}
	
	public int insertAdGroup(SqlSessionTemplate sqlSession, AddressGroup ag) {
		
		return sqlSession.insert("addressMapper.insertAdGroup", ag);
	}
	
	
	public Address selectAddress(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("addressMapper.selectAddress",map);
	}
	
	public int updateAddress(SqlSessionTemplate sqlSession, Address ad) {
		
		return sqlSession.insert("addressMapper.updateAddress", ad);
	}
}
