package com.conimal.spring.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class PageInfo {
	
	private int listCount;		// 총 게시글 개수
	private int currentPage;	// 현재 페이지
	private int pageLimit;		// 보여질 페이징바의 개수
	private int boardLimit;		// 한 번에 보여질 게시글 개수
	
	private int startPage;		// 시작페이지
	private int maxPage;		// 총 페이지 수
	private int endPage;		// 끝 페이지
	
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int startPage, int maxPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.startPage = startPage;
		this.maxPage = maxPage;
		this.endPage = endPage;
	}
	
	
	
	
	
}
