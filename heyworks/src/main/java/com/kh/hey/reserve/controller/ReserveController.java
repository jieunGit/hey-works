package com.kh.hey.reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.reserve.model.service.ReservationService;
import com.kh.hey.reserve.model.vo.Reservation;

@Controller
public class ReserveController {
	
	@Autowired 
	private ReservationService rService;
	
	//나의 예약목록
	@RequestMapping(value="myReserve.re")
	public String myReserveList(@RequestParam(value="cpage", defaultValue="1") Employee loginUser, int currentPage, Model model) {
		
		// 예약수가 몇개인지 알아오기
		int listCount = rService.selectListCount(loginUser);
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Reservation> list = rService.myReserveList(pi, loginUser);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
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
	
	//자원카테고리list 페이지
	@RequestMapping(value="categoryList.re")
	public String CategoryList() {
		return "reserve/adminResourceCategory";
	}
	
	
	//자원카테고리 이용안내페이지
	@RequestMapping(value="categoryInfo.re")
	public String CategoryInfo() {
		return "reserve/adminResourceCategoryInfo";
	}
	
	//자원카테고리 자원리스트페이지
	@RequestMapping(value="resourceList.re")
	public String ResourceList() {
		return "reserve/adminResouceList";
	}
	//자원카테고리 자원추가
		@RequestMapping(value="resourceInsert.re")
		public String ResourceInsert() {
			return "reserve/adminResourceAdd";
		}
				
	//자원카테고리 자원수정
	@RequestMapping(value="resourceUpdate.re")
	public String ResourceUpdate() {
		return "reserve/adminResourceUpdate";
	}
			
	
}
