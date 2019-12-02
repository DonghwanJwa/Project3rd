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

import com.jamong.domain.NoticeVO;
import com.jamong.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	/* 공지사항 목록 */
	@RequestMapping("admin_notice")
	public ModelAndView admin_notice (HttpSession session, HttpServletRequest request, HttpServletResponse response, NoticeVO n) throws Exception {
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
			String search_field=request.getParameter("search_field");
			
			n.setSearch_name("%"+search_name+"%");
			n.setSearch_field(search_field);
			
			int listcount=this.noticeService.getListCount(n);
			
			n.setStartrow((page-1)*10+1);
			n.setEndrow(n.getStartrow()+limit-1);
			
			List<NoticeVO> nlist=this.noticeService.getNoticeList(n);
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			ModelAndView m=new ModelAndView("jsp/admin_notice");
			
			m.addObject("n",n);
			m.addObject("nlist",nlist);
			m.addObject("page",page);
			m.addObject("startpage",startpage);
			m.addObject("endpage",endpage);
			m.addObject("maxpage",maxpage);
			m.addObject("search_name",search_name);
			m.addObject("search_field"+search_field);
			m.addObject("listcount",listcount);
			
			return m;
		}
		return null;
	}
	
	/* 공지사항 쓰기 페이지 */
	@RequestMapping("admin_notice_write")
	public ModelAndView admin_notice_write(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			ModelAndView m=new ModelAndView();
			m.setViewName("admin_notice_write");
			
			return m;
		}
		return null;
	} // admin_notice_write()
	
	/* 공지사항 쓰기 저장 */
	@RequestMapping("admin_notice_insert")
	public ModelAndView admin_notice_insert(NoticeVO n) throws Exception {
		this.noticeService.noticeInsert(n);
		
		return new ModelAndView("redirect:/admin_notice");
	}
}
