package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.SubscribeVO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertSub(SubscribeVO subvo) {
		this.sqlSession.insert("sub_in",subvo);
	}

	@Override
	public void deleteSub(SubscribeVO subvo) {
		this.sqlSession.delete("sub_del",subvo);
	}

	@Override
	public int subCount(int mem_no) {
		return this.sqlSession.selectOne("sub_count",mem_no);
	}

	@Override
	public SubscribeVO subCheck(HashMap<String, Object> submap) {
		return this.sqlSession.selectOne("sub_check",submap);
	}

	@Override
	public List<SubscribeVO> followerList(Object object) {
		return this.sqlSession.selectList("FollowerList",object);
	}

	
	
}
