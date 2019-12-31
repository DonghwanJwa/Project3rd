package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AdminDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.NoticeVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDao;

	@Override
	public List<NoticeVO> newNotice(NoticeVO n) {
		return this.adminDao.newNotice(n);
	}

	@Override
	public int articleCount(BoardVO b) {
		return this.adminDao.articleCount(b);
	}

	@Override
	public List<BoardVO> articleList(BoardVO b) {
		return this.adminDao.articleList(b);
	}

}
