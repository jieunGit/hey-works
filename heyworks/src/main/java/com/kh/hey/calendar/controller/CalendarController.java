package com.kh.hey.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CalendarController {
	
	@RequestMapping("myCalendar.ca")
	public String myCalendar() {
		
		return "calendar/myCalendar";	
		
	}
	
	@RequestMapping("teamCalendar.ca")
	public String teamCalendar() {
		
		return "calendar/teamCalendar";	
		
	}

}
