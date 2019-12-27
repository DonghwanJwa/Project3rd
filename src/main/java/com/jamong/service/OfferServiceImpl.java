package com.jamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.OfferDAO;
import com.jamong.domain.AdminOfferVO;
import com.jamong.domain.OfferVO;

@Service
public class OfferServiceImpl implements OfferService {

	@Autowired
	private OfferDAO offerDao;

	@Override
	public void offer_send(OfferVO ov) {
		this.offerDao.offer_send(ov);
	}

	@Override
	public int offer_count(OfferVO ov) {
		return this.offerDao.offer_count(ov);
	}

	@Override
	public List<AdminOfferVO> offer_list(AdminOfferVO ao) {
		return this.offerDao.offer_list(ao);
	}

	@Override
	public AdminOfferVO offer_info(int no) {
		return this.offerDao.offer_info(no);
	}
}
