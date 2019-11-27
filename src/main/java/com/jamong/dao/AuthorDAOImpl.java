package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthorDAOImpl implements AuthorDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
}
