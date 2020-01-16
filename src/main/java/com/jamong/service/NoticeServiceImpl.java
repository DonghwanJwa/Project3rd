package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	@Override
	public NoticeVO getNoticeCont(int no) {
		this.noticeDao.upHit(no);
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

	@Override
	public List<NoticeVO> headerNotice() {
		List<NoticeVO> nlist = this.noticeDao.headerNotice();
		/*날짜 년월일만 나오게 자름*/
		for(int i=0;i<nlist.size();i++) {
			nlist.get(i).setNoti_date(nlist.get(i).getNoti_date().substring(0,10));
		}
		
		return nlist;
	}
	
	

}
