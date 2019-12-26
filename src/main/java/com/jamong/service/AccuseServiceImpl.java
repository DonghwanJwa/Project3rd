package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.AccuseDAO;
import com.jamong.domain.AccuseVO;
import com.jamong.domain.InquireVO;

@Service
public class AccuseServiceImpl implements AccuseService {

	@Autowired
	private AccuseDAO accuseDao;

	@Override
	public void insertAccuse(AccuseVO a) {
		this.accuseDao.insertAccuse(a);
		
	}

	@Override
	public int getListCount(AccuseVO a) {
		return this.accuseDao.AccuseCount(a);
	}

	@Override
	public List<AccuseVO> getAccuseList(AccuseVO a) {
		return this.accuseDao.getAccuseList(a);
	}

	@Override
	public void selectReporter(int mem_no) {
		this.accuseDao.selectReporter(mem_no);
	}

	@Override
	public void selectRespondent(int ac_member) {
		this.accuseDao.selectRespondent(ac_member);
	}

	@Override
	public AccuseVO getAccuseMem(int no) {
		return this.accuseDao.getAccuseMem(no);
	}

	@Override
	public void updateAccuse(AccuseVO ac) {
		this.accuseDao.updateAccuse(ac);
	}

	@Override
	public void accuseDel(int ac_no) {
		this.accuseDao.accuseDel(ac_no);
		
	}




	
	
	
}
