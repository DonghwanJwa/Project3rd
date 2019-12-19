package com.jamong.service;

import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyService {

	void addComment(ReplyVO rvo);
	List<ReplyVO> getUserBoardContReply(int bo_no);
	void addReply(ReplyVO rvo);

}
