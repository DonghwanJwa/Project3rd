package com.jamong.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jamong.domain.FeedVO;
import com.jamong.domain.MemberVO;

public interface FeedService {

	List<FeedVO> getUserFeedList(int mem_no);

}
