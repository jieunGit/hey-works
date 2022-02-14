package com.kh.hey.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 기안자 기준 전체, 결재대기, 진행중
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
	
	// 기안자 기준 승인, 반려, 임시저장
	@RequestMapping("endlist.el")
	public String selectEndList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model, HttpSession session) {
		
		// 조건검사할 로그인 객체 받아오기
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("status", status);
		
		
		int listCount = aService.selectSubmitListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> edList = aService.selectSubmitEndList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("edList", edList);

		return "approval/submitEndList";
	}
	
	// 결재자 기준 참조/열람대기문서
	
	
	
	
	// 기안자 기준 참조/열람 끝난 문서
	
	
	
	
	// 상세보기
	@RequestMapping("detail.el")
	public ModelAndView selectApproval(String ano, HttpSession session, ModelAndView mv) {
		
		String formNo = ano.substring(3,5); // 양식 조건비교할 값 담기
		
		Approval ap = aService.selectApproval(ano); // 제목~결재자까지 알아오기
		
		if(ap != null) {
			
			mv.addObject("ap", ap);	
			
			if(formNo.equals("BD")) { // 업무기안서 상세
				
				Approval bd = aService.selectBusinessDraft(ano);
				mv.addObject("bd", bd);
				
			}else if(formNo.equals("EB")) { // 비품구매 상세
				
				Approval eb = aService.selectEquipmentBuy(ano);
				mv.addObject("eb", eb);
				
			}else if(formNo.equals("CE")) { // 증명서 신청 상세
				
				Approval ce = aService.selectCertificate(ano);
				mv.addObject("ce", ce);
				
			}else if(formNo.equals("RC")) { // 채용요청서 상세
				
				Approval rc = aService.selectRecruiment(ano);
				mv.addObject("rc", rc);
				
			}else { // 일반품의서 상세
				
				Approval er = aService.selectExpenseReport(ano);
				mv.addObject("er", er);
				
			}
			
			mv.setViewName("approval/approvalDetail");
			
		}else {
			//mv.addObject("errorMsg", "게시글 상세조회 실패!");
			//mv.setViewName("redirect:/standby.el");
		}
		
		return mv;
		
		
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
