package com.jamong.service;

import java.util.List;

import com.jamong.domain.AuthorVO;

public interface AuthorService {

	void sendAuthor(AuthorVO a);

	int req_count(AuthorVO a);

	List<AuthorVO> req_list(AuthorVO a);

}
