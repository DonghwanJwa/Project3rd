package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AccuseVO;
import com.jamong.service.AccuseService;

@Controller
public class AccuseController {

	@Autowired
	private AccuseService accuseService;
	
	@RequestMapping("accuse")
	public ModelAndView accuse() {
		return null;
	}
	@RequestMapping("accuse_report")
	public ModelAndView accuse_report(AccuseVO a)
	throws Exception{
		this.accuseService.accuse_insert(a);
		return null;
	}
	
}
