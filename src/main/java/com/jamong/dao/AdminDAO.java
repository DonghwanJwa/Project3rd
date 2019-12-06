package com.jamong.dao;

import java.util.List;

import com.jamong.domain.AdminVO;
import com.jamong.domain.NoticeVO;

public interface AdminDAO {

	AdminVO adminLogin(String adm_id);

	List<NoticeVO> newNotice(NoticeVO n);

}
