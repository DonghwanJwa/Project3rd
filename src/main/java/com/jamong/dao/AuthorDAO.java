package com.jamong.dao;

import java.util.List;

import com.jamong.domain.AuthorVO;
import com.jamong.domain.RequestAuthorVO;

public interface AuthorDAO {

	void sendAuthor(AuthorVO a);

	int req_count(RequestAuthorVO a);

	List<AuthorVO> req_list(RequestAuthorVO a);

	AuthorVO req_info(int no);

	int authorcheck(int no);

	AuthorVO get_file(int no);
}
