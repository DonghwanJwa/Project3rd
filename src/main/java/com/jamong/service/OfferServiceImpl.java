package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.OfferDAO;
import com.jamong.domain.OfferVO;

@Service
public class OfferServiceImpl implements OfferService {

	@Autowired
	private OfferDAO offerDao;

	@Override
	public void offer_send(OfferVO ov) {
		this.offerDao.offer_send(ov);
	}
}
