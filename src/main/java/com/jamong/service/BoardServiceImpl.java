package com.jamong.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.MemberDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public void insertBoard(BoardVO b) {
		this.boardDao.insertBoard(b);
	}

	@Override
	public BoardVO getUserBoardCont(int bo_no) {
		return this.boardDao.getUserBoardCont(bo_no);
	}
	public List<BoardVO> getListAll(BoardVO b) {
		return this.boardDao.getListAll(b);
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.boardDao.infinitiScrollDown(bo_no);
	}

	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.boardDao.categoryArticle(cat_name);
	}
}
