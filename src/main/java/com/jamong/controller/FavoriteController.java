package com.jamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jamong.service.FavoriteService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService favService;
}
