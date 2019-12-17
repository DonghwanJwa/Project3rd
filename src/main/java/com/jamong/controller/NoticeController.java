package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.CategoryVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.NoticeVO;
import com.jamong.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	/** 관리자단 공지사항 페이지 **/
	
	/* 공지사항 목록 */
	@RequestMapping("admin_notice")
	public ModelAndView admin_notice (HttpSession session, HttpServletRequest request, HttpServletResponse response, NoticeVO n) throws Exception {
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
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			ModelAndView m=new ModelAndView();
			m.addObject("page",page); // 목록가기로 돌아 갔을 때 책갈피 기능
			m.setViewName("jsp/admin_notice_write");
			
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
	
	/* 공지사항 내용보기 +수정 폼 일괄처리 */
	@RequestMapping("admin_notice_cont")
	public ModelAndView admin_notice_cont(HttpSession session, HttpServletRequest request, HttpServletResponse response, int no, String state, NoticeVO n) throws Exception {
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
			
			n=this.noticeService.getNoticeCont(no);
			
			String noti_cont=n.getNoti_cont().replace("\n", "<br/>");
			
			ModelAndView m=new ModelAndView();
			
			m.addObject("n",n);
			m.addObject("noti_cont",noti_cont);
			m.addObject("page",page);
			
			if(state.equals("cont")) {
				m.setViewName("jsp/admin_notice_cont");
			}else if(state.equals("edit")) {
				m.setViewName("jsp/admin_notice_edit");
			}else if(state.equals("del")) {
				m.setViewName("jsp/admin_notice_del");
			}
			return m;
		}
		return null;
	} // admin_notice_cont()
	
	/* 공지사항 수정 기능 */
	@RequestMapping("admin_notice_edit")
	public ModelAndView admin_notice_edit(NoticeVO n, int page, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		session=request.getSession();
		PrintWriter out=response.getWriter();
		
		NoticeVO db_pwd=this.noticeService.getNoticeCont(n.getNoti_no());
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		String noti_pwd=request.getParameter("noti_pwd");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			if(!noti_pwd.equals(db_pwd.getNoti_pwd())) {
				out.println("<script>");
				out.println("alert('게시글 비밀번호가 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				this.noticeService.noticeEdit(n);
				
				ModelAndView m=new ModelAndView("redirect:/admin_notice_cont?no="+n.getNoti_no()+"&page="+page+"&state=cont");
				
				return m;
			}
		}
		return null;
	} // admin_notice_edit()
	
	/* 공지사항 삭제 */
	@RequestMapping("admin_notice_del") 
	public ModelAndView admin_notice_del(HttpSession session, HttpServletRequest request, HttpServletResponse response, int page, NoticeVO n) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		NoticeVO db_pwd=this.noticeService.getNoticeCont(n.getNoti_no());
		String noti_pwd=request.getParameter("noti_pwd");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
		}else {
			if(!noti_pwd.equals(db_pwd.getNoti_pwd())) {
				out.println("<script>");
				out.println("alert('게시글 비밀번호가 다릅니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				this.noticeService.noticeDel(n.getNoti_no());
				ModelAndView m=new ModelAndView("redirect:/admin_notice?page="+page);
				
				return m;
			}
		}
		return null;
	}
	
	/** 사용자단 공지사항 페이지 **/
	
	/*공지사항 헤더 메뉴 목록*/
	@RequestMapping("header_notice")
	public ResponseEntity<List<NoticeVO>> header_notice() {
		ResponseEntity<List<NoticeVO>> entity = null;
		try {
			entity = new ResponseEntity<>(this.noticeService.headerNotice(),HttpStatus.OK);					
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	/* 공지사항 목록 */
	@RequestMapping("notice")
	public ModelAndView notice (HttpServletRequest request, HttpServletResponse response, NoticeVO n) throws Exception {
	
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
			
			for(int i=0;i<nlist.size();i++) {
				String date = nlist.get(i).getNoti_date();
				date = date.substring(0,10);
				nlist.get(i).setNoti_date(date);
			}
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			ModelAndView m=new ModelAndView("jsp/notice");
			
			m.addObject("n",n);
			m.addObject("nlist",nlist);
			m.addObject("page",page);
			m.addObject("startpage",startpage);
			m.addObject("endpage",endpage);
			m.addObject("maxpage",maxpage);
			m.addObject("search_name",search_name);
			m.addObject("search_field"+search_field);
			
			return m;
	}
	
	/*공지사항 내용*/
	@RequestMapping("notice_cont")
	public ModelAndView notice_cont(int no,String state,NoticeVO n,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		n=this.noticeService.getNoticeCont(no);
		String noti_cont=n.getNoti_cont().replace("\n", "<br/>");
		
		ModelAndView m=new ModelAndView();
		m.addObject("n",n);
		m.addObject("noti_cont",noti_cont);
		m.addObject("page",page);
		if(state.equals("main")) {
			m.setViewName("jsp/notice_cont");
		}else if(state.equals("pop")) {
			m.setViewName("jsp/notice_cont(pop)");
		}
		return m;
	}
}
