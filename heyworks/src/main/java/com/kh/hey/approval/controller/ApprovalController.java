package com.kh.hey.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hey.approval.model.vo.Approval;

@Controller
public class ApprovalController {
	
	@RequestMapping("main.el")
	public String mainList() {
		
		return "approval/approvalMainList";
		
	}
	
	
	
	

}
