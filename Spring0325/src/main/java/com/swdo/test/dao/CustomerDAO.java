package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

@Repository
public class CustomerDAO {
	@Autowired
	private SqlSession session;
	
	public int customerInsert(CustomerVO customer) {
		
		int cnt = 0;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.customerInsert(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return cnt;
	}

	public CustomerVO customerSelectOne(String customer_id) {
		CustomerVO result = null;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			result = mapper.customerSelectOne(customer_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public ProfileVO profileSelect(String customer_id) {
	      ProfileVO profile=null;
	      try {
	         CustomerMapper mapper = session.getMapper(CustomerMapper.class);
	         profile = mapper.profileSelect(customer_id);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return profile;
	   }
	   
	
	public int profileInsert(ProfileVO profile) {
		int cnt = 0;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.profileInsert(profile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
