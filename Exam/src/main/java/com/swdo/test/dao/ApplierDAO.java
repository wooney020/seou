package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.ApplierVO;

@Repository
public class ApplierDAO {
	
	@Autowired
	private SqlSession session;
	
	public int applierInsert(ApplierVO applier) {
		int cnt = 0;
		try {
			ApplierMapper mapper = session.getMapper(ApplierMapper.class);
			cnt = mapper.applierInsert(applier);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	public ApplierVO applierSelectOne(ApplierVO applier) {
		ApplierVO result = null;
		try {
			ApplierMapper mapper = session.getMapper(ApplierMapper.class);
			result = mapper.applierSelectOne(applier);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

}
