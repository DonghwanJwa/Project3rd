package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.FeedVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SubscribeVO;

public interface FeedDAO {

	void addReplyFeed(HashMap<String, Object> rm);
	List<FeedVO> getUserFeedList(int mem_no);
	void addCommentFeed(HashMap<String, Object> rm);
	void addArticleFeed(HashMap<String, Object> bm);
	void addBookFeed(HashMap<String, Object> bm);

}
