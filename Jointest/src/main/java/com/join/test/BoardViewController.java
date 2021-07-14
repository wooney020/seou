package com.join.test;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.join.test.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardViewController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value ="/boardList", method = RequestMethod.GET)
	public String boardList(Model model) {
		//저장된 게시글 목록을 보내줌
		ArrayList<HashMap<String, Object>> boardList = service.boardSelectAll();
		model.addAttribute("boardList", boardList);
		return "/board/boardList";
	}
}
