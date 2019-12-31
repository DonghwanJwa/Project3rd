package com.jamong.service;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.NoticeVO;

public interface AdminService {

	List<NoticeVO> newNotice(NoticeVO n);

	int articleCount(BoardVO b);

	List<BoardVO> articleList(BoardVO b);

}
