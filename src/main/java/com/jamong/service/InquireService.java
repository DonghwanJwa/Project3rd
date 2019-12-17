package com.jamong.service;

import java.util.List;

import com.jamong.domain.InquireVO;

public interface InquireService {

	void insertInquire(InquireVO i);

	int getListCount(InquireVO i);

	List<InquireVO> getInquireList(InquireVO i);

	InquireVO getInquireMem(int no);

}
