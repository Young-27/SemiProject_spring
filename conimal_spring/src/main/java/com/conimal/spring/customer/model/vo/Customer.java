package com.conimal.spring.customer.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Customer {
	private int queNo;
	private String queId;
	private String queTitle;
	private String queContent;
	private Date queDate;
	private String ansStatus;
	private String ansContent;
	private Date ansDate;
}
