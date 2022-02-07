package com.kh.hey.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {
	
	@RequestMapping(value="reservelist.re")
	public String myReserveList() {
		return "reserve/myReserve";
	}

}
