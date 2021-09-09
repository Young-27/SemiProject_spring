package com.conimal.spring.customer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.customer.model.vo.Customer;

@Repository
public class CustomerDao {
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("customerMapper.selectListCount");
	}
	
	public ArrayList<Customer> selectCustomerList(SqlSession sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("customerMapper.selectCustomerList", null, rowBounds);
	}
	
}
