package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

public interface BookService {

	List<BoardVO> getBList(String mem_id);

	List<BoardVO> getSearchBook(HashMap<String, Object> searchMap);

	List<BoardVO> getSearchScrollBook(HashMap<String, Object> searchMap);
	
	List<BoardVO> recomBook();
	
	MemberVO getMember(String mem_id);

	void createBook(HashMap<String, Object> bm);

	List<BookVO> selectBookList(BookVO b);

	List<BoardVO> getBKList(int book_no);

}
