package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

public interface BookDAO {

	List<BoardVO> getBList(String mem_id);

	void insertBook(HashMap<String, Object> bm);

	List<BoardVO> getSearchBook(HashMap<String, Object> searchMap);
	
	List<BoardVO> getSearchScrollBook(HashMap<String, Object> searchMap);

	List<BoardVO> recomBook();
	
	MemberVO getMember(String mem_id);

	int selectBookNo(HashMap<String, Object> bm);

	List<BookVO> selectBookList(BookVO b);

	BoardVO bookInnerInfo(int book_no);

	BookVO getBook(int book_no);

	List<BoardVO> myBookList(int mem_no);

	void recommendUpUpdate(BookVO bk);

	int recommendNum(BookVO bk);

	void recommendDownUpdate(BookVO bk);

	List<BoardVO> bookScroll(HashMap<Object, Object> bookScroll);


}
