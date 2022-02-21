package com.kh.hey.working.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.working.model.service.WorkingService;
import com.kh.hey.working.model.vo.AllLeave;
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
	
	// 휴가신청
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
	
	// 전사 휴가현황 리스트 
	@RequestMapping("leaveStatusList.wo")
	public String selectAleaveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = wService.selectAleaveListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<AllLeave> alist = wService.selectAleaveList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("alist", alist);
		
		return "working/allLeaveStatus";
	}
	
	// 전사 휴가현황 검색 요청
	@RequestMapping("AllLeaveSearch.wo")
	public String selectLeaveSearch(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = wService.selectAleaveSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
		ArrayList<AllLeave> alist = wService.selectAleaveSearch(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("alist", alist);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "working/allLeaveStatus";
	}
}
