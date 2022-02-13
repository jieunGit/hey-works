package com.kh.hey.approval.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Approval {
	
	// 전자결재 메인테이블
	private String approvalNo;
	private String userNo;
	private String formNo;
	private String writeDept;
	private String approvalTitle;
	private String emergancy;
	private String storageYear;
	private String grade;
	private String read;
	private String readStatus;
	private String reference;
	private String referenceStatus;
	private Date createDate;
	private String status;
	private String originName;
	private String filePath;
	
	// 업무기안서
	private String businessDraftContent;
	
	// 비품구매품의서
	private String requestTeam;
	private String limitDate;
	private String pay;
	private String purpose;
	private String totalPay;
	
	// 비품구매목록
	private String itemNo;
	private int itemSequence;
	private String itemName;
	private String itemSize;
	private String unit;
	private int total; // 비품수량
	private String amount;
	private String note;
	
	// 증명서신청
	private String certificateType;
	private String use;
	private String whereSubmit;
	private String submitDate;
	private String certificateContent;
	
	// 채용요청서
	private String recruimentDept;
	private int employee;
	private String workExperience;
	private String offerDate;
	private String qualification;
	private String position;
	private String recruimentContent;
	
	// 일반품의서
	private String imposition;
	private String expenseReportContent;
	
	// 결재선
	private String confirmNo;
	private String firstUser;
	private String secondUser;
	private String thirdUser;
	private String firstConfirm;
	private String secondConfirm;
	private String thirdConfirm;
	private String firstReject;
	private String secondReject;
	private String thirdReject;
	private String firstDate;
	private String secondDate;
	private String thirdDate;
	private String firstJcode;
	private String secondJcode;
	private String thirdJcode;
	private int procedure;
	private String confirmStatus;
	private String rejectReason;
	private String confirmDate;
	

}
