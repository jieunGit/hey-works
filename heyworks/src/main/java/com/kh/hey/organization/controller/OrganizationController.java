package com.kh.hey.organization.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hey.organization.model.service.OrganizationService;
import com.kh.hey.organization.model.vo.Organ;

@Controller
public class OrganizationController {
	
	@Autowired
	private OrganizationService orService;
	
	
	// 전체 조직도 요청
	@RequestMapping("list.organ")
	public String selectOrgan(HttpSession session, Model model) {
		
		// 부서 코드 알아오기
		ArrayList<Organ> dept = orService.selectDept();
		ArrayList<Organ> organ = orService.selectOrgan();
		
		if(organ != null) {
			session.setAttribute("dept", dept);
			session.setAttribute("organ", organ);
			return "organization/organizationMain";
		}else {
			System.out.println("요청실패");
			return "redirect:/";
		}
		
	}
	
	
}
