package com.kh.hey.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalAddressController {

	
	//나의 예약목록
	@RequestMapping(value="personAdList.ad")
	public String myReserveList() {
		return "address/likedAddress";
	}
}
