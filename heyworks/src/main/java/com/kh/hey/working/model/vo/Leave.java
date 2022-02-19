package com.kh.hey.working.model.vo;

import java.sql.Date;

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
public class Leave {

	// 휴가신청 테이블
	private int leaveAno; 
	private int userNo; 
	private Date applyDate;
	private String leaveType;
	private String startDate; 
	private String endDate; 
	private int leaveUse; 
	private String reason; 
	private String status;
	
	private String userName;
	private String deptName;
}
