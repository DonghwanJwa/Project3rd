package com.jamong.dao;

import java.util.List;

import com.jamong.domain.NoticeVO;

public interface AdminDAO {

	List<NoticeVO> newNotice(NoticeVO n);

}
