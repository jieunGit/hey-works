package com.kh.hey.message.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수생성자
@Setter // setter메소드
@Getter // getter메소드
@ToString
public class Message {
	
	private int inMsgNo; // 받은쪽지번호
	private int recvNo; // 수신인 사번
	private int outMsgNo; // 보낸쪽지번호
	private String status; // 상태값
	private String userName; // 발송인 이름
	
	private int sentNo; // 발송인 사번
	private String outMsgContent; // 쪾지내용
	private String msgDate; // 발송날짜
	private int userNo; // 발송인 이름
	
}
