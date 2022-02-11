package com.kh.hey.reserve.model.vo;

import java.sql.Date;

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
public class Reservation {
	
	private String reserveNo;
	private String userNo;
	private String resourcesNo;
	private String categoryName;
	private String resourceName;
	private String startDate;
	private String endDate;
	private Date reserveDate;
	private String reserveContent;

}
