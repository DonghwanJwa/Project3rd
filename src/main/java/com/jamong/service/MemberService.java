package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;

public interface MemberService {

	void cat_update(MemberVO vo);
	void mem_update_del(MemberVO vo);
	void pass_update(MemberVO vo);
	MemberVO memberSelect_pwd(MemberVO vo);
	MemberVO memberSelect_id(MemberVO vo);
	MemberVO mem_emailCheck(MemberVO m);
	int memberUpdate(HashMap<String, Object> bm);
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
	List<MemberVO> getSearchMember(HashMap<String, Object> searchMap);
	List<MemberVO> getSearchScrollMember(HashMap<String, Object> searchMap);
	List<MemberVO> recomAuthor();
	List<MemberVO> categoryMember(String cat_name);
	List<MemberVO> chartAgeGroup();
	List<MemberVO> chartGenderData();
	List<MemberVO> chartMemberCategory();
	MemberVO getAccusee(int ac_member);
	void updateProfile(MemberVO mp);
	MemberVO author_info(String mem_id);
}
