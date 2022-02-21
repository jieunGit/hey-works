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
	
	private int inMsgNo;
	private int recvNo;
	private int outMsgNo;
	private String status;
	private String userName;
	
	private int sentNo;
	private String outMsgContent;
	private String msgDate;
	private int userNo;
	
}
