package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.InquireDAO;

@Service
public class InquireServiceImpl implements InquireService {

	@Autowired
	private InquireDAO inqDao;
}
