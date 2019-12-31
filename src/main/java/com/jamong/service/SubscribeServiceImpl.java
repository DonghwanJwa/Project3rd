package com.jamong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.MemberDAO;
import com.jamong.dao.SubscribeDAO;
import com.jamong.domain.SubscribeVO;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subDao;
	@Autowired
	private MemberDAO memberDao;

	@Transactional
	@Override
	public void insertSub(SubscribeVO subvo) {
		this.subDao.insertSub(subvo);
		this.memberDao.updateSubCount(subvo,1);
	}

	@Transactional
	@Override
	public void removeFollow(SubscribeVO subvo) {
		this.subDao.deleteSub(subvo);
		this.memberDao.updateSubCount(subvo,-1);
	}
	@Override
	public int subCount(int mem_no) {
		return this.subDao.subCount(mem_no);
	}

	@Override
	public SubscribeVO subCheck(HashMap<String, Object> submap) {
		return this.subDao.subCheck(submap);
	}
}
