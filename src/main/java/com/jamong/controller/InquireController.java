package com.jamong.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.InquireVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.NoticeVO;
import com.jamong.service.InquireService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mailHandler.MailService;

@Controller
public class InquireController {

	@Autowired
	private InquireService inqService;

	@Autowired
	private MailService mailService;


	@RequestMapping("inquire")
	public String user_inquire() {

		return "jsp/inquire";
	}

	/* cos.jar를 활용한 첨부파일 추가 방법 */
	/* 문의하기 보내기 */
	@RequestMapping("inquire_ok")
	public ModelAndView user_inquire_ok(InquireVO i,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
					throws Exception {

		session=request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();

		MemberVO user=(MemberVO) session.getAttribute("m");
	    
		
		System.out.println(1);


		int maxSize = 10*1024*1024; // 10MB 제한
		String filePath=request.getServletContext().getRealPath("resources/upload/inquire/");
		
		MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		System.out.println(2);

		/* 입력값들을 multi 로부터 가져오는 역할을합니다 */

		String inq_item1 = multi.getParameter("inq_item1");
		String inq_email = multi.getParameter("inq_email");
		String inq_phone = multi.getParameter("inq_phone");
		String inq_cont  = multi.getParameter("inq_cont");

		String fileName1 = multi.getFilesystemName("inq_file1");
		String fileName2 = multi.getFilesystemName("inq_file2");
		String fileName3 = multi.getFilesystemName("inq_file3");
		String fileName4 = multi.getFilesystemName("inq_file4");

		String inq_file1 = "/resources/upload/inquire/"+fileName1;
		String inq_file2 = "/resources/upload/inquire/"+fileName2;
		String inq_file3 = "/resources/upload/inquire/"+fileName3;
		String inq_file4 = "/resources/upload/inquire/"+fileName4;

		i.setInq_file1(inq_file1);
		i.setInq_file2(inq_file2);
		i.setInq_file3(inq_file3);
		i.setInq_file4(inq_file4);
		i.setInq_item1(inq_item1);
		i.setInq_email(inq_email);
		i.setInq_phone(inq_phone);
		i.setInq_cont(inq_cont);
		
		System.out.println(3);

		/*		File UpFile = multi.getFile("inq_file1");

		if(UpFile != null) {//첨부파일이 있는 경우
			String fileName = UpFile.getName();//첨부한 파일명

			Calendar c = Calendar.getInstance();
			int year=c.get(Calendar.YEAR);
			int month=c.get(Calendar.MONTH)+1;
			int date=c.get(Calendar.DATE);


			System.out.println(4);

			/* 입력한 값들을 InquireVO객체 i에 저장 */

			System.out.println(fileName1);
			System.out.println(5);
		 // if => 파일이 있을때*/
		
	
			if(user != null) {
			i.setMem_no(user.getMem_no());
		}// if => 세션이 있을때


		this.inqService.insertInquire(i); //쿼리문 실행 메서드

		System.out.println(6);

		out.println("<script>");
		out.println("alert('문의가 접수되었습니다!');");
		out.println("location='/jamong.com';");
		out.println("</script>");

		return null;
	}
	@RequestMapping("admin_inquire")
	public ModelAndView admin_inquire(InquireVO i,
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

			i.setSearch_name("%"+search_name+"%");
			i.setSearch_field(search_field);
			i.setSearch_field_item(search_field_item);
			i.setSearch_field_handling(search_field_handling);
			i.setSearch_field_info(search_field_info);


			int listcount=this.inqService.getListCount(i);

			i.setStartrow((page-1)*10+1);
			i.setEndrow(i.getStartrow()+limit-1);

			List<InquireVO> ilist=this.inqService.getInquireList(i);

			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;

			ModelAndView m=new ModelAndView();

			m.addObject("ilist",ilist);
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

			m.setViewName("jsp/admin_inquire");

			return m;
		}	
		return null;


	}
	@RequestMapping("admin_inquire_info")
	public ModelAndView admin_inquire_info(InquireVO i,int no,
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
			int page=1;
			if(request.getParameter("page") != null) page=Integer.parseInt(request.getParameter("page"));


			i=this.inqService.getInquireMem(no);

			String inq_cont=i.getInq_cont().replace("\n", "<br/>");
			
			ModelAndView m=new ModelAndView();
			
			String fileName1=i.getInq_file1().substring(i.getInq_file1().lastIndexOf("/")+1);
			String fileName2=i.getInq_file2().substring(i.getInq_file2().lastIndexOf("/")+1);
			String fileName3=i.getInq_file3().substring(i.getInq_file3().lastIndexOf("/")+1);
			String fileName4=i.getInq_file4().substring(i.getInq_file4().lastIndexOf("/")+1);
			
			m.setViewName("jsp/admin_inquire_info");

			m.addObject("no",no);
			m.addObject("inq_cont",inq_cont);
			m.addObject("page",page);
			m.addObject("i",i);
			m.addObject("fileName1",fileName1);
			m.addObject("fileName2",fileName2);
			m.addObject("fileName3",fileName3);
			m.addObject("fileName4",fileName4);
			
			return m;
		}
		return null;
	}

	@RequestMapping("admin_inquire_info_ok")
	public String admin_inquire_info_ok(int inq_no,String inq_reply,String inq_email,Model m,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)
					throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		session=request.getSession();

		int page = Integer.parseInt(request.getParameter("page"));

		MemberVO adm_m = (MemberVO)session.getAttribute("m");

		if(adm_m == null) {
			out.println("<script>");
			out.println("$('.wrap-loading').hide();");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login/1';");
			out.println("</script>");
		}else {
			/*inq update문*/
			InquireVO inq = new InquireVO();
			inq.setInq_no(inq_no);
			inq.setInq_reply(inq_reply);
			inq.setInq_sender(adm_m.getMem_name());
			this.inqService.updateInquire(inq);

			/*inq 메일 보내기*/		
			String subject = "안녕하세요.자몽입니다. 문의드린 사항에 대한 답변을 드립니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("<h3 style=\"font-weight:normal\">");
			sb.append(inq_reply);
			sb.append("</h3>");

			boolean reply_ok = mailService.send(subject, sb.toString(), "projectJamong@gmail.com", inq_email, null, request);

			if(reply_ok) {
				out.println("<script>");
				out.println("alert('문의 답변이 완료되었습니다.');");
				out.println("location='admin_inquire_info?no="+inq_no+"&page="+page+"';");
				out.println("</script>");
			}else {				
				out.println("<script>");
				out.println("alert('처리과정중 에러가 발생하였습니다!');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return null;
	}
	@RequestMapping("inquireFile1")
	public ModelAndView inquireFile1(HttpServletRequest request,
			HttpServletResponse response,int no)
					throws Exception{

		InquireVO i=this.inqService.getFile(no);

		String fileName1=i.getInq_file1().substring(i.getInq_file1().lastIndexOf("/")+1);

		/* 저장할 폴더 경로*/
		Calendar c= Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int date=c.get(Calendar.DATE);

		if(i.getInq_file1() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {

			String downPath = "C:/jamongAdmin/InquireRequest/"+year+"-"+month+"-"+date;
			File folder=new File(downPath);

			if(!folder.exists()) {
				folder.mkdirs();
			}

			/* 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.*/
			response.setContentType("application/octet-stream");

			response.setHeader("Content-Disposition","attachment; filename=\""+ URLEncoder.encode(fileName1,"UTF-8")+"\";");

			/* 서버 실제 경로의 파일을구함*/
			String pathAndName1=request.getServletContext().getRealPath("/")+i.getInq_file1();
			System.out.println(pathAndName1);
			File inq_file1=new File(pathAndName1);

			/* 읽어와야 하는 용량은 최대 업로드 용량을 초과히지 않는다. */
			byte[] b = new byte[10*1024*1024];

			FileInputStream in=new FileInputStream(inq_file1);
			BufferedInputStream bu=new BufferedInputStream(in);
			BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());

			if (inq_file1.isFile() &&  inq_file1.length()>0) {
				int read=0;

				while((read=bu.read(b)) != -1){
					out.write(b , 0 , read);
				}
				out.flush();
				out.close();
				bu.close();
			}
			ModelAndView m=new ModelAndView();

			m.setViewName("jsp/admin_inquire_info");

			m.addObject(inq_file1);

		}



		return null;
	}
	@RequestMapping("inquireFile2")
	public ModelAndView inquireFile2(HttpServletRequest request,
			HttpServletResponse response,int no)
					throws Exception{
		
		InquireVO i=this.inqService.getFile(no);
		
		String fileName2=i.getInq_file2().substring(i.getInq_file2().lastIndexOf("/")+1);
		
		/* 저장할 폴더 경로*/
		Calendar c= Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int date=c.get(Calendar.DATE);
		
		if(i.getInq_file2() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/InquireRequest/"+year+"-"+month+"-"+date;
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			/* 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.*/
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition","attachment; filename=\""+ URLEncoder.encode(fileName2,"UTF-8")+"\";");
			
			/* 서버 실제 경로의 파일을구함*/
			String pathAndName2=request.getServletContext().getRealPath("/")+i.getInq_file2();
			System.out.println(pathAndName2);
			File inq_file2=new File(pathAndName2);
			
			/* 읽어와야 하는 용량은 최대 업로드 용량을 초과히지 않는다. */
			byte[] b = new byte[10*1024*1024];
			
			FileInputStream in=new FileInputStream(inq_file2);
			BufferedInputStream bu=new BufferedInputStream(in);
			BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());
			
			if (inq_file2.isFile() &&  inq_file2.length()>0) {
				int read=0;
				
				while((read=bu.read(b)) != -1){
					out.write(b , 0 , read);
				}
				out.flush();
				out.close();
				bu.close();
			}
			ModelAndView m=new ModelAndView();
			
			m.setViewName("jsp/admin_inquire_info");
			
			m.addObject(inq_file2);
			
		}
		
		
		
		return null;
	}
	@RequestMapping("inquireFile3")
	public ModelAndView inquireFile3(HttpServletRequest request,
			HttpServletResponse response,int no)
					throws Exception{
		
		InquireVO i=this.inqService.getFile(no);
		
		String fileName3=i.getInq_file3().substring(i.getInq_file3().lastIndexOf("/")+1);
		
		/* 저장할 폴더 경로*/
		Calendar c= Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int date=c.get(Calendar.DATE);
		
		if(i.getInq_file3() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/InquireRequest/"+year+"-"+month+"-"+date;
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			/* 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.*/
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition","attachment; filename=\""+ URLEncoder.encode(fileName3,"UTF-8")+"\";");
			
			/* 서버 실제 경로의 파일을구함*/
			String pathAndName3=request.getServletContext().getRealPath("/")+i.getInq_file3();
			System.out.println(pathAndName3);
			File inq_file3=new File(pathAndName3);
			
			/* 읽어와야 하는 용량은 최대 업로드 용량을 초과히지 않는다. */
			byte[] b = new byte[10*1024*1024];
			
			FileInputStream in=new FileInputStream(inq_file3);
			BufferedInputStream bu=new BufferedInputStream(in);
			BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());
			
			if (inq_file3.isFile() &&  inq_file3.length()>0) {
				int read=0;
				
				while((read=bu.read(b)) != -1){
					out.write(b , 0 , read);
				}
				out.flush();
				out.close();
				bu.close();
			}
			ModelAndView m=new ModelAndView();
			
			m.setViewName("jsp/admin_inquire_info");
			
			m.addObject(inq_file3);
			
		}
		
		
		
		return null;
	}
	@RequestMapping("inquireFile4")
	public ModelAndView inquireFile4(HttpServletRequest request,
			HttpServletResponse response,int no)
					throws Exception{
		
		InquireVO i=this.inqService.getFile(no);
		
		String fileName4=i.getInq_file4().substring(i.getInq_file4().lastIndexOf("/")+1);
		
		/* 저장할 폴더 경로*/
		Calendar c= Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		int date=c.get(Calendar.DATE);
		
		if(i.getInq_file4() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/InquireRequest/"+year+"-"+month+"-"+date;
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			/* 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.*/
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition","attachment; filename=\""+ URLEncoder.encode(fileName4,"UTF-8")+"\";");
			
			/* 서버 실제 경로의 파일을구함*/
			String pathAndName4=request.getServletContext().getRealPath("/")+i.getInq_file4();
			System.out.println(pathAndName4);
			File inq_file4=new File(pathAndName4);
			
			/* 읽어와야 하는 용량은 최대 업로드 용량을 초과히지 않는다. */
			byte[] b = new byte[10*1024*1024];
			
			FileInputStream in=new FileInputStream(inq_file4);
			BufferedInputStream bu=new BufferedInputStream(in);
			BufferedOutputStream out=new BufferedOutputStream(response.getOutputStream());
			
			if (inq_file4.isFile() &&  inq_file4.length()>0) {
				int read=0;
				
				while((read=bu.read(b)) != -1){
					out.write(b , 0 , read);
				}
				out.flush();
				out.close();
				bu.close();
			}
			ModelAndView m=new ModelAndView();
			
			m.setViewName("jsp/admin_inquire_info");
			
			m.addObject(inq_file4);
			
		}
		
		
		
		return null;
	}

	/* 문의사항 삭제 */
	@RequestMapping("admin_inquire_del") 
	public ModelAndView admin_inquire_del(HttpSession session, HttpServletRequest request, HttpServletResponse 
			response, int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		no=Integer.parseInt(request.getParameter("no"));
		if(adm_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login/1';");
			out.println("</script>");
		}else {
			this.inqService.inquireDel(no);
			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location='admin_inquire';");
			out.println("</script>");
		}
		return null;
	}
}
