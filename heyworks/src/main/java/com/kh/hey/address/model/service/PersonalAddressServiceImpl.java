package com.kh.hey.address.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hey.address.model.dao.PersonalAddressDao;
import com.kh.hey.address.model.vo.Address;
import com.kh.hey.address.model.vo.AddressGroup;
import com.kh.hey.common.model.vo.PageInfo;
@Service
public class PersonalAddressServiceImpl implements PersonalAddressService {

	
	@Autowired
	private PersonalAddressDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//카테고리 그룹 조회
	@Override
	public ArrayList<AddressGroup> adGroupList(String userNo) {
		
		return aDao.adGroupList(sqlSession, userNo);
	}


	//주소록 개수 조회
	@Override
	public int selectListCount(String userNo) {
		
		return aDao.selectListCount(sqlSession, userNo);
	}

	//전체 개인주소록 조회
	@Override
	public ArrayList<Address> allAddressList(PageInfo pi, String userNo) {
		
		return aDao.allAddressList(sqlSession,pi, userNo);
	}

	//그룹별 주소록 개수조회
	@Override
	public int groupListCount(HashMap<String, String> map) {
		
		return aDao.groupListCount(sqlSession, map);
	}

	//그룹별 주소록 조회
	@Override
	public ArrayList<Address> groupAdList(PageInfo pi, HashMap<String, String> map) {
		
		return aDao.groupAdList(sqlSession, pi, map);
	}

	// 주소록 추가
	@Override
	public int insertAddress(Address ad) {
		
		return aDao.insertAddress(sqlSession, ad);
	}

	// 주소록 그룹 추가
	@Override
	public int insertAdGroup(AddressGroup ag) {
		
		return aDao.insertAdGroup(sqlSession, ag);
	}


	@Override
	public Address selectAddress(HashMap<String, String> map) {
		
		return aDao.selectAddress(sqlSession, map);
	}


	@Override
	public int updateAddress(Address ad) {
		
		return aDao.updateAddress(sqlSession, ad);
	}


	@Override
	public int deleteAddress(HashMap<String, String> map) {
		
		return aDao.deleteAddress(sqlSession, map);
	}

	@Override
	public int deleteListCount(String userNo) {
		
		return aDao.deleteListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Address> deleteAddressList(PageInfo pi, String userNo) {
		
		return aDao.deleteAddressList(sqlSession, pi, userNo);
	}




	


	
	
	
}
