package com.jamong.dao;

import java.util.List;

import com.jamong.domain.NoticeVO;

public interface NoticeDAO {

	int getListCount(NoticeVO n);

	List<NoticeVO> getNoticeList(NoticeVO n);

	void noticeInsert(NoticeVO n);

	NoticeVO noticeCont(int no);

	void noticeEdit(NoticeVO n);

	void noticeDel(int no);

	List<NoticeVO> headerNotice();

	void upHit(int no);


}
