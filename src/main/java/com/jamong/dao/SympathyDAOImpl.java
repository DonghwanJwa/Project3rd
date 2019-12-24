package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SympathyVO;

@Repository
public class SympathyDAOImpl implements SympathyDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void mem_update_del(MemberVO vo) {
		this.sqlSession.delete("sym_mem_update", vo);
	}
	@Override
	public void sympathyUpInsert(BoardVO bo) {
		this.sqlSession.insert("sym_insert",bo);
	}

	@Override
	public void sympathyDownDelete(BoardVO bo) {
		this.sqlSession.delete("sym_delete",bo);
	}
	
	@Override
	public SympathyVO getSympathyState(SympathyVO svo) {	
		return this.sqlSession.selectOne("sym_select",svo);
	}


}
