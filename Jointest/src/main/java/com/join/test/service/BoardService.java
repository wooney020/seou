package com.join.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.join.test.dao.BoardDAO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	
	
public ArrayList<HashMap<String, Object>> boardSelectAll(){
		
	ArrayList<HashMap<String, Object>> boardList = null;
	boardList = dao.boardSelectAll();
	
	return boardList;
		
		
}
}
