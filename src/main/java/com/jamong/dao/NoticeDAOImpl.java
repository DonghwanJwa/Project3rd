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

	@Override
	public NoticeVO noticeCont(int no) {
		return this.sqlSession.selectOne("n_cont",no);
	}

	@Override
	public void noticeEdit(NoticeVO n) {
		this.sqlSession.update("n_edit",n);
	}

	@Override
	public void noticeDel(int no) {
		this.sqlSession.delete("n_del",no);
	}

	@Override
	public List<NoticeVO> headerNotice() {
		return sqlSession.selectList("cat_n_list");
	}

}
