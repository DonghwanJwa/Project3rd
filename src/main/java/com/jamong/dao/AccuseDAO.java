package com.jamong.dao;

import java.util.List;

import com.jamong.domain.AccuseVO;
import com.jamong.domain.InquireVO;

public interface AccuseDAO {

	void insertAccuse(AccuseVO a);

	int AccuseCount(AccuseVO a);

	List<AccuseVO> getAccuseList(AccuseVO a);

}
