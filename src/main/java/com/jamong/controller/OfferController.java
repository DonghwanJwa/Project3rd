package com.jamong.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;

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

import mailHandler.MailService;

@Controller
public class OfferController {

	@Autowired
	private OfferService offerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	
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
	public ModelAndView offer_send(HttpServletRequest request, HttpServletResponse response, HttpSession session, MemberVO author) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		OfferVO ov=new OfferVO();
		
		MemberVO user=(MemberVO)session.getAttribute("m");

		if(user == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되어 로그인 창으로 이동합니다.');");
			out.println("location='/jamong.com/login/1';");
			out.println("</script>");
		}else {
			Calendar c = Calendar.getInstance();
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);
			
			int maxSize= 1024*1024*50; // 50MB 제한
			String downPath=request.getServletContext().getRealPath("resources/upload/offer/"); // 저장되는 파일 경로
			String filePath=downPath+year+"-"+month+"-"+date+"/"+user.getMem_id()+"/";
			
			File folder=new File(filePath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			MultipartRequest multi = new MultipartRequest (request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

			String off_id=multi.getParameter("id");
			String off_item=multi.getParameter("off_item");
			String off_email=multi.getParameter("off_email");
			String off_domain=multi.getParameter("off_domain");
			String off_phone1=multi.getParameter("off_phone1");
			String off_phone2=multi.getParameter("off_phone2");
			String off_phone3=multi.getParameter("off_phone3");
			String off_cont=multi.getParameter("off_cont");
			
			String file_name1=multi.getFilesystemName("off_file1");
			String file_name2=multi.getFilesystemName("off_file2");
			String file_name3=multi.getFilesystemName("off_file3");
			
			String off_file1=filePath+file_name1;
			String off_file2=filePath+file_name2;
			String off_file3=filePath+file_name3;
			
			author=this.memberService.author_info(off_id);
			
			ov.setOff_id(off_id);
			ov.setOff_item(off_item);
			ov.setOff_email(off_email);
			ov.setOff_domain(off_domain);
			ov.setOff_phone1(off_phone1);
			ov.setOff_phone2(off_phone2);
			ov.setOff_phone3(off_phone3);
			ov.setOff_cont(off_cont);
			ov.setOff_file1(off_file1);
			ov.setOff_file2(off_file2);
			ov.setOff_file3(off_file3);
			ov.setMem_no(user.getMem_no());
			
			String subject=off_item+"목적으로 작가님께 제안메일이 도착 했습니다.";
			
			String text=off_cont.replace("\n", "<br/>");
			String to=author.getEmail_id()+"@"+author.getEmail_domain();
			String[] files= {off_file1, off_file2, off_file3};
			
			StringBuilder mailCont=new StringBuilder();
			
			mailCont.append("<h3 style=\"font-weight:normal\">안녕하세요. "+author.getMem_nickname()+"님, 글에 꿈을 담다, 자몽입니다.</h3><br/><br/>");
			mailCont.append("작가님께 도착한 제안사항입니다. 신중히 검토하시기 바랍니다. <br/><br/>");
			mailCont.append("--------------------------------------------------------- <br/><br/>");
			mailCont.append(text+"<br/><br/>");
			mailCont.append("연락처 : "+off_phone1+"-"+off_phone2+"-"+off_phone3+"<br/><br/>");
			mailCont.append("이메일 : "+off_email+"@"+off_domain+"<br/><br/>");
			
			this.mailService.send(subject, mailCont.toString(), "projectJamong@gmail.com", to, files, request);
			
			this.offerService.offer_send(ov);
			
			out.println("<script>");
			out.println("alert('작가님께 제안사항이 전달 되었습니다.');");
			out.println("location='/jamong.com/';");
			out.println("</script>");
			
		}
		
		return null;
	}
}
