package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BookVO;
import com.jamong.domain.RecommendVO;

public interface RecommendDAO {

	void recommendUpInsert(BookVO bk);
	void recommendDownDelete(BookVO bk);
	RecommendVO getRecommendState(RecommendVO rvo);
	List<RecommendVO> getUserScrapBook(int mem_no);
}
