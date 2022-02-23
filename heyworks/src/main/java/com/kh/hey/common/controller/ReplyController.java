package com.kh.hey.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hey.common.model.service.ReplyService;
import com.kh.hey.common.model.vo.Reply;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService rService;
	
	@ResponseBody
	@RequestMapping(value="rlist.rp", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(String ano) {
		
		ArrayList<Reply> rlist = rService.ajaxSelectReplyList(ano);
		
		return new Gson().toJson(rlist);
	} // 댓글 조회용
	
	@ResponseBody
	@RequestMapping(value="rinsert.rp")
	public String ajaxInsertReply(Reply r) {
		
		int result = rService.ajaxInsertReply(r);
		
		return result > 0 ? "S" : "F";
	} // 댓글 작성용
	
	@ResponseBody
	@RequestMapping(value="delete.rp")
	public String ajaxDeleteReply(String replyNo) {
		
		System.out.println(replyNo);
		
		int result = rService.ajaxDeleteReply(replyNo);
		
		return result > 0 ? "S" : "F";
	} // 댓글 삭제용
	
	@ResponseBody
	@RequestMapping(value="update.rp")
	public String ajaxUpdateReply(Reply r) {
		
		System.out.println(r);
		
		int result = rService.ajaxUpdateReply(r);
		System.out.println(result);
		
		return result > 0 ? "S" : "F";
	} // 댓글 수정용
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
