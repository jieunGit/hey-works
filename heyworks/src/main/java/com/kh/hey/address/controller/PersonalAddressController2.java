package com.kh.hey.address.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hey.address.model.service.PersonalAddressService;
import com.kh.hey.address.model.vo.Address;
import com.kh.hey.address.model.vo.AddressGroup;
import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;

@Controller
public class PersonalAddressController {

	@Autowired 
	private PersonalAddressService aService;
	
	
	
	//개인주소록 그룹 조회 (나중에 사원번호 받아서 조회해야함)
	@ResponseBody
	@RequestMapping(value="addressGroup.ad", produces="application/json; charset=utf-8")
	public String adGroupList(HttpSession session) {
		
		//로그인한 사원번호
	    String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ArrayList<AddressGroup> glist = aService.adGroupList(userNo);
		
		return new Gson().toJson(glist);
	}
	
	//전체주소록
	@RequestMapping(value="adAllList.ad")
	public String allAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
	
		//주소록 몇개인지 알아오기
		int listCount = aService.selectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> list = aService.allAddressList(pi, userNo);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "address/personAddressAllList";
	}
	
	//그룹별 주소록 조회
	@RequestMapping(value="groupAdList.ad")
	public String groupAdList(@RequestParam(value="gNo") String groupNo, @RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userNo", userNo);
		map.put("groupNo", groupNo);
		
		int listCount = aService.groupListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> list = aService.groupAdList(pi, map);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "address/groupAddressList";
	}
	
	
	// 개인주소록 추가
	@RequestMapping(value="insertAddress.ad")
	public String insertAddress(Address ad, HttpSession session) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ad.setUserNo(userNo);
		
		int result = aService.insertAddress(ad);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "성공적으로 주소록에 추가되었습니다.");
			return "redirect:adAllList.ad";
		
		}else {
			session.setAttribute("alertMsg", "주소록 추가에 실패했습니다.");
			return "redirect:adAllList.ad";
		}
	}
	
	// 개인주소록 그룹 추가
	@RequestMapping(value="insertAdGroup.ad")
	public String insertAdGroup(AddressGroup ag, HttpSession session) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ag.setUserNo(userNo);
		
		int result = aService.insertAdGroup(ag);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 그룹 추가되었습니다.");
			return "redirect:adAllList.ad";
		
		}else {
			session.setAttribute("alertMsg", "그룹 추가에 실패했습니다.");
			return "redirect:adAllList.ad";
		}
		
	
	}
	
	//주소록 상세보기, 수정하기 정보 select
	@ResponseBody
	@RequestMapping(value="selectAddress.ad", produces="application/json; charset=utf-8")
	public String selectAddress(HttpSession session, String addressNo) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userNo", userNo);
		map.put("addressNo", addressNo);
		
		Address ad = aService.selectAddress(map);
		
		return new Gson().toJson(ad);
	}
	
	//주소록 수정하기
	@RequestMapping(value="updateAddress.ad")
	public String updateAddress(Address ad, Model model, HttpSession session, String addressNo) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		ad.setAddressNo(addressNo);
		ad.setUserNo(userNo);
		
		int result = aService.updateAddress(ad);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 주소록이 수정되었습니다.");
			return "redirect:adAllList.ad";
		
		}else {
			session.setAttribute("alertMsg", "주소록 수정에 실패하였습니다.");
			return "redirect:adAllList.ad";
		}
		
	}
	
	//주소록 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteAddress.ad", produces="application/json; charset=utf-8")
	public String deleteAddress(HttpSession session, String addressNo) {
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("addressNo", addressNo);
		
		
		int result = aService.deleteAddress(map);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
	}
	
	
	
	
	//즐겨찾는주소록, 전체, 부서등 
	@RequestMapping(value="personAdList.ad")
	public String myReserveList() {
		return "address/likedAddress";
	}

	//삭제목록화면
	@RequestMapping(value="deleteAdList.ad")
	public String deleteAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		int listCount = aService.deleteListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> dlist = aService.deleteAddressList(pi, userNo);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("dlist", dlist);
		
		return "address/deleteAddressList";
	}
	
	
	//주소록 검색
		@RequestMapping(value="searchAddress.ad")
		public String searchAddress() {
			return "address/likedAddress";
		}


}
