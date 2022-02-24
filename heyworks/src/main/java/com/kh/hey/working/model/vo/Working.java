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
	
	private String tnaDay; // 요일
	private String userName;
	private int workTime; // 근무시간
	private int overTime; // 연장시간 

	private String startDate;
	private String endDate;
	private String start;
	private String end;
	
	private String deptName;
	private String jobName;
	
	private int rowNum;
}
