package com.kh.hey.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.common.template.Pagination;
import com.kh.hey.employee.model.vo.Employee;
import com.kh.hey.message.model.service.MessageService;
import com.kh.hey.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService msgService;
	
	// 받은쪽지함 리스트
	@RequestMapping("list.inMsg")
	public String listInMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		// 로그인유저 사번 알아오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> inList = msgService.listInMsg(userNo, pi);
		
		
		if(inList != null) {
			//System.out.println(inList);
			session.setAttribute("inList", inList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/inMsgList";
		}else {
			System.out.println("받은메세지 불러오기 실패");
			return "message/inMsgList";
		}
		
		
	}
	
	// 쪽지 상세보기
	@RequestMapping("detail.msg")
	public String detailInMsg(HttpSession session, Model model, int mno) {
		
		Message msg = msgService.detailInMsg(mno);
		
		if(msg != null) {
			session.setAttribute("msg", msg);
			return "message/inMsgDetailView";
		}else {
			System.out.println("상세보기 불러오기 실패");
			return "message/inMsgDetailView";
		}
		
	}
	
	// 쪽지 삭제하기
	
	// 쪽지 보관하기
	
	// 쪽지 검색하기
	@RequestMapping("search.msg")
	public String searchInMsg(String userName, HttpSession session, Model model) {
		
		// 로그인 유저 사번 가져오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		Message msg = new Message(userName, userNo);
		
		ArrayList<Message> inList = msgService.searchInMsg(msg);
		
		if(inList != null) {
			session.setAttribute("inList", inList);
			return "message/searchInMsgList";
		}else {
			System.out.println("검색실패");
			return "message/inMsgList";
		}
	}
	
	
	
	

}
