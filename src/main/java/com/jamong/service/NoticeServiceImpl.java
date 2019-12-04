package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.NoticeDAO;
import com.jamong.domain.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public int getListCount(NoticeVO n) {
		return this.noticeDao.getListCount(n);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO n) {
		return this.noticeDao.getNoticeList(n);
	}

	@Override
	public void noticeInsert(NoticeVO n) {
		this.noticeDao.noticeInsert(n);
	}

	@Override
	public NoticeVO getNoticeCont(int no) {
		return this.noticeDao.noticeCont(no);
	}

	@Override
	public void noticeEdit(NoticeVO n) {
		this.noticeDao.noticeEdit(n);
	}

	@Override
	public void noticeDel(int no) {
		this.noticeDao.noticeDel(no);
	}

}
