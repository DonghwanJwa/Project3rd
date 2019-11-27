package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.BookDAO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDao;
}
