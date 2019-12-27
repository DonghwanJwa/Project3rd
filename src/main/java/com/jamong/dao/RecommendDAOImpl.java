package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BookVO;
import com.jamong.domain.RecommendVO;

@Repository
public class RecommendDAOImpl implements RecommendDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void recommendUpInsert(BookVO bk) {
		this.sqlSession.insert("rec_insert",bk);
	}

	@Override
	public void recommendDownDelete(BookVO bk) {
		this.sqlSession.delete("rec_delete",bk);
	}
	
	@Override
	public RecommendVO getRecommendState(RecommendVO rvo) {
		return this.sqlSession.selectOne("rec_select",rvo);
	}

}
