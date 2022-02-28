package com.kh.hey.inContact.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hey.inContact.model.service.InContactService;
import com.kh.hey.inContact.model.vo.InContact;
import com.kh.hey.organization.model.service.OrganizationService;
import com.kh.hey.organization.model.vo.Organ;

@Controller
public class InContactController {
	
	@Autowired
	private InContactService inService;
	
	
	//0. 사내연락처 메인페이지
	@RequestMapping("main.inCon")
	public String mainIncon(HttpSession session) {
		// 등록된 그룹 알아오기
		ArrayList<Organ> dept = inService.selectDept();
		ArrayList<InContact> inCon = inService.selectGroup();	
		session.setAttribute("inCon", inCon);
		session.setAttribute("dept", dept);
		return "incontact/adminInContactMain";
	}
	
	//1. 사내연락처 그룹추가요청
	@RequestMapping("insert.inGroup")
	public String insertGroup(String inGroupName, HttpSession session) {
		
		int result = inService.insertGroup(inGroupName);
		if(result > 0) {
			session.setAttribute("alertMsg", "그룹이 추가되었습니다.");
		}
		return "incontact/adminInContactMain";
	}
	
	//2. 사내연락처 연락처추가요청
	@RequestMapping("insert.inCon")
	public String insertInCon(InContact incon, HttpSession session) {
		
		int result = inService.insertInCon(incon);
		if(result > 0) {
			session.setAttribute("alertMsg", "사내연락처가 추가되었습니다.");
			return "incontact/adminInContactMain";
		}else {
			session.setAttribute("alertMsg", "추가실패!");
			return "incontact/adminInContactMain";
		}
	}

}