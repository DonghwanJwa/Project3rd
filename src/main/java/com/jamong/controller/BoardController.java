package com.jamong.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.BoardService;
import com.oreilly.servlet.MultipartRequest;

import pwdconv.PwdChange;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("read")
	public ModelAndView user_readCont() {
		ModelAndView mv=new ModelAndView();
		
		
		mv.setViewName("jsp/read");
		
		return mv;
	}
	
	@RequestMapping("write")
	public ModelAndView user_write(
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		ModelAndView mv=new ModelAndView();
		
		MemberVO m=(MemberVO)session.getAttribute("m");
		
		if(m == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다!');");
			out.println("location='login';");
			out.println("</script>");
		}else {
			mv.setViewName("jsp/jamong_write");			
			return mv;
		}// if else => 로그인 전 / 후
		
		return null;
	}
	@RequestMapping("write_ok")
	public ModelAndView user_write_ok(BoardVO b,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		String saveFolder=request.getRealPath("/resources/upload/user");
		int fileSize=100*1024*1024; // 첨부파일 최대크기		
		MultipartRequest multi=null;
		multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		
		// MultipartRequest로부터 각 파라미터값 저장
		String bo_title = multi.getParameter("bo_title");
		String bo_subtitle = multi.getParameter("bo_subtitle");
		String bo_cont = multi.getParameter("bo_cont");
		int bo_lock = Integer.parseInt(multi.getParameter("bo_lock"));
		int bo_type = Integer.parseInt(multi.getParameter("bo_type"));
		int fav_no = Integer.parseInt(multi.getParameter("fav_no"));
		
		File UpFile1 = multi.getFile("bo_thumbnail");
		if(UpFile1 != null) {
			String fileName = UpFile1.getName();
			Calendar c = Calendar.getInstance();
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);
			
			String homedir=saveFolder+"/thumbnail"+"/"+year+"-"+month+"-"+date;
			File path1 = new File(homedir);
			if(!(path1.exists())) {
				path1.mkdir(); // 폴더 생성
			}// 해당 폴더가 없을때
			
			Random r = new Random();
			int random=r.nextInt(100000000);
			int index=fileName.lastIndexOf(".");
			String fileExtendsion=fileName.substring(index+1);
			
			String refileName = fileName+year+month+date+random+"."+fileExtendsion;
			// 업로드파일명 + 년월일 + 난수 + 확장자
			String encryptionName = PwdChange.getPassWordToXEMD5String(refileName);
			String fileDBName="/"+encryptionName;
			
			UpFile1.renameTo(new File(saveFolder+"/"+refileName));
			
			b.setBo_thumbnail(fileDBName);
		}
		return null;
	}
	
	@RequestMapping("new_posts")
	public ModelAndView user_new_posts() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/new_posts");
		
		return mv;
	}
	
	@RequestMapping("search")
	public ModelAndView user_search(String result) {
		ModelAndView mv=new ModelAndView();
		
		if(result.equals("post")) {
			mv.setViewName("jsp/search_result(Post)");
		}else if(result.equals("author")) {
			mv.setViewName("jsp/search_result(Author)");
		}else if(result.equals("work")) {
			mv.setViewName("jsp/search_result(Work)");
		}// if else
		
		return mv;		
	}
}
