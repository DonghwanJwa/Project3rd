package com.jamong.service;

import java.util.List;

import com.jamong.domain.NoticeVO;

public interface NoticeService {

	int getListCount(NoticeVO n);

	List<NoticeVO> getNoticeList(NoticeVO n);

	void noticeInsert(NoticeVO n);

}
