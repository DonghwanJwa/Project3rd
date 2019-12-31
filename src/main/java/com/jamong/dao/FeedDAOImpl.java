package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AuthorVO;
import com.jamong.domain.FeedVO;
import com.jamong.domain.InquireVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.OfferVO;
import com.jamong.domain.SubscribeVO;
import com.jamong.domain.SympathyVO;

@Repository
public class FeedDAOImpl implements FeedDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addReplyFeed(HashMap<String, Object> rm) {
		this.sqlSession.insert("CommentFeed",rm);
	}

	@Override
	public List<FeedVO> getUserFeedList(int mem_no) {
		return this.sqlSession.selectList("FeedList",mem_no);
	}

	@Override
	public void addCommentFeed(HashMap<String, Object> rm) {
		this.sqlSession.insert("ReplyFeed",rm);
	}

	@Override
	public void addArticleFeed(HashMap<String, Object> bm) {
		this.sqlSession.insert("ArticleFeed",bm);
	}

	@Override
	public void addBookFeed(HashMap<String, Object> bm) {
		this.sqlSession.insert("BookFeed",bm);
	}

	@Override
	public void feedStateUp(int feed_no) {
		this.sqlSession.update("FeedStateUp",feed_no);
	}

	@Override
	public void addAuthorFeed(HashMap<String,Object> am) {
		this.sqlSession.insert("AuthorFeed",am);
	}

	@Override
	public void addOfferFeed(HashMap<String, Object> om) {
		this.sqlSession.insert("OfferFeed",om);
	}

	@Override
	public void addInquireFeed(HashMap<String, Object> im) {
		this.sqlSession.insert("InquireFeed",im);
	}

	@Override
	public int feedCount(int sMem_no) {
		return this.sqlSession.selectOne("FeedCount",sMem_no);
	}

	@Override
	public void feedDelete(int feed_no) {
		this.sqlSession.delete("FeedDelete",feed_no);
	}

}
