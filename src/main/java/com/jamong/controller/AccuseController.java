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

import com.jamong.domain.AccuseVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.AccuseService;
import com.jamong.service.MemberService;

@Controller
public class AccuseController {

	@Autowired
	private AccuseService accuseService;
	
	@RequestMapping("accuse")
	public ModelAndView accuse() {
		return null;
	}
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("accuse_report_ok")
	
	public ModelAndView accuse_report_ok(AccuseVO a,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		session=request.getSession();
		
		MemberVO user=(MemberVO) session.getAttribute("m");
		
		ModelAndView m=new ModelAndView();
		
		String ac_cont=request.getParameter("ac_cont");
		String ac_reason=request.getParameter("ac_reason");
		int ac_item= Integer.parseInt(request.getParameter("ac_item"));
		//하늘아.. Integer.parseInt에 바로 ac_item을 넣는게 아니라 parameter를 가지고 와서 넣어야지...
		
		String ref = request.getHeader("referer");
		
		String[] sid=ref.split("/");	//sid 라는 배열에 ref에 넣은 신고한페이지주소값을 /단위로 쪼개넣음
		String ac_member=sid[4].substring(1,sid[4].length());
		System.out.println(ac_member);

		MemberVO mem=this.memberService.get(ac_member);
		int mem_no=mem.getMem_no();
		
		a.setAc_member(mem_no);
		a.setAc_cont(ac_cont);			//신고내용
		a.setAc_reason(ac_reason);		//신고사유(버튼)
		a.setAc_item(ac_item);			//신고페이지(1-프로필,2-글읽기)
		a.setMem_no(user.getMem_no());	//신고자 NO값 
		
		this.accuseService.insertAccuse(a);
	
		out.println("<script>");
		out.println("alert('문의가 접수되었습니다!');");
		out.println("location='"+ref+"';");
		out.println("</script>");
		
		return null;		
	}
	/* 관리자 신고목록 페이지 */
	@RequestMapping("admin_accuse")
	public ModelAndView admin_accuse(AccuseVO a,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
	throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session=request.getSession();
	
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login/1';");
			out.println("</script>");
		}else {
			//this.accuseService.selectReporter();
			//this.accuseService.selectRespondent();
			
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String search_field=request.getParameter("search_field");
			String search_field_item=request.getParameter("search_field_item");
			String search_field_handling=request.getParameter("search_field_handling");
			String search_field_info=request.getParameter("search_field_info");
			String search_name=request.getParameter("search_name");
			
			a.setSearch_name("%"+search_name+"%");
			a.setSearch_field(search_field);
			a.setSearch_field_item(search_field_item);
			a.setSearch_field_handling(search_field_handling);
			a.setSearch_field_info(search_field_info);
			
			
			int listcount=this.accuseService.getListCount(a);
			
			a.setStartrow((page-1)*10+1);
			a.setEndrow(a.getStartrow()+limit-1);
			
			List<AccuseVO> alist=this.accuseService.getAccuseList(a);
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
		
			ModelAndView m=new ModelAndView();
			
			 
			
			m.addObject("alist",alist);
			m.addObject("page",page);
			m.addObject("startpage",startpage);
			m.addObject("endpage",endpage);
			m.addObject("maxpage",maxpage);
			m.addObject("listcount",listcount);
			m.addObject("search_field",search_field);		
			m.addObject("search_field_item",search_field_item);
			m.addObject("search_field_handling",search_field_handling);
			m.addObject("search_field_info",search_field_info);
			m.addObject("search_name",search_name);
			
			m.setViewName("jsp/admin_accuse");
			
			return m;
		}	
			return null;
	}
		
	}
