package com.jamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamong.dao.OfferDAO;

@Service
public class OfferServiceImpl implements OfferService {

	@Autowired
	private OfferDAO offerDao;
}
