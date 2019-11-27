package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.OfferService;

@Controller
public class OfferController {

	@Autowired
	private OfferService offerService;
}
