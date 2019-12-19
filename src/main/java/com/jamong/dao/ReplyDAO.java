package com.jamong.dao;

import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> getUserBoardContReply(int bo_no);
	void addComment(ReplyVO rvo);
	void addReply(ReplyVO rvo);
	void updateLevel(ReplyVO rvo);

}
