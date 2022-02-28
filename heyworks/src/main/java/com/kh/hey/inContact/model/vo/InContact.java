package com.kh.hey.inContact.model.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.hey.inContact.model.service.InContactService;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class InContact {
	
	private int inconNo;
	private int userNo;
	private int inGroupNo;
	private String inGroupName;
	private String userName;
	private String email;
	private String phone;
	private String call;
	private int deptCode;
	private String deptName;
	private int jobCode;
	private String jobName;
	private String address;
	private String addressDetail;
	private String birth;
	
}
