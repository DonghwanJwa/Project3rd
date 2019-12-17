package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BookDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDao;

	@Override
	public List<BoardVO> getBList(String mem_id) {
		return this.bookDao.getBList(mem_id);
	}

}
