package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.InquireDAO;
import com.jamong.domain.InquireVO;

@Service
public class InquireServiceImpl implements InquireService {

	@Autowired
	private InquireDAO inqDao;

	@Override
	public void insertInquire(InquireVO i) {
		this.inqDao.insertInquire(i);
		
	}

	@Override
	public int getListCount(InquireVO i) {
		return this.inqDao.getListCount(i);
	}

	@Override
	public List<InquireVO> getInquireList(InquireVO i) {
		return this.inqDao.getInquireList(i);
	}
}
