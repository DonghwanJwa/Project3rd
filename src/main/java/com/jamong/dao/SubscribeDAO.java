package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.SubscribeVO;

public interface SubscribeDAO {

	void insertSub(SubscribeVO subvo);
	void deleteSub(SubscribeVO subvo);
	int subCount(int mem_no);
	SubscribeVO subCheck(HashMap<String, Object> submap);
	List<SubscribeVO> followerList(Object object);






}
