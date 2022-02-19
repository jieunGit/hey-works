package com.kh.hey.working.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.working.model.service.WorkingService;
import com.kh.hey.working.model.vo.Leave;

@Controller
public class WorkingController {

	@Autowired
	private WorkingService wService;
	
	// test
	@RequestMapping("myWorkingList.wo")
	public String myWorkingList() {
		return "working/myWorkinglist";
	}

	// 출근
	@ResponseBody
	@RequestMapping(value="clockin.wo")
	public void insertClockIn(HttpSession session) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		int result = wService.insertClockIn(userNo);

	}
	
	// 퇴근
	@ResponseBody
	@RequestMapping(value="clockout.wo")
	public void updateClockOut(HttpSession session) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		int result = wService.updateClockOut(userNo);
	}
	
	// 휴가신청 폼
	@RequestMapping("leaveApplyForm.wo")
	public String leaveApplyForm() {
		return "working/leaveApplyForm";
	}
	
	// 휴가 승인요청
	@RequestMapping("insertLeave.wo")
	public String insertLeave(Leave l, HttpSession session) {
		
		int result = wService.insertLeave(l);
		
		return "working/leaveStatus";
	}
	
	// 연장근무 신청 폼
	@RequestMapping("otApplyForm.wo")
	public String otApplyForm() {
		return "working/overtimeApplyForm";
	}
	
	// 근무/휴가현황 test
	@RequestMapping("myWorkingStatus.wo")
	public String myWorkingStatus() {
		return "working/myWorkingStatus";
	}
	
	// 개인 휴가현황
	@RequestMapping("selectMyleave.wo")
	public ModelAndView selectMyleave(HttpSession session, ModelAndView mv) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Leave> leList = wService.selectMyleave(userNo);
		
		mv.addObject("leList", leList);
		mv.setViewName("working/leaveStatus");
		
		System.out.println(leList); // leaveAno, userNo = 0으로 찍힘 
		
		return mv;
	}
}
