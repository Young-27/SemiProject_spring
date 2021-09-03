package com.conimal.spring.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.conimal.spring.board.model.vo.Board;

public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	
	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Board> selectBoardList(int listCount) {
		return null;
	}

}
