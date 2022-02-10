package com.kh.hey.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalAddressController {

	
	//즐겨찾는주소록, 전체, 부서등 
	@RequestMapping(value="personAdList.ad")
	public String myReserveList() {
		return "address/likedAddress";
	}
	
	//삭제목록화면
	@RequestMapping(value="deleteAdList.ad")
	public String deleteAddressList() {
		return "address/deleteAddressList";
	}
	
	//삭제목록화면
		@RequestMapping(value="adAllList.ad")
		public String AllAddressList() {
			return "address/personAddressAllList";
		}
}
