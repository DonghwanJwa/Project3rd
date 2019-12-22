package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> getBList(String mem_id) {
		return this.sqlSession.selectList("book_list",mem_id);
	}

	@Override
	public List<BookVO> getSearchBook(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_book",searchMap);
	}

	@Override
	public void insertBook(BookVO b) {
		this.sqlSession.insert("book_in",b);
	}

	@Override
	public void book_noSEL(String bo_no) {
		this.sqlSession.selectList("book_no", bo_no);
	}

	@Override
	public void book_noUP(int book_no) {
		this.sqlSession.update("book_no_up",book_no);
	}

}