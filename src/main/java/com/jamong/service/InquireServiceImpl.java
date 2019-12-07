package com.jamong.service;

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
}
