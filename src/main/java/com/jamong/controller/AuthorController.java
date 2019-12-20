package com.jamong.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AuthorVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.RequestAuthorVO;
import com.jamong.service.AuthorService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AuthorController {

	@Autowired
	private AuthorService authorService;
	
	/* 페이지 매핑 */
	@RequestMapping("request_author")
	public ModelAndView request_author(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		session=request.getSession();
		PrintWriter out=response.getWriter();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다. 로그인 해주세요.');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			int no=adm_m.getMem_no();
			int acheck=this.authorService.authorcheck(no);
			
			if(acheck != 0) {
				out.println("<script>");
				out.println("alert('심사중인 작가신청이 존재합니다.\\n결과를 기다려주세요!');");
				out.println("history.back();");
				out.println("</script>"); 
			}else {
				return new ModelAndView("jsp/request_author");
			}
		}
		return null;
	} // request_author()
	
	/* 작가신청 보내기 */
	@RequestMapping("request_author_in")
	public ModelAndView request_author_in(HttpSession session, HttpServletRequest request, HttpServletResponse response, AuthorVO a) throws Exception{
		session=request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
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
		
		String aut_file1 = "/resources/upload/author/"+fileName1;
		String aut_file2 = "/resources/upload/author/"+fileName2;
		String aut_file3 = "/resources/upload/author/"+fileName3;
		
		a.setAut_intro(aut_intro);
		a.setAut_plan(aut_plan);
		a.setAut_url1(aut_url1);
		a.setAut_url2(aut_url2);
		a.setAut_url3(aut_url3);
		a.setAut_file1(aut_file1);
		a.setAut_file2(aut_file2);
		a.setAut_file3(aut_file3);
		
		this.authorService.sendAuthor(a);
			
		out.println("<script>");
		out.println("alert('작가신청이 완료되었습니다.');");
		out.println("history.go(-2);");
		out.println("</script>");
		
		return null;
	} // request_author_in()
	
	/* 관리자 페이지 작가신청 리스트 */
	@RequestMapping("admin_author")
	public ModelAndView admin_author (HttpSession session, HttpServletRequest request, HttpServletResponse response, RequestAuthorVO a) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		MemberVO adm_m=(MemberVO)session.getAttribute("m"); // 세션에 저장된 값 가져오기
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login'");
			out.println("</script>");
		}else {
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String search_name=request.getParameter("search_name");
			String search_field1=request.getParameter("search_field1");
			String search_field2=request.getParameter("search_field2");
			
			a.setSearch_name("%"+search_name+"%");
			a.setSearch_field1(search_field1);
			a.setSearch_field2(search_field2);

			int listcount=this.authorService.req_count(a);
			
			a.setStartrow((page-1)*10+1);
			a.setEndrow(a.getStartrow()+limit-1);
			
			List<AuthorVO> reqlist=this.authorService.req_list(a);
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			ModelAndView mv=new ModelAndView();
						
			mv.addObject("a",a);
			mv.addObject("listcount",listcount);
			mv.addObject("reqlist",reqlist);
			mv.addObject("page",page);
			mv.addObject("maxpage",maxpage);
			mv.addObject("startpage",startpage);
			mv.addObject("endpage",endpage);
			mv.addObject("search_name",search_name);
			mv.addObject("search_field1",search_field1);
			mv.addObject("search_field2",search_field2);
			
			mv.setViewName("jsp/admin_author");
			
			return mv;
		}
		return null;
	} // admin_author()
	
	/* 관리자 페이지 작가신청 내용보기 */
	@RequestMapping("admin_author_info")
	public ModelAndView admin_author_info(HttpSession session, HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		session=request.getSession();
		PrintWriter out=response.getWriter();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			ModelAndView mv=new ModelAndView();
			int page=1;
			if(request.getParameter("page") != null) page=Integer.parseInt(request.getParameter("page"));
			
			AuthorVO a=this.authorService.req_info(no);
			
			String aut_intro=a.getAut_intro();
			String aut_plan=a.getAut_plan();
			
			if(a.getAut_intro() != null) {
				aut_intro=a.getAut_intro().replace("\n", "<br/>");
			}
			if(a.getAut_plan() != null) {
				aut_plan=a.getAut_plan().replace("\n", "<br/>");
			}
			String fileName1=a.getAut_file1().substring(a.getAut_file1().lastIndexOf("/")+1);
			String fileName2=a.getAut_file2().substring(a.getAut_file2().lastIndexOf("/")+1);
			String fileName3=a.getAut_file3().substring(a.getAut_file3().lastIndexOf("/")+1);
			
			mv.setViewName("jsp/admin_author_info");
			
			mv.addObject("a",a);
			mv.addObject("no",no);
			mv.addObject("page",page);
			mv.addObject("aut_intro",aut_intro);
			mv.addObject("aut_plan",aut_plan);
			mv.addObject("fileName1",fileName1);
			mv.addObject("fileName2",fileName2);
			mv.addObject("fileName3",fileName3);
			
			return mv;
		}
		
		return null;
	} // admin_author_info()
	
	@RequestMapping("author_file")
	public ModelAndView author_file(HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		AuthorVO a=this.authorService.get_file(no);
		
		/*경로제외 파일명*/
		String fileName1=a.getAut_file1().substring(a.getAut_file1().lastIndexOf("/")+1);
		
		/*저장할 폴더 경로*/
		Calendar c = Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH)+1;
		int date=c.get(Calendar.DATE);
		
		if(a.getAut_file1() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/AuthorRequest/"+year+"-"+month+"-"+date;
			File folder=new File(downPath);
		
			if(!folder.exists()) {
				folder.mkdirs();
			}
		
			// 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.
			response.setContentType("application/octet-stream");
		
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName1 + "\";");
	    
			String pathAndName1=request.getServletContext().getRealPath("/")+a.getAut_file1();
	    
			File aut_file1=new File(pathAndName1);
	    
			/* 읽어와야 할 용량은 최대 업로드 용량을 초과하지 않는다. */
			byte[] b = new byte[50*1024*1024];

			FileInputStream in1=new FileInputStream(aut_file1);
			BufferedInputStream bis=new BufferedInputStream(in1);
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			if (aut_file1.isFile() && aut_file1.length() > 0){ 
				int read=0;
	    	
				while((read=bis.read(b)) != -1) {
					bos.write(b , 0 , read);
				}
				bos.close();
				bis.close();
			}
			ModelAndView mv=new ModelAndView("jsp/admin_author_info");
			mv.addObject(aut_file1);
		}
		
		return null;
	}
}
