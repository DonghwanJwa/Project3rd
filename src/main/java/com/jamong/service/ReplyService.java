package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.ReplyVO;

public interface ReplyService {

	void addComment(HashMap<String, Object> rm, int mem_no, int sMem_no);
	int getUserReplyCount(int bo_no);
	List<ReplyVO> getUserBoardContReply(int bo_no);
	void editReply(ReplyVO rvo);
	void removeReply(int rep_no);
	void addReply(HashMap<String, Object> rm, int mem_no, int mem_no2);

}
