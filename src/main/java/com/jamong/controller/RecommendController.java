package com.jamong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jamong.domain.MemberVO;
import com.jamong.domain.RecommendVO;
import com.jamong.service.RecommendService;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recService;

	@PostMapping("book/recommend_state/{book_no}")
	@ResponseBody
	public int recommend_state(@PathVariable int book_no, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("m");
		int re = 0; // 추천 안함
		if (m != null) {// 로그인 되어있지 않으면 실행되지 않음
			RecommendVO rvo = new RecommendVO();
			rvo.setBook_no(book_no);
			rvo.setMem_no(m.getMem_no());

			RecommendVO result = this.recService.getRecommendState(rvo);
			if (result != null) {
				re = 1;
			}
		}
		return re;
	}
}
