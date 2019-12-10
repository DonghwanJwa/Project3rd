package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO b);
	BoardVO getUserBoardCont(int bo_no);

	List<BoardVO> getListAll(BoardVO b);


}
