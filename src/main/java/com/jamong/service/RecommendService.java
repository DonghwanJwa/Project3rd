package com.jamong.service;

import java.util.List;

import com.jamong.domain.RecommendVO;

public interface RecommendService {

	RecommendVO getRecommendState(RecommendVO rvo);
	List<RecommendVO> getUserScrapBook(int mem_no);

}
