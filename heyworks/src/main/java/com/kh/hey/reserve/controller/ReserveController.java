package com.kh.hey.reserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.reserve.model.service.ReservationService;
import com.kh.hey.reserve.model.vo.Reservation;
import com.kh.hey.reserve.model.vo.Resources;
import com.kh.hey.reserve.model.vo.ResourcesCategory;

@Controller
public class ReserveController {
	
	@Autowired 
	private ReservationService rService;
	
	//나의 예약목록
	@RequestMapping(value="myReserve.re")
	public String myReserveList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model,HttpSession session ) {
		
		//로그인한 사원번호
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		// 예약수가 몇개인지 알아오기
		
		int listCount = rService.selectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Reservation> list = rService.myReserveList(pi, userNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "reserve/myReserve";
	}
	
	@ResponseBody
	@RequestMapping(value="menuCategoryList.re", produces="application/json; charset=utf-8")
	public String MenuCategoryList(Model model) {
		
		ArrayList<ResourcesCategory> clist = rService.MenuCategoryList();
		
		
		return new Gson().toJson(clist);
	}
	
	
	//카테고리별 예약 list
	@RequestMapping(value="reserve.re")
	public String reserveList(@RequestParam(value="cno") int categoryNo, Model model) {
		
		//카테고리 정보 select
		ResourcesCategory rc =  rService.categoryInfo(categoryNo);
		model.addAttribute("rc", rc);
		
		ArrayList<Resources> rlist = rService.resourceList(categoryNo);
		model.addAttribute("rlist", rlist);
		
	
		return "reserve/reservationFinal";
	}
	
	// 예약정보 불러오기(회원번호, 자원번호, 카테고리번호로 검색)
	
	@ResponseBody
	@RequestMapping(value="selectRsvList.re", method= {RequestMethod.GET}, produces="application/json; charset=utf-8")
	public String selectRsvList(HttpServletRequest request, HttpSession session, String resourceNo, String categoryNo) throws IOException {
		
		

		
		Map<String, String> paraMap = new HashMap<String, String>();

		paraMap.put("resourceNo", resourceNo);
		paraMap.put("categoryNo", categoryNo);
		

		System.out.println(resourceNo);
		System.out.println(categoryNo);
		 ArrayList<Reservation> rsvList = rService.selectRsvList(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		
		for (Reservation rsv : rsvList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("reserveNo", rsv.getReserveNo());
			jsonObj.put("userNo", rsv.getUserNo());
			jsonObj.put("resourcesNo", rsv.getResourcesNo());
			jsonObj.put("categoryName", rsv.getCategoryName());
			jsonObj.put("resourceName", rsv.getResourceName());
			jsonObj.put("startDate", rsv.getStartDate());
			jsonObj.put("endDate",rsv.getEndDate());
			jsonObj.put("reserveDate", rsv.getReserveDate());
			jsonObj.put("reserveContent", rsv.getReserveContent());
			jsonObj.put("userName", rsv.getUserName());
			jsonObj.put("categoryNo", rsv.getCategoryNo());
			
			jsonArr.add(jsonObj);
			
		}
		System.out.println(jsonArr.toJSONString());
		return jsonArr.toJSONString();
	}
	
	
	// (modal) 예약하기 모달에 이용가능한 자원명 리스트를 select 해옴
		@ResponseBody
		@RequestMapping(value="readRsList.re", method= {RequestMethod.GET}, produces="application/json; charset=utf-8")
		public String readRsList(HttpServletRequest request, int categoryNo) {

			ArrayList<Resources> rsList = rService.resourceList(categoryNo);
		
			
			JSONArray jsonArr = new JSONArray();
			
			for (Resources rsvo : rsList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("resourcesNo", rsvo.getResourcesNo());
				jsonObj.put("categoryNo", rsvo.getCategoryNo());
				jsonObj.put("resourceName", rsvo.getResourceName());
				jsonObj.put("resourceContent", rsvo.getResourceContent());
				
				jsonArr.add(jsonObj);
			}
			
			
			
			return jsonArr.toJSONString();
		}
	
		
	// (modal) 예약 테이블에 예약한 값 넣어주기	
		
		
		
	
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
