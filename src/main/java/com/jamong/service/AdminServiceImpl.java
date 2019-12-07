package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AdminDAO;
import com.jamong.domain.AdminVO;
import com.jamong.domain.NoticeVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDao;

	@Override
	public AdminVO adminLogin(String adm_id) {
		return this.adminDao.adminLogin(adm_id);
	}

	@Override
	public List<NoticeVO> newNotice(NoticeVO n) {
		return this.adminDao.newNotice(n);
	}

}
