package com.jamong.service;

import java.util.List;

import com.jamong.domain.VisitVO;

public interface VisitService {

	List<VisitVO> chartVisitorCount();
	List<VisitVO> chartTotalCount();

}
