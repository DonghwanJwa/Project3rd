package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.SympathyDAO;
import com.jamong.domain.SympathyVO;

@Service
public class SympathyServiceImpl implements SympathyService {

	@Autowired
	private SympathyDAO sympathyDao;

	@Override
	public SympathyVO getSympathyState(SympathyVO svo) {
		return this.sympathyDao.getSympathyState(svo);
	}
	
	
}
