package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.MemberVO;
import com.jamong.service.FeedService;

@Controller
public class FeedController {

	@Autowired
	private FeedService feedService;
	
	@RequestMapping("feed")
	public ModelAndView user_Feed(
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		MemberVO feedM = (MemberVO)session.getAttribute("m");
		if(feedM != null) {
			
			List<MemberVO> fList = this.feedService.getUserFeedList(feedM.getMem_no());
			
			mv.addObject("fList",fList);
			mv.setViewName("jsp/feed");
			return mv;
		}else {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다!');");
			out.println("location='login/1';");
			out.println("</script>");
		}
		
		return null;
	}
}
