package com.kh.hey.message.model.service;

import java.util.ArrayList;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.vo.Message;

public interface MessageService {
	
	// - 페이징처리에 필요한 listCount 요청
	int countList(int userNo);
	
	// 받은쪽지함 리스트
	ArrayList<Message> listInMsg(int recvNo, PageInfo pi);
	
	// 받은쪽지함 상세보기
	Message detailInMsg(int mno);
	
	// 받은쪽지함 삭제하기
	int deleteInMsg(int inMsgNo);
	
	// 받은쪽지함 보관함
	int keepInMsg(int inMsgNo);
	
	// 받은쪽지함 검색하기
	ArrayList<Message> searchInMsg(Message msg);

	// 받은쪽지함 답장하기
	int replyMsg();
	
	// 쪽지보내기
	int sentMsg();

}
