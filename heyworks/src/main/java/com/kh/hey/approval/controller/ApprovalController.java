package com.kh.hey.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hey.approval.model.service.ApprovalService;
import com.kh.hey.approval.model.vo.Approval;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;

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
	
	/*목록 페이지*/
	
	@RequestMapping("onAllList.el")
	public String ongoingList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String status, Model model) {
		
		int listCount = aService.selectListCount(status);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> apList = aService.selectList(pi, status);
		
		model.addAttribute("pi", pi);
		model.addAttribute("apList", apList);
		
		System.out.println(pi);
		System.out.println(apList.size());
		
		return "approval/ongoingAllList";
		
	} // 각 게시판 페이징처리해서 조회
	
	@RequestMapping("endList.el")
	public String endAllList() {
		
		//결재완료에 연결 나중에 수정하기
		return "approval/endAllList";
		
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
