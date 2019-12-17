package com.jamong.service;

import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;

public interface MemberService {

	MemberVO mem_emailCheck(MemberVO m);
	void memberUpdate(MemberVO me);
	void insertMember(MemberVO m);
	MemberVO idCheck(String id);
	MemberVO loginCheck(String login_id);
    MemberVO pwdCK(String pass_modify_id);
	MemberVO getMemberID(int mem_no);
	MemberVO pwdcheck(String pass_modify_id);
	MemberVO emailCheck(MemberVO m);
	MemberVO adminLogin(String adm_id);
	MemberVO get(String mem_id);
	MemberVO profileCheck(String mem_id);
	List<MemberVO> recomAuthor();
	List<MemberVO> categoryMember();
}
