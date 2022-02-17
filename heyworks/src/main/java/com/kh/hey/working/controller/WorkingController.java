package com.kh.hey.working.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.working.model.service.WorkingService;

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
	public void insertClockOut(HttpSession session) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		int result = wService.insertClockOut(userNo);
	}
}
