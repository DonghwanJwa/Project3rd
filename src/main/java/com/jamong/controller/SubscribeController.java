package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.SubscribeService;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeService subService;
}
