package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.InquireService;

@Controller
public class InquireController {

	@Autowired
	private InquireService inqService;
}
