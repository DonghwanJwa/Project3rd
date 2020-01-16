package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.VisitDAO;
import com.jamong.domain.VisitVO;

@Service
public class VisitServiceImpl implements VisitService{

	@Autowired
	private VisitDAO visitDao;
	
	@Override
	public List<VisitVO> chartVisitorCount() {
		return this.visitDao.chartVisitorCount();
	}

	@Override
	public List<VisitVO> chartTotalCount() {
		return this.visitDao.chartTotalCount();
	}

}
