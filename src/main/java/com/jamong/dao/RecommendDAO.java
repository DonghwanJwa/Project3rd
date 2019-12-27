package com.jamong.dao;

import com.jamong.domain.BookVO;
import com.jamong.domain.RecommendVO;

public interface RecommendDAO {

	void recommendUpInsert(BookVO bk);

	void recommendDownDelete(BookVO bk);

	RecommendVO getRecommendState(RecommendVO rvo);
}
