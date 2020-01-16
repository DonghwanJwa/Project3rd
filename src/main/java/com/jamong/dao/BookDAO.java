package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

public interface BookDAO {

	void insertBook(HashMap<String, Object> bm);
	void recommendUpUpdate(BookVO bk);
	void recommendDownUpdate(BookVO bk);
	void bookDel(int book_no);
	List<BoardVO> getBList(String mem_id);
	List<BoardVO> getSearchBook(HashMap<String, Object> searchMap);
	List<BoardVO> getSearchScrollBook(HashMap<String, Object> searchMap);
	List<BoardVO> recomBook();
	List<BoardVO> selectBookList(BookVO b);
	List<BoardVO> myBookList(int mem_no);
	List<BoardVO> bookScroll(HashMap<String, Object> bookScroll);
	List<BoardVO> categoryArticleBK(String cat_name);
	List<BoardVO> bookBannerList();
	List<BookVO> chartBookCount();
	MemberVO getMember(String mem_id);
	BoardVO bookInnerInfo(int book_no);
	BookVO getBook(int book_no);
	int selectBookNo(HashMap<String, Object> bm);
	int recommendNum(BookVO bk);



}
