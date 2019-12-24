package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import com.jamong.domain.SubscribeVO;

public interface SubscribeService {

	void insertSub(SubscribeVO subvo);

	void removeFollow(SubscribeVO subvo);

	int subCount(int mem_no);

	SubscribeVO subCheck(HashMap<String, Object> submap);





}
