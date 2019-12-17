package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BoardVO;

public interface BookDAO {

	List<BoardVO> getBList(BoardVO b);

}
