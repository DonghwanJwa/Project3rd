package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.ReplyDAO;
import com.jamong.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDao;

	@Override
	public void addComment(ReplyVO rvo) {
		this.replyDao.addComment(rvo);
	}

	@Override
	public List<ReplyVO> getUserBoardContReply(int bo_no) {
		return this.replyDao.getUserBoardContReply(bo_no);
	}

	@Transactional
	@Override
	public void addReply(ReplyVO rvo) {
		this.replyDao.updateLevel(rvo);
		this.replyDao.addReply(rvo);
	}

}
