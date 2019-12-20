package com.jamong.service;

import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyService {

	void addComment(ReplyVO rvo);
	int getUserReplyCount(int bo_no);
	List<ReplyVO> getUserBoardContReply(int bo_no);
	void editReply(ReplyVO rvo);
	void addReply(ReplyVO rvo);

}
