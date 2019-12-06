package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AccuseDAO;
import com.jamong.domain.AccuseVO;

@Service
public class AccuseServiceImpl implements AccuseService {

	@Autowired
	private AccuseDAO accuseDao;

	@Override
	public void accuse_insert(AccuseVO a) {
		this.accuseDao.accuse_insert(a);
		
	}
	
	
}
