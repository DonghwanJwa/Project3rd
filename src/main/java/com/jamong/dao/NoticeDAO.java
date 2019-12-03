package com.jamong.dao;

import java.util.List;

import com.jamong.domain.NoticeVO;

public interface NoticeDAO {

	int getListCount(NoticeVO n);

	List<NoticeVO> getNoticeList(NoticeVO n);

	void noticeInsert(NoticeVO n);

}
