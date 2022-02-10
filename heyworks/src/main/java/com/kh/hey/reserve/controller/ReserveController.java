package com.kh.hey.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {
	
	//나의 예약목록
	@RequestMapping(value="reservelist.re")
	public String myReserveList() {
		return "reserve/myReserve";
	}
	
	//회의실예약, 차량예약, 비품예약
	@RequestMapping(value="reserve.re")
	public String reservation() {
		return "reserve/reservation";
	}
	
	//주간예약리스트, 예약하기모달, 예약취소모달
	@RequestMapping(value="weekend.re")
	public String WeekendReserveList() {
		return "reserve/weekendReserve";
	}
	
}
