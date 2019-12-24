package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.BookDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BoardDAO boardDao;
	
	@Autowired
	private BookDAO bookDao;

	@Override
	public List<BoardVO> getBList(String mem_id) {
		return this.bookDao.getBList(mem_id);
	}

	@Override
	public List<BookVO> getSearchBook(HashMap<String, Object> searchMap) {
		return this.bookDao.getSearchBook(searchMap);
	}


	@Override
	public MemberVO getMember(String mem_id) {
		return this.bookDao.getMember(mem_id);
	}
	
	@Transactional
	@Override
	public void createBook(HashMap<String, Object> bm) {
		this.bookDao.insertBook(bm);
		int book_no = this.bookDao.selectBookNo(bm);
		bm.put("book_no",book_no);
		this.boardDao.updateBookNo(bm);
	}

}
