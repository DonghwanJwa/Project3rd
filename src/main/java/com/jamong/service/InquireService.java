package com.jamong.service;

import java.util.List;

import com.jamong.domain.InquireVO;

public interface InquireService {

	void insertInquire(InquireVO i);

	int getListCount(InquireVO i);

	List<InquireVO> getInquireList(InquireVO i);

	InquireVO getInquireMem(int no);

	void updateInquire(InquireVO inq);

	InquireVO getFile(int no);

	void inquireDel(int no);

	List<InquireVO> newInquire(InquireVO i);


}
