package com.jamong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAOImpl implements IndexDAO {

	@Autowired
	private SqlSession sqlSession;
}
