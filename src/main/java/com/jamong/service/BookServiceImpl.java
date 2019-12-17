package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.BookDAO;
import com.jamong.domain.BoardVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDao;

	@Override
	public List<BoardVO> getBList(BoardVO b) {
		return this.bookDao.getBList(b);
	}
}
