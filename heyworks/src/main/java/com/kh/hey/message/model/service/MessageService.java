package com.kh.hey.message.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.hey.common.model.vo.PageInfo;
import com.kh.hey.message.model.vo.Message;
import com.kh.hey.organization.model.vo.Organ;

public interface MessageService {
	
	// - 페이징처리에 필요한 listCount 요청
	// 받은쪽지함용
	int countList(int userNo);
	// 보낸쪽지함용
	int countOutList(int userNo);
	// 보관함용
	int countKeepList(int userNo);
	// 휴지통용
	int countDelList(int userNo);
	
	// 받은쪽지함 리스트
	ArrayList<Message> listInMsg(int userNo, PageInfo pi);
	
	// 받은쪽지함 상세보기
	Message detailInMsg(Message m);
	
	// 받은쪽지함 삭제하기
	int deleteInMsg(List<Integer> mNos);
	
	// 받은쪽지함 보관하기
	int keepInMsg(List<Integer> mNos);
	
	// 받은쪽지함 검색하기
	ArrayList<Message> searchInMsg(Message msg, PageInfo pi);
	
	// 쪽지보내기(in/out동시에 insert)
	// 임직원 검색
	int sentOutMsg(Message m);
	int sentInMsg(Message m);
	ArrayList<Organ> searchKeyword(String userName);
	
	// 보낸쪽지함 리스트
	ArrayList<Message> listOutMsg(int userNo, PageInfo pi);
	
	// 보낸쪽지함 상세보기
	Message detailOutMsg(Message m);
	
	// 보낸쪽지함 삭제하기
	int deleteOutMsg(List<Integer> mNos);
	
	// 보낸쪽지함 검색하기
	ArrayList<Message> searchOutMsg(Message msg, PageInfo pi);
	
	// 보관함 리스트
	ArrayList<Message> listKeepMsg(int userNo, PageInfo pi);
	
	// 보관함 검색하기
	// 받은쪽지함 검색하기
	ArrayList<Message> searchKeepMsg(Message msg, PageInfo pi);

}
