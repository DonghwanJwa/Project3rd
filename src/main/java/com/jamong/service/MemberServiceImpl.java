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

	@Override
	public MemberVO idCheck(String id) {
		return this.memberDao.idCheck(id); 
	}

	@Override
	public MemberVO loginCheck(String login_id) {
		return this.memberDao.loginCheck(login_id);
	}
    @Override
    public MemberVO pwdCK(String pass_modify_id) {
        return this.memberDao.pwdCK(pass_modify_id);
    }

	@Override
	public MemberVO checkMember(int mem_no) {
		return this.memberDao.memCheck(mem_no);
	}

	
	
}
