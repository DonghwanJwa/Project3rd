package com.jamong.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;

public interface BoardService {

	void insertBoard(BoardVO b);	
	BoardVO getUserBoardCont(int bo_no);
	List<BoardVO> getListAll(BoardVO b);
	List<BoardVO> recomArticle();
	List<BoardVO> infinitiScrollDown(int bo_no);
	List<BoardVO> categoryArticle(String cat_name);

}
