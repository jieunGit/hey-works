package com.kh.hey.common.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Reply {
	
	private String replyNo;
	private String userNo;
	private String replyContent;
	private String createDate;
	private String refBoardNo;
	private String status;
	
	private String jobName;

}
