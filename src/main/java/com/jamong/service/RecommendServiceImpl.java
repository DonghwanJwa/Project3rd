package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.RecommendDAO;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendDAO recDao;
}
