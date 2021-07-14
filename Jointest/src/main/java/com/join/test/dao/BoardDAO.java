package com.join.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession session;
	
	public ArrayList<HashMap<String, Object>> boardSelectAll(){
		
		ArrayList<HashMap<String, Object>> boardList = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardList = mapper.boardSelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}

}
