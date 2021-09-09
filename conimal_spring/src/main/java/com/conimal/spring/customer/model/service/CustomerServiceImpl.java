package com.conimal.spring.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.customer.model.dao.CustomerDao;
import com.conimal.spring.customer.model.vo.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao cDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return cDao.selectListCount(sqlSession);
	}
	
	public ArrayList<Customer> selectCustomerList(PageInfo pi){
		return cDao.selectCustomerList(sqlSession, pi);
	}
	
}
