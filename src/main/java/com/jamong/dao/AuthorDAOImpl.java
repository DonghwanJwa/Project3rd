package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AuthorVO;

@Repository
public class AuthorDAOImpl implements AuthorDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sendAuthor(AuthorVO a) {
		this.sqlSession.insert("sendAuthor",a);
	}

	@Override
	public int req_count(AuthorVO a) {
		return this.sqlSession.selectOne("req_count",a);
	}

	@Override
	public List<AuthorVO> req_list(AuthorVO a) {
		return this.sqlSession.selectList("req_list",a);
	}
	
}
