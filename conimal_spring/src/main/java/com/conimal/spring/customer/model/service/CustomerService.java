package com.conimal.spring.customer.model.service;

import java.util.ArrayList;

import com.conimal.spring.common.model.vo.PageInfo;
import com.conimal.spring.customer.model.vo.Customer;

public interface CustomerService {

	int selectListCount();
	ArrayList<Customer> selectCustomerList(PageInfo pi);
}
