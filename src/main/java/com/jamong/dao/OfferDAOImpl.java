package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.OfferVO;

@Repository
public class OfferDAOImpl implements OfferDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void offer_send(OfferVO ov) {
		this.sqlSession.insert("off_send",ov);
	}
}
