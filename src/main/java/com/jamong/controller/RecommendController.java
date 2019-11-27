package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recService;
}
