package com.swdo.test.dao;


import com.swdo.test.vo.ApplierVO;

public interface ApplierMapper {
	
	public int applierInsert(ApplierVO applier);
	public ApplierVO applierSelectOne(ApplierVO applier);

}
