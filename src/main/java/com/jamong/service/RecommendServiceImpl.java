package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.RecommendDAO;
import com.jamong.domain.RecommendVO;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendDAO recDao;

	@Override
	public RecommendVO getRecommendState(RecommendVO rvo) {
		return this.recDao.getRecommendState(rvo);
	}

	@Override
	public List<RecommendVO> getUserScrapBook(int mem_no) {
		return this.recDao.getUserScrapBook(mem_no);
	}
}
