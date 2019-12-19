package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.SympathyDAO;
import com.jamong.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Autowired
	private SympathyDAO sympathyDao;
	
	@Override
	public void insertBoard(BoardVO b) {
		this.boardDao.insertBoard(b);
	}

	@Transactional
	@Override
	public BoardVO getUserBoardCont(int bo_no) {
		this.boardDao.updateHit(bo_no);
		return this.boardDao.getUserBoardCont(bo_no);
	}
	
	@Override
	public List<BoardVO> getListAll(BoardVO b) {
		return this.boardDao.getListAll(b);
	}
	
	@Override
	public List<BoardVO> recomArticle() {
		return this.boardDao.recomArticle();
	}
	
	@Transactional
	@Override
	public int sympathyUp(BoardVO bo) {
		this.sympathyDao.sympathyUpInsert(bo);
		this.boardDao.sympathyUpUpdate(bo);
		return this.boardDao.sympathyNum(bo);
	}
	
	@Transactional
	@Override
	public int sympathyDown(BoardVO bo) {
		this.sympathyDao.sympathyDownDelete(bo);
		this.boardDao.sympathyDownUpdate(bo);
		return this.boardDao.sympathyNum(bo);
	}	
	
	@Override
	public List<BoardVO> bestList() {	
		return this.boardDao.bestList();
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.boardDao.infinitiScrollDown(bo_no);
	}

	@Override
	public List<BoardVO> getUserBoardCatArticle(String cat_name) {
		return this.boardDao.getUserBoardCatArticle(cat_name);
	}

	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.boardDao.categoryArticle(cat_name);
	}

	@Override
	public List<BoardVO> getProfile(int mem_no) {
		return this.boardDao.getProfile(mem_no);
  }
  
	@Override
	public List<BoardVO> getUserBoardContList(int mem_no) {
		return this.boardDao.getUserBoardContList(mem_no);
	}

}
