package com.swdo.test.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.CustomerVO;

@Repository
public class CustomerDAO {

	@Autowired
	private SqlSession session;
	
	public CustomerVO customerLogin(CustomerVO customer) {
		CustomerVO result = null;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			result = mapper.customerLogin(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	}
	
	
	

