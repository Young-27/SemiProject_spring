package com.conimal.spring.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.report.model.dao.ReportDao;
import com.conimal.spring.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao rDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return rDao.selectReportList(sqlSession, pi);
	}
	
	

}
