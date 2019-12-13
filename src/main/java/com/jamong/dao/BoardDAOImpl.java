package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertBoard(BoardVO b) {
		this.sqlSession.insert("bo_insert", b);
	}

	@Override
	public BoardVO getUserBoardCont(int bo_no) {
		return this.sqlSession.selectOne("bo_cont",bo_no);
	}
	public List<BoardVO> getListAll(BoardVO b) {
		return this.sqlSession.selectList("bo_list", b);
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.sqlSession.selectList("infinitiScrollDown",bo_no);
	}

	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.sqlSession.selectList("cat_board",cat_name);
	}
}
