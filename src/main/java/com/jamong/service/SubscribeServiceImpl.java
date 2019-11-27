package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.SubscribeDAO;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subDao;
}
