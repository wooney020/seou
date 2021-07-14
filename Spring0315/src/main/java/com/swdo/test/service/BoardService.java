package com.swdo.test.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.controller.BoardViewController;
import com.swdo.test.dao.BoardDAO;
import com.swdo.test.util.FileService;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ReplyVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletResponse response; //응답 객체. 서버에서 클라이언트에 주고싶다면
	
	
	private static final String UPLOAD_PATH = "/uploadfiles";
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	
	
	public void boardInsert(BoardVO board , MultipartFile upload) {
		
		CustomerVO customer = (CustomerVO) session.getAttribute("loginVO");//로그인 정보가 들어있음.
		board.setCustomer_id(customer.getCustomer_id());
		
		if(!upload.isEmpty()) { //첨부파일이 비어있지 않을 때 (=있을때)
			logger.info("전송된 파일 정보: {}",upload);
			//실제로 업로드 된 파일을 서버에 저장하고 저장된 파일명칭과 원본 파일명칭을 board객체에 세팅
			String savedfile = FileService.saveFile(upload, UPLOAD_PATH);
			board.setBoard_saved(savedfile);
			board.setBoard_original(upload.getOriginalFilename());
			
		}
		
		int cnt = dao.boardInsert(board);
		
		
	
		if(cnt == 0) {
			logger.info("글 등록 실패 : {}", board);
		}else {
			logger.info("글 등록 성공 : {}" ,board);
			
		}
		
	}
	
	public ArrayList<HashMap<String,Object>> boardSelectAll(String searchText , int startRecord, int countPerPage){
		
		ArrayList<HashMap<String,Object>> list = dao.boardSelectAll(searchText,  startRecord, countPerPage);
		logger.info("글 전체 목록 조회: {}",list);
		return list;
	}
	
	public HashMap<String, Object> boardSelectOne(int board_no) {
		HashMap<String, Object> board = dao.boardSelectOne(board_no);
		logger.info("특정 글 조회: {}",board);
		return board;
	}
	
	public void boardDelete(BoardVO board) {
		//로그인 한 사람의 정보를 가져와서 그 아이디를 setting 해준다. // (로그인한 정보를 board에 넣어줘야 sql 구문에서 로그인한 사람 id와 작성자의 id를 비교할 수 있음)
		CustomerVO customer = (CustomerVO) session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		//조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		//DB에서 삭제
		int cnt =dao.boardDelete(board);
		
		
		if(cnt == 0) {
			logger.info("글 삭제 실패: {}", board);
			
		}else {
			
			logger.info("글 삭제 성공: {}", board);
			//첨부파일이 있을때만 해야한다
			if(result.get("board_saved") != null) {
			String fullPath = UPLOAD_PATH+"/"+result.get("board_saved");
			boolean flag = FileService.deleteFile(fullPath);
			
			if(flag) {
				logger.info("첨부파일 삭제 성공");
			}else {
				logger.info("첨부파일 삭제 실패");
			}}
		}

	}

	public void boardUpdate(BoardVO board , MultipartFile upload) {
		//로그인 한 사람의 정보를 가져와서 그 아이디를 setting 해준다. // (로그인한 정보를 board에 넣어줘야 sql 구문에서 로그인한 사람 id와 작성자의 id를 비교할 수 있음)
		CustomerVO customer = (CustomerVO) session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		//수정 전 파일이 있는지 조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		String savedFileName =null;
		String originalFileName = null;
		if(!upload.isEmpty()) {//파일이 담긴 upload가 비어있지 않다면 수정.( 새로운 파일이 없다면 파일 삭제가 안 되기 위해)

			if(result.get("board_saved") != null ) {//원본에 파일이 있는경우
			//파일삭제
				String fullPath = UPLOAD_PATH+"/"+result.get("board_saved");
				FileService.deleteFile(fullPath);
				}
			//파일등록
			savedFileName = FileService.saveFile(upload, UPLOAD_PATH);
			originalFileName = upload.getOriginalFilename();
			
			//board객체에 세팅
			board.setBoard_original(originalFileName);
			board.setBoard_saved(savedFileName);
		}

		//수정
		int cnt =dao.boardUpdate(board);
				
		if(cnt == 0) {
			logger.info("글 수정 실패: {}", board);
					
		}else {
			logger.info("글 수정 성공: {}", board);
		}
	}
	
	public void download(int board_no) {
		//전달받은 PK로 글 정보 조회
		HashMap<String, Object> board = dao.boardSelectOne(board_no);
		//원본파일명
		String originalFileName = (String) board.get("board_original");
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(originalFileName,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		//저장된 파일의 전체 경로
		String fullPath = UPLOAD_PATH+"/"+board.get("board_saved"); //경로를 저장할 변수
		
		FileInputStream fis = null; //물리적인 파일을 서버로 입력하기 위한 통로
		ServletOutputStream sos = null; //응답객체를 출력하는 통로
		
		try {
			//통로개설
			fis = new FileInputStream(fullPath); //통로를 fullPath와 연결
			sos = response.getOutputStream();
			//통로를 통해 파일을 보냄
			FileCopyUtils.copy(fis, sos); // 가지고 있는 파일을 복사해서 전달. 어디에 있는지, 어디로 갈건지 를 적어줌.
			
			//통로 닫기 (순서대로 닫아야함. fis먼저 열었으므로 fis먼저 닫아줘야함.)
			fis.close();
			sos.close();
			
			
		} catch (IOException e) { //입출력예외
			e.printStackTrace();
		}
		
	}
	
	
	public int boardTotalRecord(String searchText) {
	
		int totalRecord = dao.boardTotalRecord(searchText);
		logger.info("전체 글 개수 :{}",totalRecord);
		return totalRecord;
		
	}
	
	public void replyInsert(ReplyVO reply) {
		//실행 전에 해야할 세팅이 있다.(customer_id을 추가해줘야함)
		CustomerVO loginVO = (CustomerVO) session.getAttribute("loginVO");
		reply.setCustomer_id(loginVO.getCustomer_id());
		
		int cnt = dao.replyInsert(reply);
		
		if(cnt == 0) {
			logger.info("댓글저장 실패");
		}else {
			logger.info("댓글저장 성공");
		}
		
		
	}
	
	public HashMap<String,Object> replySelectList(int board_no){
	      
	      ArrayList<ReplyVO> replyList =dao.replySelectList(board_no);//해당 글의 작성된 모든 리플 정보를 조회
	      
	      CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");//세션에 저장된 로그인 정보
	      String customer_id = loginVO.getCustomer_id();//로그인 정보에서 꺼낸 로그인 사용자 아이디
	      
	      //화면에 전달할 데이터를 저장한 자료구조
	      HashMap<String,Object> map = new HashMap<String,Object>();
	      map.put("replyList", replyList);
	      map.put("customer_id", customer_id);
	      
	      //세션에서 로그인 정보와 작성자의 정보를 비교해서 맞으면 댓글을 보여줘야 하는데
	      //리턴은 1개만 가능함 따라서 로그인 정보랑 저장된 댓글의 정보를 map에 담아서 뷰에 전달해줌
	      return map;
	   }
	
	public int replyDelete (ReplyVO reply) {
		
		int cnt = dao.replyDelete(reply);
		
		if(cnt == 0) {
			logger.info("댓글 삭제 실패");
		}else {
			logger.info("댓글 삭제 성공");
		}
		
		return cnt;
	}
	
	public void replyUpdate(ReplyVO reply) {
		int cnt = dao.replyUpdate(reply);
		
		
		if(cnt == 0) {
			logger.info("댓글 수정 실패");
		}else {
			logger.info("댓글 수정 성공");
		}
	
		
	}
	
	
}
