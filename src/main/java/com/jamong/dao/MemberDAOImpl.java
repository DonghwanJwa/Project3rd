package com.jamong.dao;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void cat_update(MemberVO vo) {
		this.sqlSession.update("member_cat_up", vo);
	}
	@Override
	public void member_pwd_modify(MemberVO me) {
		this.sqlSession.selectOne("member_pwd_up", me);
	}
	@Override
	public void mem_update_del(MemberVO vo) {
		this.sqlSession.update("mem_update_del",vo);
	}
	@Override
	public void pass_update(MemberVO vo) {
		this.sqlSession.update("mem_pwd_update", vo);
	}
	@Override
	public MemberVO memberSelect_pwd(MemberVO vo) {
		return this.sqlSession.selectOne("mem_select_pwd", vo);
	}
	@Override
	public MemberVO memberSelect_id(MemberVO vo) {
		return this.sqlSession.selectOne("mem_select_id", vo);
	}

	@Override
	public MemberVO mem_emailCheck(MemberVO m) {
		return this.sqlSession.selectOne("mem_email", m);
	}
	
	@Override
	public void memberUpdate(MemberVO me) {
		this.sqlSession.update("mem_update", me);
	}

	@Override
	public void insertMember(MemberVO m) {
		this.sqlSession.insert("mem_insert",m);
	}

	@Override
	public MemberVO idCheck(String id) {
		return this.sqlSession.selectOne("mem_idcheck",id);
	}

	@Override
	public MemberVO loginCheck(String login_id) {
		return this.sqlSession.selectOne("mem_logincheck",login_id);
	}

	@Override
	public MemberVO pwdcheck(String pass_modify_id) {
		return this.sqlSession.selectOne("mem_pwdck", pass_modify_id);
	}

	@Override
	public MemberVO emailCheck(MemberVO m) {	
		return this.sqlSession.selectOne("mem_emailcheck",m);
	}

	@Override
	public MemberVO adminLogin(String adm_id) {
		return this.sqlSession.selectOne("mem_adminlogin",adm_id);
	}
    @Override
    public MemberVO pwdCK(String pass_modify_id) {
        return this.sqlSession.selectOne("pwd_ck", pass_modify_id);
    }

	@Override
	public MemberVO getMemberID(int mem_no) {
		return this.sqlSession.selectOne("mem_getID",mem_no);
	}

	@Override
	public MemberVO get(String mem_id) {
		return this.sqlSession.selectOne("mem_myinfo", mem_id);
	}

	@Override
	public MemberVO profileCheck(String mem_id) {
		return this.sqlSession.selectOne("profile_ck",mem_id);
	}	
	
	@Override
	public MemberVO getMemberFav(int mem_no) {
		return this.sqlSession.selectOne("mem_getfav",mem_no);
	}
	
	@Override
	public List<MemberVO> getSearchMember(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_member",searchMap);
	}

	@Override
	public List<MemberVO> recomAuthor() {
		return this.sqlSession.selectList("index_author");
	}

	@Override
	public List<MemberVO> categoryMember() {
		return this.sqlSession.selectList("cat_member");
	}
	@Override
	public MemberVO getAccusee(int ac_member) {
		return this.sqlSession.selectOne("getAccusee",ac_member);
	}
	
	@Override
	public void updateProfile(MemberVO mp) {
		this.sqlSession.update("profile_up",mp);
	}
	
}
