package com.jamong.dao;

import java.util.List;

import com.jamong.domain.MemberVO;

public interface MemberDAO {

	void mem_update_del(MemberVO vo);
	void pass_update(MemberVO vo);
	MemberVO memberSelect_pwd(MemberVO vo);
	MemberVO memberSelect_id(MemberVO vo);
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
	MemberVO getMemberFav(int mem_no);
	List<MemberVO> recomAuthor();
	List<MemberVO> categoryMember();
	MemberVO getAccusee(int ac_member);
	void updateProfile(MemberVO mp);
}
