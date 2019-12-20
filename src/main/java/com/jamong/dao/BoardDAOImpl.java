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
	
	@Override
	public List<BoardVO> getUserBoardContList(int mem_no) {
		return this.sqlSession.selectList("bo_contlist",mem_no);
	}
	
	@Override
	public List<BoardVO> getUserBoardCatArticle(String cat_name) {
		return this.sqlSession.selectList("bo_catcontlist",cat_name);
	}

	@Override
	public void updateHit(int bo_no) {
		this.sqlSession.update("bo_hit",bo_no);
	}
	
	public List<BoardVO> getListAll(BoardVO b) {
		return this.sqlSession.selectList("bo_list", b);
	}
	
	@Override
	public List<BoardVO> recomArticle() {	
		return this.sqlSession.selectList("board.index_article");
	}
	
	@Override
	public void sympathyUpUpdate(BoardVO bo) {
		this.sqlSession.update("sym_up",bo);
	}
	
	@Override
	public void sympathyDownUpdate(BoardVO bo) {
		this.sqlSession.update("sym_down",bo);
	}

	@Override
	public int sympathyNum(BoardVO bo) {
		return this.sqlSession.selectOne("sym_count", bo);
	}

	@Override
	public List<BoardVO> getSearchArticle(String texts) {
		return this.sqlSession.selectList("search_article",texts);
	}

	@Override
	public List<BoardVO> bestList() {
		return this.sqlSession.selectList("board.best_list");
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.sqlSession.selectList("infinitiScrollDown",bo_no);
	}
	
	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.sqlSession.selectList("cat_board",cat_name);
	}

	@Override
	public List<BoardVO> getProfile(int mem_no) {
		return this.sqlSession.selectList("profileList",mem_no);
	}

}
