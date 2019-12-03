package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AdminDAO;
import com.jamong.domain.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDao;

	@Override
	public AdminVO adminLogin(String adm_id) {
		return this.adminDao.adminLogin(adm_id);
	}

}
