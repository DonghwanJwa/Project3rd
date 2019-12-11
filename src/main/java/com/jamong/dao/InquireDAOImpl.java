package com.jamong.dao;

import java.util.List;

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

	@Override
	public int getListCount(InquireVO i) {
		return this.sqlSession.selectOne("inq_count",i);
	}

	@Override
	public List<InquireVO> getInquireList(InquireVO i) {
		return this.sqlSession.selectList("inq_list",i);
		
	}
}
