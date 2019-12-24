package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

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
	public MemberVO getMember(String mem_id) {
		return this.sqlSession.selectOne("mem_myinfo",mem_id);
	}

	@Override
	public void insertBook(HashMap<String, Object> bm) {
		this.sqlSession.insert("book_in",bm);
	}

	@Override
	public int selectBookNo(HashMap<String, Object> bm) {
		return this.sqlSession.selectOne("book_sel",bm);
	}

}