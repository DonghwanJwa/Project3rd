package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

public interface BookService {

	List<BoardVO> getBList(String mem_id);

	List<BookVO> getSearchBook(HashMap<String, Object> searchMap);

	MemberVO getMember(String mem_id);

	void createBook(HashMap<String, Object> bm);

}
