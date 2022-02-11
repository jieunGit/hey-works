package com.kh.hey.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hey.approval.model.service.ApprovalService;
import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@RequestMapping("main.el")
	public String mainList() {
		
		return "approval/approvalMainList";
		
	}
	
	/*작성하기 페이지*/
	@RequestMapping("approvalFrom.el")
	public String approvalFrom() {
		
		return "approval/approvalEnrollFrom";
		
	}
	
	@RequestMapping("bdEnrollForm.el")
	public String businessDraftEnrollForm() {
		
		return "approval/businessDraftEnrollForm";
		
	}
	
	@RequestMapping("ebEnrollForm.el")
	public String eqBuyEnrollForm() {
		
		return "approval/eqBuyEnrollForm";
		
	}
	
	/*결재자 기준 결재 대기 목록 페이지*/	
	@RequestMapping("standby.el")
	public String selectStandByList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model, HttpSession session) {
		
		// 조건검사할 로그인 객체 받아오기
		String userName = ((Employee)session.getAttribute("loginUser")).getUserName();
		
		// 각 객체들 hashmap에 담기
		/*
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("userName", userName);
		map.put("status", status);
		*/
		
		int listCount = aService.selectListCount(userName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> apList = aService.selectStandByList(pi, userName);
		
		model.addAttribute("pi", pi);
		model.addAttribute("apList", apList);

		return "approval/standbyList";
		
	} // 각 게시판 페이징처리해서 조회
	
	// 기안자 기준 결재대기, 결재예정
	@RequestMapping("onlist.el")
	public String selectSubmitStandbyList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model, HttpSession session) {
		
		// 조건검사할 로그인 객체 받아오기
		String userName = ((Employee)session.getAttribute("loginUser")).getUserName();
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userNo", userNo);
		map.put("status", status);
		
		
		int listCount = aService.selectSubmitListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> sbList = aService.selectSubmitStandByList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("sbList", sbList);
		
		return "approval/submitStandbyList";
		
	}
	
	/*전자결재 관리자 파트*/
	
	@RequestMapping("deleteList.el")
	public String deleteApproval() {
		
		return "approval/deleteApproval";
		
	}
	
	@RequestMapping("approvalad.el")
	public String approvalAdminList() {
		
		return "approval/approvalAdmin";
		
	}
	
	

}
