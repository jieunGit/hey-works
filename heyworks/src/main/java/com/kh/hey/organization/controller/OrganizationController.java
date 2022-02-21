package com.kh.hey.organization.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 조직도 부서별 요청
	@RequestMapping("detail.organ")
	public ModelAndView DeptOrgan(int dno, HttpSession session, ModelAndView mv) {
		
		ArrayList<Organ> organ = orService.deptOrgan(dno);
		Organ dt = orService.selectDeptName(dno);
		
		if(organ != null) {
			mv.addObject("organ", organ)
			  .addObject("dt", dt)
			  .setViewName("organization/organizationSub");
			return mv;
		}else {
			System.out.println("요청실패");
			mv.setViewName("redirect:/");
			return mv;
		}
		
	}
	
	// 임직원 검색
	@RequestMapping("search.organ")
	public String selectEmployee(String userName, HttpSession session, Model model) {
		
		ArrayList<Organ> organ = orService.selectEmployee(userName);
		
		if(organ != null) {
			session.setAttribute("organ", organ);
			return "organization/organizationMain";
			
		}else {
			System.out.println("요청실패");
			return "redirect:/";
		}
		
	}
	
	// 임직원 상세보기
	@ResponseBody
	@RequestMapping("detail.emp")
	public Organ detailEmployee(int userNo, HttpSession session) {
		
		Organ emp = orService.detailEmployee(userNo);
		
		if(emp != null) {
			return emp;		
		}else {
			System.out.println("요청실패");
			return emp;
		}
		
		
	}
	
	
}
