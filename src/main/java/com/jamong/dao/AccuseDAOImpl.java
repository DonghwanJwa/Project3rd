package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AccuseVO;

@Repository
public class AccuseDAOImpl implements AccuseDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void accuse_insert(AccuseVO a) {
		this.sqlSession.insert("acc_insert",a);
		
	}
}
