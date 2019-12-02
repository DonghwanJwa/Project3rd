package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.service.OfferService;

@Controller
public class OfferController {

	@Autowired
	private OfferService offerService;
	
	@RequestMapping("offer_author")
	public ModelAndView user_offer_author() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/offer_author");
		
		return mv;
	}
}
