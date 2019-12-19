package com.jamong.service;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;

public interface BookService {

	List<BoardVO> getBList(String mem_id);

	void insertBook(BookVO b);

	void book_noUP(String val);

}
