package com.conimal.spring.board.service;

import java.util.ArrayList;

import com.conimal.spring.board.model.vo.Board;
import com.conimal.spring.common.model.vo.PageInfo;

public interface BoardService {
	
	int selectListCount();
	ArrayList<Board> selectBoardList(PageInfo pi);
	
	int searchListCount(String keyword);
	ArrayList<Board> searchBoardList(String keyword, PageInfo pi);
	
}
