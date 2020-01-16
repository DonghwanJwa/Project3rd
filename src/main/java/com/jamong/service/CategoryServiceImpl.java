package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.CategoryDAO;
import com.jamong.domain.CategoryVO;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO catDao;

	@Override
	public List<CategoryVO> listCategory() {
		return this.catDao.listCategory();
	}
}
