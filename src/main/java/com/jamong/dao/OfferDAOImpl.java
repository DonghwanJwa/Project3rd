package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AdminOfferVO;
import com.jamong.domain.OfferVO;

@Repository
public class OfferDAOImpl implements OfferDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void offer_send(HashMap<String, Object> om) {
		this.sqlSession.insert("off_send",om);
	}

	@Override
	public int offer_count(OfferVO ov) {
		return this.sqlSession.selectOne("off_count",ov);
	}

	@Override
	public List<AdminOfferVO> offer_list(AdminOfferVO ao) {
		return this.sqlSession.selectList("off_list",ao);
	}

	@Override
	public AdminOfferVO offer_info(int no) {
		return this.sqlSession.selectOne("off_info",no);
	}
}
