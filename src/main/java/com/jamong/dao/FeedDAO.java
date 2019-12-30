package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.AuthorVO;
import com.jamong.domain.FeedVO;
import com.jamong.domain.InquireVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.OfferVO;
import com.jamong.domain.SubscribeVO;
import com.jamong.domain.SympathyVO;

public interface FeedDAO {

	void addReplyFeed(HashMap<String, Object> rm);
	List<FeedVO> getUserFeedList(int mem_no);
	void addCommentFeed(HashMap<String, Object> rm);
	void addArticleFeed(HashMap<String, Object> bm);
	void addBookFeed(HashMap<String, Object> bm);
	void feedStateUp(int feed_no);
	void addAuthorFeed(HashMap<String, Object> am);
	void addOfferFeed(HashMap<String, Object> om);
	void addInquireFeed(HashMap<String, Object> im);
	int feedCount(int sMem_no);

}
