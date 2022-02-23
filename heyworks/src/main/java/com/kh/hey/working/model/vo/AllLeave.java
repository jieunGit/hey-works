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
public class AllLeave {

	// 연간 휴가현황
	private int leaveCno;
	private int userNo;
	private int lengthYears;
	private Date createDate;
	private int leaveTotal;
	private int leaveUse;
	private int leaveRest;
	private String status;
	
	private String userName;
	private String deptName;
	private String hireDate;
	private String jobName;
}
