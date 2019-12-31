package com.jamong.dao;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SympathyVO;

public interface SympathyDAO {

	void mem_update_del(MemberVO vo);
	void sympathyUpInsert(BoardVO bo);
	void sympathyDownDelete(BoardVO bo);
	SympathyVO getSympathyState(SympathyVO svo);
	List<SympathyVO> getUserScrapArticle(int mem_no);
	void sympathyArticleDelete(int bo_no);

}
