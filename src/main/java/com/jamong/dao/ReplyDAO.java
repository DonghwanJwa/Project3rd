package com.jamong.dao;

import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getUserBoardContReply(int bo_no);
	void addComment(ReplyVO rvo);
	void addReply(ReplyVO rvo);
	int getUserReplyCount(int bo_no);
	void updateLevel(ReplyVO rvo);
	void editReply(ReplyVO rvo);
	void removeReply(int rep_no);

}
