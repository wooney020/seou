package com.swdo.test.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.ReplyVO;


@RestController
@RequestMapping(value ="/board")
public class BoardRestController {
	
	@Autowired
	private BoardService service;
	
		//댓글 추가
	   @RequestMapping(value="/replyInsert",method=RequestMethod.POST)
	   public HashMap<String,Object> replyInsert(ReplyVO reply) {
	      System.out.println("전달받은 데이터"+reply);
	      service.replyInsert(reply);
	      
	      
	      //해당 글에 작성된 전체 댓글 정보가 필요하다 =댓글 목록 불러오기
	      HashMap<String,Object> map=service.replySelectList(reply.getBoard_no());//리플을 등록한 게시글의 번호를 꺼내서 작성된 댓글의 정보를 가져옴
	      return map;
	   }
	   
	   //댓글 삭제
	   @RequestMapping(value="/replyDelete",method=RequestMethod.POST)
	   public HashMap<String,Object> replyDelete(ReplyVO reply) {
	      System.out.println("전달받은 데이터"+reply);
	      service.replyDelete(reply);
	      
	      //해당 글에 작성된 전체 댓글 정보가 필요하다 =댓글 목록 불러오기
	      HashMap<String,Object> map=service.replySelectList(reply.getBoard_no());//리플을 등록한 게시글의 번호를 꺼내서 작성된 댓글의 정보를 가져옴
	      return map;
	   }
	   
	   @RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	   public HashMap<String, Object> replyUpdate(ReplyVO reply) {
		System.out.println("전달받은 데이터:"+reply); 
		service.replyUpdate(reply);
		
		HashMap<String, Object> map = service.replySelectList(reply.getBoard_no());
		
		return map;
	   }

}
