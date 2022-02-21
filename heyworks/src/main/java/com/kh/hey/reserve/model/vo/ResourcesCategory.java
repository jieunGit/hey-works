package com.kh.hey.reserve.model.vo;

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
//package explore 에서 확인가능
public class ResourcesCategory {
	
	private String categoryNo;
	private String categoryName;
	private String status;
	private String categoryContent;
	private String categoryImg;
	private String count;

}
