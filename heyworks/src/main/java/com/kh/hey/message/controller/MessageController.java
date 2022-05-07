package com.kh.hey.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.kh.hey.message.model.service.MessageService;
import com.kh.hey.message.model.vo.Message;
import com.kh.hey.organization.model.vo.Organ;

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
			//System.out.println("받은메세지 불러오기 실패");
			return "message/inMsgList";
		}
		
	}
	
	// 받은쪽지함 상세보기
	@RequestMapping("detail.inMsg")
	public String detailInMsg(HttpSession session, Model model, int inMsgNo) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		Message m = new Message();
		m.setRecvNo(userNo);
		m.setInMsgNo(inMsgNo);
		
		Message msg = msgService.detailInMsg(m);
		if(msg != null) {
			session.setAttribute("msg", msg);
			return "message/inMsgDetailView";
		}else {
			//System.out.println("상세보기 불러오기 실패");
			//System.out.println(msg);
			return "message/inMsgDetailView";
		}
		
	}
	
	// 받은쪽지함 삭제하기
	@RequestMapping("delete.inMsg")
	public void deleteInMsg(@RequestParam(value="mNos[]") List<Integer> mNos , HttpServletResponse response, Model model) {
		
		int result = msgService.deleteInMsg(mNos);
		//System.out.println(mNos);
		
		if(result > 0) {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	// 받은쪽지함 보관하기
	@RequestMapping("keep.inMsg")
	public void keepInMsg(@RequestParam(value="mNos[]") List<Integer> mNos , HttpServletResponse response, Model model) {
		
		int result = msgService.keepInMsg(mNos);
		//System.out.println(mNos);
		
		if(result > 0) {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	// 받은쪽지함 검색하기
	@RequestMapping("search.inMsg")
	public String searchInMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userName, HttpSession session, Model model) {
		
		// 로그인 유저 사번 가져오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		Message msg = new Message();
		msg.setUserNo(userNo);
		msg.setUserName(userName);
		
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> inList = msgService.searchInMsg(msg, pi);
		
		
		if(inList != null) {
			//System.out.println(inList);
			session.setAttribute("inList", inList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/inMsgList";
		}else {
			//System.out.println("받은메세지 불러오기 실패");
			return "message/inMsgList";
		}
		
	}
	
	// 받은쪽지 답장 폼
	@RequestMapping("reply.form")
	public String replyForm(int sentNo, String userName, HttpSession session) {
		session.setAttribute("sentNo", sentNo);
		session.setAttribute("userName", userName);
		return "message/responseMsgForm";
	}
	
	
	// 쪽지 작성 폼
	@RequestMapping("insert.form")
	public String insertForm() {
		return "message/sendMsgForm";
	}
	
	// 임직원 검색
	@ResponseBody
	@RequestMapping(value="search.name", produces="application/json; charset=UTF-8")
	public String searchKeyword(String userName) {
		ArrayList<Organ> list = msgService.searchKeyword(userName);
		return new Gson().toJson(list);
	}
	
	// 쪽지 작성하기
	@RequestMapping("insert.msg")
	public String sentMsg(Message m, HttpSession session, Model model) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		m.setSentNo(userNo);
		
		System.out.println(m);
		
		int result2 = msgService.sentOutMsg(m);
		int result1 = msgService.sentInMsg(m);
		
		if(result1 + result2 > 1) {
			return "redirect:list.inMsg";
		}else {
			return "redirect:list.inMsg";
		}
		
	}
	
	// 보낸쪽지함 리스트
	@RequestMapping("list.outMsg")
	public String listOutMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		// 로그인유저 사번 알아오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countOutList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> outList = msgService.listOutMsg(userNo, pi);
		
		if(outList != null) {
			//System.out.println(inList);
			session.setAttribute("outList", outList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/outMsgList";
		}else {
			//System.out.println("받은메세지 불러오기 실패");
			return "message/outMsgList";
		}
		
	}
	
	// 보낸쪽지함 상세보기
	@RequestMapping("detail.outMsg")
	public String detailOutMsg(HttpSession session, Model model, int outMsgNo) {
		
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		Message m = new Message();
		m.setSentNo(userNo);
		m.setOutMsgNo(outMsgNo);
		
		Message msg = msgService.detailOutMsg(m);
		if(msg != null) {
			session.setAttribute("msg", msg);
			return "message/outMsgDetailView";
		}else {
			//System.out.println("상세보기 불러오기 실패");
			//System.out.println(msg);
			return "message/outMsgDetailView";
		}
		
	}
	
	// 보낸쪽지함 삭제하기
	@RequestMapping("delete.outMsg")
	public void deleteOutMsg(@RequestParam(value="mNos[]") List<Integer> mNos , HttpServletResponse response, Model model) {
		
		int result = msgService.deleteOutMsg(mNos);
		//System.out.println(mNos);
		
		if(result > 0) {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	// 보낸쪽지함 검색하기
	@RequestMapping("search.outMsg")
	public String searchOutMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userName, HttpSession session, Model model) {
		
		// 로그인 유저 사번 가져오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		Message msg = new Message();
		msg.setSentNo(userNo);
		msg.setUserName(userName);
		
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countOutList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> outList = msgService.searchOutMsg(msg, pi);
		
		
		if(outList != null) {
			//System.out.println(inList);
			session.setAttribute("outList", outList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/outMsgList";
		}else {
			//System.out.println("받은메세지 불러오기 실패");
			return "message/outMsgList";
		}
		
	}
	
	// 보관함 리스트
	@RequestMapping("list.keepMsg")
	public String listKeepMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		// 로그인유저 사번 알아오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countKeepList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> keepList = msgService.listKeepMsg(userNo, pi);
		
		if(keepList != null) {
			session.setAttribute("keepList", keepList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/keepMsgList";
		}else {
			//System.out.println("받은메세지 불러오기 실패");
			return "message/keepMsgList";
		}
		
	}
	
	// 보관함함 검색하기
	@RequestMapping("search.keepMsg")
	public String searchKeepMsg(@RequestParam(value="cpage", defaultValue="1") int currentPage, String userName, HttpSession session, Model model) {
		
		// 로그인 유저 사번 가져오기
		int userNo = ((Employee)session.getAttribute("loginUser")).getUserNo();
		
		Message msg = new Message();
		msg.setUserNo(userNo);
		msg.setUserName(userName);
		
		// 쪽지 갯수 (listCount) 조회요청
		int listCount = msgService.countKeepList(userNo);
		//페이징처리
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		// 사번, 페이징 넘기며 받은 쪽지 조회요청
		ArrayList<Message> keepList = msgService.searchKeepMsg(msg, pi);
		
		
		if(keepList != null) {
			//System.out.println(inList);
			session.setAttribute("keepList", keepList);
			session.setAttribute("pi", pi);
			session.setAttribute("count", listCount);
			return "message/keepMsgList";
		}else {
			//System.out.println("받은메세지 불러오기 실패");
			return "message/keepMsgList";
		}
		
	}
	
	

}
