package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(NoticeVO n) {
		return this.sqlSession.selectOne("n_count",n);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO n) {
		return this.sqlSession.selectList("n_list",n);
	}

	@Override
	public void noticeInsert(NoticeVO n) {
		this.sqlSession.insert("n_insert",n);
	}
}
