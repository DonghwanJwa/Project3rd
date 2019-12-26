package com.jamong.dao;

import java.util.HashMap;
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
	public void addComment(HashMap<String, Object> rm) {
		this.sqlSession.insert("com_add",rm);	
	}
	@Override
	public List<ReplyVO> getUserBoardContReply(int bo_no) {
		return this.sqlSession.selectList("rep_boList",bo_no);
	}
	@Override
	public void addReply(HashMap<String, Object> rm) {
		this.sqlSession.insert("rep_add",rm);
	}
	@Override
	public void updateLevel(HashMap<String, Object> rm) {
		this.sqlSession.update("rep_update",rm);
	}
	@Override
	public int getUserReplyCount(int bo_no) {
		return this.sqlSession.selectOne("rep_count",bo_no);
	}
	@Override
	public void editReply(ReplyVO rvo) {
		this.sqlSession.update("comment_edit",rvo);
	}
	@Override
	public void removeReply(int rep_no) {
		this.sqlSession.delete("rep_remove",rep_no);
	}
	@Override
	public void replyDelete(int bo_no) {
		this.sqlSession.delete("ArtReplyRemove",bo_no);
	}

}
