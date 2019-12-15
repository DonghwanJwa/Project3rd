package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AuthorDAO;
import com.jamong.domain.AuthorVO;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDAO autDao;

	@Override
	public void sendAuthor(AuthorVO a) {
		this.autDao.sendAuthor(a);
	}

	@Override
	public int req_count(AuthorVO a) {
		return this.autDao.req_count(a);
	}

	@Override
	public List<AuthorVO> req_list(AuthorVO a) {
		return this.autDao.req_list(a);
	}
}
