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
    public MemberVO pwdCK(String pass_modify_id) {
        return this.sqlSession.selectOne("pwd_ck", pass_modify_id);
    }

	@Override
	public MemberVO getMemberID(int mem_no) {
		return this.sqlSession.selectOne("mem_getID",mem_no);
	}
	
	
}
