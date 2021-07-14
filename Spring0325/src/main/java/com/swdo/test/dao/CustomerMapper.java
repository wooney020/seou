package com.swdo.test.dao;

import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

public interface CustomerMapper {
	//회원가입
	public int customerInsert(CustomerVO customer);
	//특정 회원 조회
	public CustomerVO customerSelectOne(String customer_id);
	
	//프로필 조회
	public ProfileVO profileSelect(String customer_id);
	
	//프로필 등록
	public int profileInsert(ProfileVO profile);
}
