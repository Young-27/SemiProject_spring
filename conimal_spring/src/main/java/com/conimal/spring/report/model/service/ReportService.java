package com.conimal.spring.report.model.service;

import java.util.ArrayList;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.report.model.vo.Report;

public interface ReportService {
	
	int selectListCount();
	ArrayList<Report> selectReportList(PageInfo pi);

}
