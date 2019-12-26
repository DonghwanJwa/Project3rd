package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getUserBoardContReply(int bo_no);
	void addComment(HashMap<String, Object> rm);
	void addReply(HashMap<String, Object> rm);
	int getUserReplyCount(int bo_no);
	void replyDelete(int bo_no);
	void updateLevel(HashMap<String, Object> rm);
	void editReply(ReplyVO rvo);
	void removeReply(int rep_no);

}
