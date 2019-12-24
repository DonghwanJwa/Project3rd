package com.jamong.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.MemberVO;
import com.jamong.domain.OfferVO;
import com.jamong.service.MemberService;
import com.jamong.service.OfferService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class OfferController {

	@Autowired
	private OfferService offerService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("offer_author/@{mem_id}")
	public ModelAndView user_offer_author(HttpServletRequest request, HttpServletResponse response, HttpSession session,@PathVariable String mem_id) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		session=request.getSession();
		PrintWriter out=response.getWriter();
		
		MemberVO m=(MemberVO)session.getAttribute("m");
		
		
		if(m == null) {
			out.println("<script>");
			out.println("alert('로그인 후 이용가능한 페이지 입니다.');");
			out.println("location='/jamong.com/login/1';");
			out.println("</script>");
		} else {
			// 제안하는 사용자 정보 세션에서 값 추출
			String user_email=m.getEmail_id();
			String user_domain=m.getEmail_domain();
			String phone01=m.getMem_phone01();
			String phone02=m.getMem_phone02();
			String phone03=m.getMem_phone03();

			MemberVO author=this.memberService.author_info(mem_id); // 제안받는 작가 정보 검색
			
			ModelAndView mv=new ModelAndView();
			mv.addObject("author",author);
			
			mv.addObject("user_email",user_email);
			mv.addObject("user_domain",user_domain);
			mv.addObject("phone01",phone01);
			mv.addObject("phone02",phone02);
			mv.addObject("phone03",phone03);
			
			mv.setViewName("jsp/offer_author");
			
			return mv;
		}
		
		return null;
	}
	
	@RequestMapping("offer_send")
	public ModelAndView offer_send(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		session=request.getSession();
		OfferVO ov=new OfferVO();
		
		MemberVO user=(MemberVO)session.getAttribute("m");
		ov.setMem_no(user.getMem_no());
		
		int maxSize= 1024*1024*50; // 50MB 제한
		String filePath=request.getServletContext().getRealPath("resources/upload/offer/"); // 저장되는 파일 경로
		
		MultipartRequest multi = new MultipartRequest (request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		return null;
	}
}
