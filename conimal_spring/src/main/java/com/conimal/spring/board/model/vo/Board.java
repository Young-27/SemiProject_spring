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
	private String refType;
	private String bTitle;
	private String bWriter;
	private Date bDate;
	private int bCount;
	
	public Board(int bno, String refType, String bTitle, String bWriter, Date bDate, int bCount) {
		super();
		this.bno = bno;
		this.refType = refType;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bDate = bDate;
		this.bCount = bCount;
	}
	
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	
	
}
