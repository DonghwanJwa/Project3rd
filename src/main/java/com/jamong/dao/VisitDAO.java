package com.jamong.dao;

import java.util.List;

import com.jamong.domain.VisitVO;

public interface VisitDAO {

	List<VisitVO> chartVisitorCount();
	List<VisitVO> chartTotalCount();

}
