package com.kh.hey.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hey.approval.model.service.ApprovalService;

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
	public String ongoingList() {
		
		return "approval/ongoingAllList";
		
	}
	
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
