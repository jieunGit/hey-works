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
	
	int selectListCount(String userNo);
	
	//전체 개인주소록 조회
	ArrayList<Address> allAddressList(PageInfo pi ,String userNo);
	
	//그룹별 주소록 개수조회
	
	int groupListCount(HashMap<String, String> map);
	
	// 그룹별 주소록 조회
	ArrayList<Address> groupAdList(PageInfo pi ,HashMap<String, String> map);

	//주소록 추가
	int insertAddress(Address ad);
	
	//개인주소록 그룹 추가
	int insertAdGroup(AddressGroup ag);
	

	//주소록 상세보기 정보 select
	Address selectAddress(HashMap<String, String> map);
	
	//주소록 수정하기
	int updateAddress(Address ad);

}
