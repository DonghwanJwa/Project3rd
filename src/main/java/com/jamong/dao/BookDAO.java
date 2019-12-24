package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

public interface BookDAO {

	List<BoardVO> getBList(String mem_id);

	void insertBook(HashMap<String, Object> bm);

	List<BookVO> getSearchBook(HashMap<String, Object> searchMap);

	MemberVO getMember(String mem_id);

	int selectBookNo(HashMap<String, Object> bm);

}
