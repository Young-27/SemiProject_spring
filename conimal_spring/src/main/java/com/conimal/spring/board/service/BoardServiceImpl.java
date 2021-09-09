package com.conimal.spring.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conimal.spring.board.model.dao.BoardDao;
import com.conimal.spring.board.model.vo.Board;
import com.conimal.spring.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return bDao.selectBoardList(sqlSession, pi);
	}

	@Override
	public ArrayList<Board> searchBoardList(String keyword, PageInfo pi) {
		return bDao.searchBoardList(sqlSession, keyword, pi);
	}

	@Override
	public int searchListCount(String keyword) {
		return bDao.searchListCount(sqlSession, keyword);
	}

}
