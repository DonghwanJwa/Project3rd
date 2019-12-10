package com.jamong.service;

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
}
