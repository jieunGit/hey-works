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
	
	
	
	

}
