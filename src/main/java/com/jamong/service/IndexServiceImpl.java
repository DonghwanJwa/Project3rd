package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.IndexDAO;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexDAO indexDao;
}
