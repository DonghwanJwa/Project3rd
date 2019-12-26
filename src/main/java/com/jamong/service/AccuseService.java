package com.jamong.service;

import java.util.List;

import com.jamong.domain.AccuseVO;
import com.jamong.domain.InquireVO;

public interface AccuseService {

	void insertAccuse(AccuseVO a);

	int getListCount(AccuseVO a);

	List<AccuseVO> getAccuseList(AccuseVO a);

	void selectReporter(int mem_no);

	void selectRespondent(int ac_member);

	AccuseVO getAccuseMem(int no);

	void updateAccuse(AccuseVO ac);

	void accuseDel(int ac_no);



	

}
