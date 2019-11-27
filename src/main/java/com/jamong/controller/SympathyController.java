package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.SympathyService;

@Controller
public class SympathyController {

	@Autowired
	private SympathyService symService;
}
