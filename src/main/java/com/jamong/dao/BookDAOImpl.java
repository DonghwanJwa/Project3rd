package com.jamong.dao;

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
	public void insertBook(BookVO b) {
		this.sqlSession.insert("book_in",b);
	}

}