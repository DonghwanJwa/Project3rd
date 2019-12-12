package com.jamong.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;

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
	public void memberUpdate(MemberVO vo) {
		this.sqlSession.update("mem_update", vo);
	}


}
