package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AccuseVO;
import com.jamong.domain.InquireVO;

@Repository
public class AccuseDAOImpl implements AccuseDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertAccuse(AccuseVO a) {
		this.sqlSession.insert("insert_acc",a);
		
	}

	@Override
	public int AccuseCount(AccuseVO a) {
		return this.sqlSession.selectOne("AccuseCount",a);
	}

	@Override
	public List<AccuseVO> getAccuseList(AccuseVO a) {
		return this.sqlSession.selectList("getAccuseList",a);
	}

	@Override
	public void selectReporter(int mem_no) {
		this.sqlSession.selectOne("selectReporter",mem_no);
		
	}

	@Override
	public void selectRespondent(int ac_member) {
		this.sqlSession.selectOne("selectRespondent",ac_member);
	}

	@Override
	public AccuseVO getAccuseMem(int no) {
		return this.sqlSession.selectOne("getAccuseMem",no);
	}

	@Override
	public void updateAccuse(AccuseVO ac) {
		this.sqlSession.update("ac_update",ac);
		
	}

	@Override
	public void accuseDel(int ac_no) {
		this.sqlSession.delete("ac_del",ac_no);
		
	}

}
