package com.kh.hey.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hey.employee.model.service.EmployeeService;
import com.kh.hey.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	
	
	@RequestMapping("login.em")
	public ModelAndView loginEmployee(Employee e, HttpSession session, ModelAndView mv) {
		
		
		Employee loginUser = eService.loginEmployee(e);
		
		if(loginUser == null) { 			
			mv.addObject("errorMsg", "로그인 실패");
			System.out.println("로그인 실패");
			System.out.println(loginUser);
			mv.setViewName("redirect:/login.do"); 
			
			
		}else { 			
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			mv.setViewName("redirect:/main.do");
			
		}
		return mv;		
	}
	
	@RequestMapping("login.do")
	public String index(HttpSession session) throws Exception {
		return "employee/login";
	}
	
	@RequestMapping("main.do")
	public String home(HttpSession session) throws Exception {
		return "main";
	}
	
	@RequestMapping("logout.em")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("myPage.em")
	public String myPage() {
		
		return "employee/myPage";	
		
	}
	
	@RequestMapping("update.em")
	public String updateEmployee(HttpSession session, Employee e) {
		
		int result = eService.updateEmployee(e);
		
		if(result > 0) {
			session.setAttribute("loginUser", eService.loginEmployee(e));
			session.setAttribute("alertMsg", "회원 정보가 수정되었습니다.");
			
			return "redirect:myPage.em";
		}else {
			session.setAttribute("alertMsg", "회원 정보 수정 실패!");
			return "redirect:myPage.em";
		}
		
	}
	
	
	
	

}
