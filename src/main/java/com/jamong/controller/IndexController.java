package com.jamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	@RequestMapping("policy_terms")
	public String policy_terms() {
		return "policy_terms";
	}
	
	@RequestMapping("policy_privacy")
	public String policy_privacy() {
		return "policy_privacy";
	}
	
}