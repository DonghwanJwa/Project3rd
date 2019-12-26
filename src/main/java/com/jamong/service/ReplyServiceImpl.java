package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.FeedDAO;
import com.jamong.dao.ReplyDAO;
import com.jamong.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDao;

	@Autowired
	private FeedDAO feedDao;

	@Transactional
	@Override
	public void addComment(HashMap<String, Object> rm, int mem_no, int sMem_no) {
		this.replyDao.addComment(rm);
		if(mem_no != sMem_no) {
			this.feedDao.addReplyFeed(rm);
			// 게시글 작성자에게 피드
		} // if => 덧글 작성자가 게시글 작성자와 같지 않을때만 실행
	}

	@Override
	public List<ReplyVO> getUserBoardContReply(int bo_no) {
		return this.replyDao.getUserBoardContReply(bo_no);
	}

	@Transactional
	@Override
	public void addReply(HashMap<String,Object> rm, int mem_no, int sMem_no) {
		this.replyDao.updateLevel(rm);
		this.replyDao.addReply(rm);
		if(mem_no != sMem_no) {
			this.feedDao.addCommentFeed(rm);
		}
	}

	@Override
	public int getUserReplyCount(int bo_no) {
		return this.replyDao.getUserReplyCount(bo_no);
	}

	@Override
	public void editReply(ReplyVO rvo) {
		this.replyDao.editReply(rvo);
	}

	@Override
	public void removeReply(int rep_no) {
		this.replyDao.removeReply(rep_no);
	}


}
