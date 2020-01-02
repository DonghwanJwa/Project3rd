package com.jamong.dao;

import java.util.HashMap;
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
	public void insertBoard(HashMap<String, Object> bm) {
		this.sqlSession.insert("bo_insert", bm);
	}

	@Override
	public BoardVO getUserBoardCont(int bo_no) {
		return this.sqlSession.selectOne("bo_cont", bo_no);
	}

	@Override
	public void updateBoard(HashMap<String, Object> bm) {
		this.sqlSession.update("bo_edit", bm);
	}

	@Override
	public List<BoardVO> getUserBoardContList(int mem_no) {
		return this.sqlSession.selectList("bo_contlist", mem_no);
	}

	@Override
	public List<BoardVO> getUserBoardCatArticle(String cat_name) {
		return this.sqlSession.selectList("bo_catcontlist", cat_name);
	}

	@Override
	public void updateHit(int bo_no) {
		this.sqlSession.update("bo_hit", bo_no);
	}

	public List<BoardVO> getListAll(BoardVO b) {
		return this.sqlSession.selectList("bo_list", b);
	}

	@Override
	public void articleDelete(int bo_no) {
		this.sqlSession.update("article_del", bo_no);
	}

	@Override
	public void articleRecover(int bo_no) {
		this.sqlSession.update("article_rec", bo_no);
	}

	@Override
	public List<BoardVO> recomArticle() {
		return this.sqlSession.selectList("board.index_article");
	}

	@Override
	public void sympathyUpUpdate(BoardVO bo) {
		this.sqlSession.update("sym_up", bo);
	}

	@Override
	public void sympathyDownUpdate(BoardVO bo) {
		this.sqlSession.update("sym_down", bo);
	}

	@Override
	public int sympathyNum(BoardVO bo) {
		return this.sqlSession.selectOne("sym_count", bo);
	}

	@Override
	public int switchBoardLock(BoardVO bo) {
		return this.sqlSession.update("board_lock", bo);
	}

	@Override
	public int boardBan(BoardVO bo) {
		return this.sqlSession.update("board_ban",bo);
	}

	@Override
	public List<BoardVO> getSearchPost(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_post", searchMap);
	}

	@Override
	public List<BoardVO> getSearchScrollPost(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_scroll_post", searchMap);
	}

	@Override
	public List<BoardVO> bestList() {
		return this.sqlSession.selectList("board.best_list");
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.sqlSession.selectList("infinitiScrollDown", bo_no);
	}

	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.sqlSession.selectList("cat_board", cat_name);
	}

	@Override
	public List<BoardVO> getProfile(int mem_no) {
		return this.sqlSession.selectList("profileList", mem_no);
	}

	@Override
	public void updateBookNo(HashMap<String, Object> bm) {
		this.sqlSession.update("book_no_up", bm);
	}

	@Override
	public List<BoardVO> getBKList(int book_no) {
		return this.sqlSession.selectList("select_bklist", book_no);
	}

	@Override
	public BoardVO getNextBoardCont(HashMap<String, Object> bm) {
		return this.sqlSession.selectOne("NextBoardCont", bm);
	}

	@Override
	public BoardVO getPreBoardCont(HashMap<String, Object> bm) {
		return this.sqlSession.selectOne("PreBoardCont", bm);
	}

	@Override
	public BoardVO newArticleNum(Object mem_no) {
		return this.sqlSession.selectOne("NewArticleNumber",mem_no);
  }
	
	@Override
	public List<BoardVO> bookInfoCont(HashMap<String, Object> binfo) {
		return this.sqlSession.selectList("book_info_cont", binfo);
	}

	@Override
	public List<BoardVO> bkEditList(HashMap<String, Object> be) {
		return this.sqlSession.selectList("bkEditList", be);
	}

  @Override
  public List<BoardVO> profileScroll(HashMap<String, Object> scroll) {
	return this.sqlSession.selectList("profileScroll",scroll);
	}

  	@Override
  	public void bookNull(int book_no) {
  		this.sqlSession.update("book_null",book_no);
  	}

}
