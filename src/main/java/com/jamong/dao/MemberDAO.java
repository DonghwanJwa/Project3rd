package com.jamong.dao;

import java.util.List;

import com.jamong.domain.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO m);
	MemberVO idCheck(String id);
	MemberVO loginCheck(String login_id);
    MemberVO pwdCK(String pass_modify_id);
	MemberVO getMemberID(int mem_no);
	MemberVO pwdcheck(String pass_modify_id);
	MemberVO emailCheck(MemberVO m);
	MemberVO adminLogin(String adm_id);
	MemberVO get(String mem_id);
	void memberUpdate(MemberVO vo);
	MemberVO profileCheck(int mem_no);
	List<MemberVO> categoryMember();
}
