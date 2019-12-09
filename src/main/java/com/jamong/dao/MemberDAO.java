package com.jamong.dao;

import com.jamong.domain.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);
	MemberVO idCheck(String id);
	MemberVO loginCheck(String login_id);
	MemberVO pwdCK(String pass_modify_id);
	MemberVO memCheck(int mem_no);
}
