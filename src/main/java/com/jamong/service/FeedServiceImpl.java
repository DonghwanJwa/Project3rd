package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.FeedDAO;
import com.jamong.domain.FeedVO;
import com.jamong.domain.MemberVO;

@Service
public class FeedServiceImpl implements FeedService {

	@Autowired
	private FeedDAO feedDao;

	@Override
	public List<FeedVO> getUserFeedList(int mem_no) {
		return this.feedDao.getUserFeedList(mem_no);
	}

	@Override
	public void feedStateUp(int feed_no) {
		this.feedDao.feedStateUp(feed_no);
	}
}
