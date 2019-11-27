package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.SympathyDAO;

@Service
public class SympathyServiceImpl implements SympathyService {

	@Autowired
	private SympathyDAO symDao;
}
