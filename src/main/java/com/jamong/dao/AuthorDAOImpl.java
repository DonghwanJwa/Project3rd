package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.AuthorVO;
import com.jamong.domain.RequestAuthorVO;

@Repository
public class AuthorDAOImpl implements AuthorDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int authorcheck(int no) {
		return this.sqlSession.selectOne("acheck",no);
	}

	@Override
	public void sendAuthor(AuthorVO a) {
		this.sqlSession.insert("sendAuthor",a);
	}

	@Override
	public int req_count(RequestAuthorVO a) {
		return this.sqlSession.selectOne("req_count",a);
	}

	@Override
	public List<AuthorVO> req_list(RequestAuthorVO a) {
		return this.sqlSession.selectList("req_list",a);
	}

	@Override
	public AuthorVO req_info(int no) {
		return this.sqlSession.selectOne("req_info",no);
	}

	@Override
	public AuthorVO get_file(int no) {
		return this.sqlSession.selectOne("req_file",no);
	}

	@Override
	public List<AuthorVO> getFileList(int no) {
		return this.sqlSession.selectOne("fileList",no);
	}

	@Override
	public void acceptAuthor(HashMap<String,Object> am) {
		this.sqlSession.update("accept_author",am);
	}

	@Override
	public void editAuthor(HashMap<String,Object> am) {
		this.sqlSession.update("edit_author",am);
	}

	@Override
	public void rejectAuthor(HashMap<String,Object> am) {
		this.sqlSession.update("reject_author",am);
	}


	
}
