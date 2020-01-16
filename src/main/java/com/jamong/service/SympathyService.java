package com.jamong.service;

import java.util.List;

import com.jamong.domain.SympathyVO;

public interface SympathyService {

	SympathyVO getSympathyState(SympathyVO svo);
	List<SympathyVO> getUserScrapArticle(int mem_no);

}
