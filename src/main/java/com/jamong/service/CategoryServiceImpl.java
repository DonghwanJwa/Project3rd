package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.CategoryDAO;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO catDao;
}
