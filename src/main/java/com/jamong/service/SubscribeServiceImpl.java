package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.SubscribeDAO;
import com.jamong.domain.SubscribeVO;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subDao;

	@Override
	public void insertSub(SubscribeVO subvo) {
		this.subDao.insertSub(subvo);
	}

	@Override
	public void removeFollow(SubscribeVO subvo) {
		this.subDao.deleteSub(subvo);
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
