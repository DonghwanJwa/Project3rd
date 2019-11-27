package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AuthorDAO;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDAO autDao;
}
