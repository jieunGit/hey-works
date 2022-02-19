package com.kh.hey.address.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.hey.address.model.vo.Address;
import com.kh.hey.address.model.vo.AddressGroup;
import com.kh.hey.common.model.vo.PageInfo;

public interface PersonalAddressService {

	//카테고리 그룹 조회
	ArrayList<AddressGroup> adGroupList(String userNo);
	
	//주소록 개수 조회
	
	int selectListCount(HashMap<String, String> paraMap);
	
	//전체 개인주소록 조회
	ArrayList<Address> allAddressList(PageInfo pi ,HashMap<String, String> paraMap);
	
	//그룹별 주소록 개수조회
	
	int groupListCount(HashMap<String, String> map);
	
	// 그룹별 주소록 조회
	ArrayList<Address> groupAdList(PageInfo pi ,HashMap<String, String> map);
	
	//즐겨찾는 개인주소록 개수 조회
	int likeListCount(HashMap<String, String> paraMap);
	
	//즐겨찾는 개인주소록 목록 조회
	ArrayList<Address> likeAddressList(PageInfo pi ,HashMap<String, String> paraMap);

	//즐겨찾기 추가하기
	int insertLikeAddress(HashMap<String, String> map);
	
	//즐겨찾기 삭제하기
	int deleteLikeAddress(HashMap<String, String> map);
	
	//주소록 추가
	int insertAddress(Address ad);
	
	//개인주소록 그룹 추가
	int insertAdGroup(AddressGroup ag);
	

	//주소록 상세보기 정보 select
	Address selectAddress(HashMap<String, String> map);
	
	//주소록 수정하기
	int updateAddress(Address ad);

	
	//주소록 삭제하기
	int deleteAddress(HashMap<String, String> map);
	
	//주소록 선택 삭제하기
	int chkDelete(HashMap<String, Object> map);
	
	//주소록 삭제 개수 조회
	int deleteListCount(HashMap<String, String> map);
	
	
	//주소록 삭제 목록
	ArrayList<Address> deleteAddressList(PageInfo pi, HashMap<String, String> map);


	//주소록 복구하기
	int restoreAddress(HashMap<String, Object> map);
	
	//주소록 영구삭제하기
	int foreverdelete(HashMap<String, Object> map);


}


