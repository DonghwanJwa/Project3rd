package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.AuthorDAO;
import com.jamong.dao.FeedDAO;
import com.jamong.domain.AuthorVO;
import com.jamong.domain.RequestAuthorVO;

@Service
public class AuthorServiceImpl implements AuthorService {

	@Autowired
	private AuthorDAO autDao;
	@Autowired
	private FeedDAO feedDao;
	
	@Override
	public void sendAuthor(AuthorVO a) {
		this.autDao.sendAuthor(a);
	}

	@Override
	public int req_count(RequestAuthorVO a) {
		return this.autDao.req_count(a);
	}

	@Override
	public List<AuthorVO> req_list(RequestAuthorVO a) {
		return this.autDao.req_list(a);
	}

	@Override
	public AuthorVO req_info(int no) {
		return this.autDao.req_info(no);
	}

	@Override
	public int authorcheck(int no) {
		return this.autDao.authorcheck(no);
	}

	@Override
	public AuthorVO get_file(int no) {
		return this.autDao.get_file(no);
	}

	@Override
	public List<AuthorVO> getFileList(int no) {
		return this.autDao.getFileList(no);
	}

	@Transactional
	@Override
	public void acceptAuthor(HashMap<String,Object> am) {
		this.autDao.editAuthor(am);
		this.autDao.acceptAuthor(am);
		this.feedDao.addAuthorFeed(am);
	}
	
	@Transactional
	@Override
	public void rejectAuthor(HashMap<String,Object> am) {
		this.autDao.rejectAuthor(am);
		this.feedDao.addAuthorFeed(am);
	}

}
