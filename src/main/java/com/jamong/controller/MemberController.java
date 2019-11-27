package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
}
