package com.kh.hey.todo.model.vo;

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
public class todolist {
	
	private String checkNo;
	private String todoContent;
	private String checkStatus;
	private String userNo;
	private String todoDate;
	

}
