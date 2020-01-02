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

	BoardVO bookInnerInfo(int book_no);

	List<BoardVO> bookInfoCont(HashMap<String, Object> binfo);

	BookVO getBook(int book_no);

	List<BoardVO> myBookList(int mem_no);

	int recommendUp(BookVO bk);

	int recommendDown(BookVO bk);

	List<BoardVO> bkEditList(HashMap<String, Object> be);

	List<BoardVO> bookScroll(HashMap<Object, Object> bookScroll);

	void bookDel(int book_no);

	List<BoardVO> categoryArticleBK(String cat_name);

	List<BoardVO> bookBannerList();

}
