package com.jamong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.InquireVO;

@Repository
public class InquireDAOImpl implements InquireDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertInquire(InquireVO i) {
		this.sqlSession.insert("inq_insert",i);
		
	}

	@Override
	public int getListCount(InquireVO i) {
		return this.sqlSession.selectOne("inq_count",i);
	}

	@Override
	public List<InquireVO> getInquireList(InquireVO i) {
		return this.sqlSession.selectList("inq_list",i);
		
	}

	@Override
	public InquireVO getInquireMem(int no) {
		return this.sqlSession.selectOne("inq_cont_mem",no);
	}

	@Override
	public void updateInquire(InquireVO inq) {
		this.sqlSession.update("inq_update",inq);
	}

	@Override
	public InquireVO getFile(int no) {
		return this.sqlSession.selectOne("getFile",no);
	}

	@Override
	public void inquireDel(int no) {
		this.sqlSession.delete("inq_del",no);
		
	}

}
