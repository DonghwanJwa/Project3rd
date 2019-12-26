package com.jamong.dao;

import java.util.List;

import com.jamong.domain.InquireVO;

public interface InquireDAO {

	void insertInquire(InquireVO i);

	int getListCount(InquireVO i);

	List<InquireVO> getInquireList(InquireVO i);

	InquireVO getInquireMem(int no);

	void updateInquire(InquireVO inq);

	InquireVO getFile(int no);

	void inquireDel(int no);


}
