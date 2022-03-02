package com.kh.hey.calendar.model.vo;

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

public class Calendar {
	
	private int userNo;
	private String id;
	private String calendarId;
	private String title;
	private String category;
	private String start;
	private String end;
	private String location;
	private String userName;
	private String state;
}
