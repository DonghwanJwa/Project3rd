package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
}