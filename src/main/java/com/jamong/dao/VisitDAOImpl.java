package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.VisitVO;

@Repository
public class VisitDAOImpl implements VisitDAO{

	@Autowired
	private SqlSession sqlSession;

	public void setTotalCount() {
		this.sqlSession.insert("InsertVisitor");
	}

	@Override
	public List<VisitVO> chartVisitorCount() {
		return this.sqlSession.selectList("DayVisitorCount");
	}

	@Override
	public List<VisitVO> chartTotalCount() {
		return this.sqlSession.selectList("TotalCount");
	}
}
