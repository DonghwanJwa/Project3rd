package com.jamong.dao;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SympathyVO;

public interface SympathyDAO {

	void mem_update_del(MemberVO vo);
	void sympathyUpInsert(BoardVO bo);
	void sympathyDownDelete(BoardVO bo);
	SympathyVO getSympathyState(SympathyVO svo);

}
