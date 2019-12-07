package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.MemberVO;

@Repository
public class AdminMemDAOImpl implements AdminMemDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memCount(MemberVO me) {
		return this.sqlSession.selectOne("adm_mem_count",me);
	}
	
	@Override
	public List<MemberVO> memList(MemberVO me) {
		return this.sqlSession.selectList("adm_mem_list",me);
	}

}
