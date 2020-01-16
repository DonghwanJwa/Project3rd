package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CategoryVO> listCategory() {
		return this.sqlSession.selectList("cat_list");
	}
	
	
}
