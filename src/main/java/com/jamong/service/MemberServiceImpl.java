package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
}
