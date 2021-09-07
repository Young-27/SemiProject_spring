package com.conimal.spring.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.report.model.vo.Report;

@Repository
public class ReportDao {

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}
	
	public ArrayList<Report> selectReportList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList", null, rowBounds);
	}
	
}
