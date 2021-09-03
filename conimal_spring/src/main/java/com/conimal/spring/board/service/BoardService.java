package com.conimal.spring.board.service;

import java.util.ArrayList;

import com.conimal.spring.board.model.vo.Board;

public interface BoardService {
	
	int selectListCount();
	ArrayList<Board> selectBoardList(int listCount);
	
}
