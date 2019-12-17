package com.jamong.dao;

import java.util.List;

import com.jamong.domain.AuthorVO;

public interface AuthorDAO {

	void sendAuthor(AuthorVO a);

	int req_count(AuthorVO a);

	List<AuthorVO> req_list(AuthorVO a);

	AuthorVO req_info(int no);

	int authorcheck(int no);
}
