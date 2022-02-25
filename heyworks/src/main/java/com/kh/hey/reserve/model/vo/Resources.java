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
public class Resources {
	
	private String resourcesNo;
	private String categoryNo;
	private String resourceName;
	private String status;
	private String resourceContent;
	private String categoryName;
	
}
