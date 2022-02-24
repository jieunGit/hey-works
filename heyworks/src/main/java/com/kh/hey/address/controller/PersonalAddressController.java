package com.kh.hey.address.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String allAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model, HttpServletRequest request, ModelAndView mav) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		String contactInput = request.getParameter("contactInput");
		String data = request.getParameter("data");
        String sort = request.getParameter("sort");
        
        if(contactInput == null || contactInput.trim().isEmpty()) {
            contactInput = "";
         }
        if(data == null || data.trim().isEmpty()) {
            data = "name";
         }
         if(sort == null || sort.trim().isEmpty()) {
            sort = "asc";
         }
         
         HashMap<String, String> paraMap = new HashMap<String, String>();
         paraMap.put("contactInput", contactInput);
         paraMap.put("data", data);
         paraMap.put("sort", sort);
         paraMap.put("userNo", userNo);
        System.out.println(paraMap);
        
		//주소록 몇개인지 알아오기
		int listCount = aService.selectListCount(paraMap);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> list = aService.allAddressList(pi, paraMap);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("data",data);
		model.addAttribute("sort",sort);
		
		return "address/personAddressAllList";
	}
	
	//그룹별 주소록 조회
	@RequestMapping(value="groupAdList.ad")
	public String groupAdList(@RequestParam(value="gNo") String groupNo, @RequestParam(value="cpage", defaultValue="1") int currentPage, HttpServletRequest request, HttpSession session, Model model) {
		
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		String contactInput = request.getParameter("contactInput");
		String data = request.getParameter("data");
        String sort = request.getParameter("sort");
        
        if(contactInput == null || contactInput.trim().isEmpty()) {
            contactInput = "";
         }
        if(data == null || data.trim().isEmpty()) {
            data = "name";
         }
         if(sort == null || sort.trim().isEmpty()) {
            sort = "asc";
         }
         
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userNo", userNo);
		map.put("groupNo", groupNo);
		map.put("contactInput", contactInput);
		map.put("data", data);
		map.put("sort", sort);
		
		int listCount = aService.groupListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> list = aService.groupAdList(pi, map);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("data",data);
		model.addAttribute("sort",sort);
		
		
		return "address/groupAddressList";
	}
	
	
	//즐겨찾는주소록
		@RequestMapping(value="likeAddress.ad")
		public String likeAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpServletRequest request, HttpSession session, Model model) {
			
			String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
			String contactInput = request.getParameter("contactInput");
			String data = request.getParameter("data");
	        String sort = request.getParameter("sort");
	        
	        if(contactInput == null || contactInput.trim().isEmpty()) {
	            contactInput = "";
	         }
	        if(data == null || data.trim().isEmpty()) {
	            data = "name";
	         }
	         if(sort == null || sort.trim().isEmpty()) {
	            sort = "asc";
	         }
	         
	         HashMap<String, String> paraMap = new HashMap<String, String>();
	         paraMap.put("contactInput", contactInput);
	         paraMap.put("data", data);
	         paraMap.put("sort", sort);
	         paraMap.put("userNo", userNo);
	        
	        
			//주소록 몇개인지 알아오기
			int listCount = aService.likeListCount(paraMap);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<Address> list = aService.likeAddressList(pi, paraMap);
			
			model.addAttribute("listCount", listCount);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("data",data);
			model.addAttribute("sort",sort);
			
			
			
			
			return "address/likedAddress";
		}

		
	//즐겨찾기 추가하기
	@ResponseBody
	@RequestMapping(value="insertLikeAddress.ad", produces="application/json; charset=utf-8")
	public String insertLikeAddress(HttpSession session, String addressNo) {
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("addressNo", addressNo);
		
		System.out.println(addressNo);
		int result = aService.insertLikeAddress(map);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
	}
	
	
	
	//즐겨찾기 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteLikeAddress.ad", produces="application/json; charset=utf-8")
	public String deleteLikeAddress(HttpSession session, String addressNo) {
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("addressNo", addressNo);
		
		
		System.out.println(addressNo);
		
		int result = aService.deleteLikeAddress(map);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
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
	
	//주소록 선택 삭제하기
	@ResponseBody
	@RequestMapping(value="chkDelete.ad",  produces="application/json; charset=utf-8")
	public String chkDelete(HttpSession session, HttpServletRequest request) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		
		String[] valueArr = request.getParameterValues("valueArr");  //input checked된 value값들 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("valueArr", valueArr);
		
		int result = aService.chkDelete(map);
	
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
	}
	
	
	
	
	
	//삭제목록화면
	@RequestMapping(value="deleteAdList.ad")
	public String deleteAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage,HttpServletRequest request,HttpSession session, Model model) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		String contactInput = request.getParameter("contactInput");
		String data = request.getParameter("data");
        String sort = request.getParameter("sort");
        

        if(contactInput == null || contactInput.trim().isEmpty()) {
            contactInput = "";
         }
        if(data == null || data.trim().isEmpty()) {
            data = "name";
         }
         if(sort == null || sort.trim().isEmpty()) {
            sort = "asc";
         }
         
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userNo", userNo);
		map.put("contactInput", contactInput);
		map.put("data", data);
		map.put("sort", sort);
		
		int listCount = aService.deleteListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> dlist = aService.deleteAddressList(pi, map);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("dlist", dlist);
		model.addAttribute("data",data);
		model.addAttribute("sort",sort);
		
		return "address/deleteAddressList";
	}
	
	
	//삭제리스트 복구
	@ResponseBody
	@RequestMapping(value="restoreAddress.ad")
	public String restoreAddress(HttpSession session, HttpServletRequest request) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		String[] valueArr = request.getParameterValues("valueArr");  //input checked된 value값들 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("valueArr", valueArr);
		
		
		int result = aService.restoreAddress(map);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
	}
	
	//주소록 영구삭제
	
	@ResponseBody
	@RequestMapping(value="foreverdelete.ad")
	public String foreverdelete(HttpSession session, HttpServletRequest request) {
		
		String userNo = (String.valueOf(((Employee)session.getAttribute("loginUser")).getUserNo()));
		String[] valueArr = request.getParameterValues("valueArr");  //input checked된 value값들 
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("valueArr", valueArr);
		
		
		int result = aService.foreverdelete(map);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		return jsonObj.toString();
	}
	
		
	


}
