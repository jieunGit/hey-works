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
	public int selectListCount(HashMap<String, String> paraMap) {
		
		return aDao.selectListCount(sqlSession, paraMap);
	}

	//전체 개인주소록 조회
	@Override
	public ArrayList<Address> allAddressList(PageInfo pi, HashMap<String, String> paraMap) {
		
		return aDao.allAddressList(sqlSession,pi, paraMap);
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

	// 즐겨찾는 개인주소록 개수조회
	@Override
	public int likeListCount(HashMap<String, String> paraMap) {
		
		return  aDao.likeListCount(sqlSession, paraMap);
	}

	// 즐겨찾는 개인주소록 목록조회
	@Override
	public ArrayList<Address> likeAddressList(PageInfo pi, HashMap<String, String> paraMap) {
		
		return aDao.likeAddressList(sqlSession,pi, paraMap);
	}

	//즐겨찾기 추가하기
	@Override
	public int insertLikeAddress(HashMap<String, String> map) {
		
		return aDao.insertLikeAddress(sqlSession, map);
	}

	//즐겨찾기 삭제하기
	@Override
	public int deleteLikeAddress(HashMap<String, String> map) {
		
		return aDao.deleteLikeAddress(sqlSession, map);
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

	//주소록 상세보기
	@Override
	public Address selectAddress(HashMap<String, String> map) {
		
		return aDao.selectAddress(sqlSession, map);
	}

	//주소록 수정하기
	@Override
	public int updateAddress(Address ad) {
		
		return aDao.updateAddress(sqlSession, ad);
	}

	//주소록 삭제하기
	@Override
	public int deleteAddress(HashMap<String, String> map) {
		
		return aDao.deleteAddress(sqlSession, map);
	}
	//주소록 선택삭제
	@Override
	public int chkDelete(HashMap<String, Object> map) {
		
		return aDao.chkDelete(sqlSession, map);
	}

	
	//주소록 삭제 개수조회
	@Override
	public int deleteListCount(HashMap<String, String> map) {
		
		return aDao.deleteListCount(sqlSession, map);
	}

	//주소록 삭제목록
	@Override
	public ArrayList<Address> deleteAddressList(PageInfo pi, HashMap<String, String> map) {
		
		return aDao.deleteAddressList(sqlSession, pi, map);
	}

	//주소록 복구하기
	@Override
	public int restoreAddress(HashMap<String, Object> map) {
		
		return aDao.restoreAddress(sqlSession, map);
	}

	//주소록 영구삭제
	@Override
	public int foreverdelete(HashMap<String, Object> map) {
		
		return aDao.foreverdelete(sqlSession, map);
	}






		



	


	
	
	
}
