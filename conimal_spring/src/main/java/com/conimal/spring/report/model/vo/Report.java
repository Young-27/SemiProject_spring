package com.conimal.spring.report.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Report {
	
	private int reportNo;	 		 		// 신고 고유번호
	private String reportWriter;	 		// 신고자 아이디
	private String refBoardType; 	 		// 게시판 타입 이름
	private int refBoardNo;					// 게시글 번호
	private String cpostTitle;		 		// 게시글 제목
	private String adoptTitle;	
	private String animalTitle;	
	private String donationTitle;	
	private String volunteerTitle;	
	private String reportReason;			 // 신고 사유
	private Date reportDate;		 		// 신고 날짜

}
