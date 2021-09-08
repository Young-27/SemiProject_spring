package com.conimal.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.conimal.spring.board.model.vo.Board;
import com.conimal.spring.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectBoardList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", null, rowBounds);
	}
	
	public int searchListCount(SqlSession sqlSession, String keyword) {
		return sqlSession.selectOne("boardMapper.searchListCount", keyword);
	}
	
	public ArrayList<Board> searchBoardList(SqlSession sqlSession, String keyword, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchBoardList", keyword);
	}
	
}
