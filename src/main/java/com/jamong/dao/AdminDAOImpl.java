package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.NoticeVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeVO> newNotice(NoticeVO n) {
		return this.sqlSession.selectList("newNotice",n);
	}
}
