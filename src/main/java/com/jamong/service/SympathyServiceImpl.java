package com.jamong.service;

import java.util.List;

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

	@Override
	public List<SympathyVO> getUserScrapArticle(int mem_no) {
		return this.sympathyDao.getUserScrapArticle(mem_no);
	}
	
	
}
