package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
}
