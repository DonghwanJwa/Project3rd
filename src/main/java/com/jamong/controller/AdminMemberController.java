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
		
		String adm_id=(String)session.getAttribute("adm_id");
		
		if(adm_id == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			int page=1;
			int limit=10;
			
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
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
			
			me.setStartrow((page-1)*10+1);
			me.setEndrow(me.getStartrow()+limit-1);
			
			List<MemberVO> mlist=this.admMemService.memList(me);
			
			int maxpage=(int)((double)mcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if (endpage > startpage+10-1) endpage=startpage+10-1;
			
			ModelAndView m=new ModelAndView();
			
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
}
