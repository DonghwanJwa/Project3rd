package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addComment(ReplyVO rvo) {
		this.sqlSession.insert("com_add",rvo);
	}
	@Override
	public List<ReplyVO> getUserBoardContReply(int bo_no) {
		return this.sqlSession.selectList("rep_boList",bo_no);
	}
	@Override
	public void addReply(ReplyVO rvo) {
		this.sqlSession.insert("rep_add",rvo);
	}
	@Override
	public void updateLevel(ReplyVO rvo) {
		this.sqlSession.update("rep_update",rvo);
	}
	@Override
	public int getUserReplyCount(int bo_no) {
		return this.sqlSession.selectOne("rep_count",bo_no);
	}
	@Override
	public void editReply(ReplyVO rvo) {
		this.sqlSession.update("comment_edit",rvo);
	}
}
