package com.kh.hey.working.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor 
@Setter
@Getter
@ToString
public class Working {

	// 근태관리 테이블
	private int tnaNo;
	private int userNo;
	private String tnaDate;
	private String clockIn;
	private String clockOut;
	private String tnaStatus;
	
}
