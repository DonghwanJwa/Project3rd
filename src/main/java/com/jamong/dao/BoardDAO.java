package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;

public interface BoardDAO {

	void insertBoard(HashMap<String, Object> bm);
	BoardVO getUserBoardCont(int bo_no);
	List<BoardVO> recomArticle();
	List<BoardVO> getListAll(BoardVO b);
	void sympathyUpUpdate(BoardVO bo);
	void sympathyDownUpdate(BoardVO bo);
	void articleDelete(int bo_no);
	void articleRecover(int bo_no);
	int sympathyNum(BoardVO bo);
	int switchBoardLock(BoardVO bo);
	int boardBan(BoardVO bo);
	BoardVO getNextBoardCont(HashMap<String, Object> bm);
	BoardVO getPreBoardCont(HashMap<String, Object> bm);
	List<BoardVO> bestList();
	List<BoardVO> getSearchPost(HashMap<String, Object> searchMap);
	List<BoardVO> getSearchScrollPost(HashMap<String, Object> searchMap);
	List<BoardVO> infinitiScrollDown(int bo_no);
	List<BoardVO> categoryArticle(String cat_name);
	List<BoardVO> getProfile(HashMap<String, Object> profileMap);
	void updateHit(int bo_no);
	void updateBoard(HashMap<String, Object> bm);
	List<BoardVO> getUserBoardContList(int mem_no);
	List<BoardVO> getUserBoardCatArticle(String cat_name);
	void updateBookNo(HashMap<String, Object> bm);
	List<BoardVO> getBKList(int book_no);
	BoardVO newArticleNum(Object object);
	List<BoardVO> bookInfoCont(HashMap<String, Object> binfo);
	List<BoardVO> profileScroll(HashMap<String, Object> scroll);
	List<BoardVO> bkEditList(HashMap<String, Object> be);
	void bookNull(int book_no);
	List<BoardVO> chartArticleState();
	List<BoardVO> chartArticleCategory();
	List<BoardVO> chartArticleCount();

}
