package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.InquireVO;

@Repository
public class InquireDAOImpl implements InquireDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertInquire(InquireVO i) {
		this.sqlSession.insert("inq_insert",i);
		
	}
}
