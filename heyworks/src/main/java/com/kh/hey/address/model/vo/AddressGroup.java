package com.kh.hey.address.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class AddressGroup {

	private String groupNo;
	private String userNo;
	private String groupName;
	private String groupStatus;

}
