package com.jamong.dao;

import com.jamong.domain.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);
	MemberVO idCheck(String id);
	MemberVO loginCheck(String login_id);
	MemberVO pwdcheck(String pass_modify_id);
	MemberVO emailCheck(MemberVO m);
}
