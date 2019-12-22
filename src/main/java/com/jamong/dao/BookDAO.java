package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;

public interface BookDAO {

	List<BoardVO> getBList(String mem_id);

	void insertBook(BookVO b);

	void book_noSEL(String bo_no);

	void book_noUP(int book_no);

}
