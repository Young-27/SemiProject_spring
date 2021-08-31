package com.conimal.spring.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String email;
	private Date enrollDate;
	private String status;
	private int memCode;
}
