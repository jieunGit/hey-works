package com.kh.hey.todo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@AllArgsConstructor //매개변수생성자
@Setter
@Getter
@ToString
public class Memo {
	
	private String memoNo;
	private String userNo;
	private String memoContent;
	private String status;
	private String memoColor;
	private String memoDate;
	
	

}
