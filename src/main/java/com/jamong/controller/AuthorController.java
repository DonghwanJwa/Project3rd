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

import com.jamong.domain.AuthorVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.AuthorService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AuthorController {

	@Autowired
	private AuthorService authorService;
	
	/* 페이지 매핑 */
	@RequestMapping("request_author")
	public ModelAndView request_author() {
		return new ModelAndView("/jsp/request_author");
	} // request_author()
	
	/* 작가신청 보내기 */
	@RequestMapping("request_author_in")
	public ModelAndView request_author_in(HttpSession session, HttpServletRequest request, HttpServletResponse response, AuthorVO a) throws Exception{
		session=request.getSession();
		
		MemberVO m=(MemberVO)session.getAttribute("m"); // 세션에 저장된 사용자 정보
		a.setMem_no(m.getMem_no()); // author테이블에 세션의 mem_no 저장
		
		int maxSize= 1024*1024*50; // 50MB 제한
		String filePath=request.getServletContext().getRealPath("resources/upload/author/"); // 저장되는 파일 경로
		String aut_no=Integer.toString(a.getAut_no());
		
		String d_filePath=filePath+aut_no;
		
		
		MultipartRequest multi = new MultipartRequest (request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String aut_intro = multi.getParameter("aut_intro");
		String aut_plan = multi.getParameter("aut_plan");
		String aut_url1 =multi.getParameter("aut_url1");
		String aut_url2 =multi.getParameter("aut_url2");
		String aut_url3 =multi.getParameter("aut_url3");
		
		String fileName1 = multi.getFilesystemName("aut_file1");
		String fileName2 = multi.getFilesystemName("aut_file2");
		String fileName3 = multi.getFilesystemName("aut_file3");
		
		String aut_file1 = "/jamong.com/resources/upload/author/"+fileName1;
		String aut_file2 = "/jamong.com/resources/upload/author/"+fileName2;
		String aut_file3 = "/jamong.com/resources/upload/author/"+fileName3;
		
		a.setAut_intro(aut_intro);
		a.setAut_plan(aut_plan);
		a.setAut_url1(aut_url1);
		a.setAut_url2(aut_url2);
		a.setAut_url3(aut_url3);
		a.setAut_file1(aut_file1);
		a.setAut_file2(aut_file2);
		a.setAut_file3(aut_file3);
		
		ModelAndView mv = new ModelAndView("redirect:/jamong.com/");
		
		this.authorService.sendAuthor(a);
		
		return mv;
	} // request_author_in()
	
	/* 관리자 페이지 작가신청 리스트 */
	@RequestMapping("admin_author")
	public ModelAndView admin_author (HttpSession session, HttpServletRequest request, HttpServletResponse response, AuthorVO a) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		MemberVO adm_m=(MemberVO)session.getAttribute("m"); // 세션에 저장된 값 가져오기
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("<script>");
			out.println("</script>");
		}else {
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String search_name=request.getParameter("search_name");
			String search_field=request.getParameter("search_field");
			
			a.setSearch_name("%"+search_name+"%");
			a.setSearch_field(search_field);
			a.setStartrow((page-1)*10+1);
			a.setEndrow(a.getStartrow()+limit-1);
			
			int listcount=this.authorService.req_count(a);
			
			List<AuthorVO> reqlist=this.authorService.req_list(a);
			
			
			ModelAndView mv=new ModelAndView();
			mv.setViewName("jsp/admin_author");
		}
		
		
		return null;
	}
}
