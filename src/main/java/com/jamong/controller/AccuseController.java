package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.AccuseService;

@Controller
public class AccuseController {

	@Autowired
	private AccuseService accuseService;
	
	
}
