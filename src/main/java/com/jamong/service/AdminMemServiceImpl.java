package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AdminMemDAO;
import com.jamong.domain.MemberVO;

@Service
public class AdminMemServiceImpl implements AdminMemService {
	@Autowired
	private AdminMemDAO admMemDao;

	@Override
	public int memCount(MemberVO me) {
		return this.admMemDao.memCount(me);
	}
	
	@Override
	public List<MemberVO> memList(MemberVO me) {
		return this.admMemDao.memList(me);
	}
}
