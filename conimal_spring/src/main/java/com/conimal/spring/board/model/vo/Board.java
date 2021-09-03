package com.conimal.spring.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Board {
	private int bno;
	private String bRefType;
	private String bTitle;
	private String bWrtier;
	private Date bDate;
	private int bCount;
}
