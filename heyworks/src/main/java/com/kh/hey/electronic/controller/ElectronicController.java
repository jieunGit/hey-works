package com.kh.hey.electronic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ElectronicController {
	
	@RequestMapping("main.el")
	public String mainList() {
		
		return "electronic/elecMainList";
		
	}
	
	
	
	

}
