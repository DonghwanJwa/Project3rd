package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.MemberDAO;
import com.jamong.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Override
	public void insertMember(MemberVO m) {
		this.memberDao.insertMember(m);
	}
	
	
}
