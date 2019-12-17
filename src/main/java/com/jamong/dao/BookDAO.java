package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;

public interface BookDAO {

	List<BoardVO> getBList(String mem_id);

}
