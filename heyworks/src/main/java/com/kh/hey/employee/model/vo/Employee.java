package com.kh.hey.employee.model.vo;

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
public class Employee {
	

	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String email;
	private String birth;
	private String phone;
	private String call;
	private String post;
	private String address;
	private String addressDetail;
	private String hireDate;
	private String endDate;
	private String status;
	private String deptCode;
	private String jobCode;
	private String adminYn;
	private String image;
	
	// 전자결재용
	private String jobName;
	private String deptName;

}
