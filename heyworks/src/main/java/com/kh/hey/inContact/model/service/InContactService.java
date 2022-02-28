package com.kh.hey.inContact.model.service;

import java.util.ArrayList;

import com.kh.hey.inContact.model.vo.InContact;
import com.kh.hey.organization.model.vo.Organ;

public interface InContactService {
	
	//0. 사내연락처 메인페이지
	ArrayList<InContact> selectGroup();
	ArrayList<Organ> selectDept();
	
	//1. 사내연락처 그룹추가요청
	int insertGroup(String inGroupName);
	
	//2. 사내연락처 연락처추가요청
	int insertInCon(InContact incon);

}