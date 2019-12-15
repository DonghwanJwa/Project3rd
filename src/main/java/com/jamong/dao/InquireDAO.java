package com.jamong.dao;

import java.util.List;

import com.jamong.domain.InquireVO;

public interface InquireDAO {

	void insertInquire(InquireVO i);

	int getListCount(InquireVO i);

	List<InquireVO> getInquireList(InquireVO i);

	InquireVO getInquireCont(int no);

}
