package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO b);
	BoardVO getUserBoardCont(int bo_no);
	List<BoardVO> recomArticle();
	List<BoardVO> getListAll(BoardVO b);
	void sympathyUpUpdate(BoardVO bo);
	void sympathyDownUpdate(BoardVO bo);
	void articleDelete(int bo_no);
	int sympathyNum(BoardVO bo);
	int switchBoardLock(BoardVO bo);
	List<BoardVO> bestList();
	List<BoardVO> getSearchPost(HashMap<String, Object> searchMap);
	List<BoardVO> getSearchScrollPost(HashMap<String, Object> searchMap);
	List<BoardVO> infinitiScrollDown(int bo_no);
	List<BoardVO> categoryArticle(String cat_name);
	List<BoardVO> getProfile(int mem_no);
	void updateHit(int bo_no);
	void updateBoard(HashMap<String, Object> bm);
	List<BoardVO> getUserBoardContList(int mem_no);
	List<BoardVO> getUserBoardCatArticle(String cat_name);

}
