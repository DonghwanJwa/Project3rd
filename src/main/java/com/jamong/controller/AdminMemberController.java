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
import com.jamong.service.AdminMemService;

@Controller
public class AdminMemberController {
	@Autowired
	private AdminMemService admMemService;
	
	 /* 회원관리 페이지 회원 목록 */
	@RequestMapping("admin_member")
	public ModelAndView admin_member(HttpSession session, HttpServletRequest request, HttpServletResponse response, MemberVO me) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		/* 세션 유효성 검증 */
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			int page=1;
			int limit=10; // 한 페이지에 보여지는 목록 개수
			if(request.getParameter("page") != null) { // get 방식으로 전달된 쪽번호가 있는 경우
				page=Integer.parseInt(request.getParameter("page")); // 전달된 쪽번호를 정수 숫자로 바꾼다.
			}
			
			String search_name=request.getParameter("search_name");
			String search_field_state=request.getParameter("search_field_state");
			String search_field_author=request.getParameter("search_field_author");
			String search_field_key=request.getParameter("search_field_key");
			
			me.setSearch_name("%"+search_name+"%");
			me.setSearch_field_state(search_field_state);
			me.setSearch_field_author(search_field_author);
			me.setSearch_field_key(search_field_key);
			
			int mcount=this.admMemService.memCount(me); // 회원 수
			
			me.setStartrow((page-1)*10+1); // 시작 행 번호
			me.setEndrow(me.getStartrow()+limit-1); // 끝 행 번호
			
			List<MemberVO> mlist=this.admMemService.memList(me);
			
			// 총 페이지
			int maxpage=(int)((double)mcount/limit+0.95);
			// 시작페이지
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			// 마지막 페이지
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;
			
			ModelAndView m=new ModelAndView();
			
			m.addObject("me",me);
			m.addObject("mlist",mlist);
			m.addObject("mcount",mcount);
			m.addObject("page",page);
			m.addObject("startpage",startpage);
			m.addObject("maxpage",maxpage);
			m.addObject("endpage",endpage);
			m.addObject("search_name",search_name);
			m.addObject("search_field_state",search_field_state);
			m.addObject("search_field_author",search_field_author);
			m.addObject("search_field_key",search_field_key);
			
			m.setViewName("jsp/admin_member");
			
			return m;
		}
		return null;
	} // adm_mem_list()
	
	@RequestMapping("admin_member_info")
	public ModelAndView admin_member_info (HttpSession session, HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) page=Integer.parseInt(request.getParameter("page"));

			MemberVO me=this.admMemService.memberInfo(no);
			
			String profile_cont=me.getProfile_cont();
			String mem_portfolio=me.getMem_portfolio();
			
			if(me.getMem_portfolio() != null) {
				mem_portfolio=me.getMem_portfolio().replace("\n", "<br/>");
			}
			if(me.getProfile_cont() != null) {
				profile_cont=me.getProfile_cont().replace("\n", "<br/>");
			}
			
			ModelAndView m = new ModelAndView();
			
			m.setViewName("jsp/admin_member_info");
			
			m.addObject("me",me);
			m.addObject("profile_cont",profile_cont);
			m.addObject("mem_portfolio",mem_portfolio);
			m.addObject("page",page);
			
			return m;
		}
		
		return null;
	}
}