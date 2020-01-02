package com.jamong.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AdminOfferVO;
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
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '이전으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				history.back();\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		} else {
			// 제안하는 사용자 정보 세션에서 값 추출
			String user_email=m.getEmail_id();
			String user_domain=m.getEmail_domain();
			String phone01=m.getMem_phone01();
			String phone02=m.getMem_phone02();
			String phone03=m.getMem_phone03();

			MemberVO author=this.memberService.author_info(mem_id); // 제안받는 작가 정보 검색
			
			if(author.getMem_author() != 1) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
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
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
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
			
			author=this.memberService.author_info(off_id); // 작가 아이디로 필요한 작가 정보 검색
			
			ov.setOff_id(user.getMem_id());  // 제안자 아이디
			ov.setOff_nickname(user.getMem_nickname()); // 제안자 닉네임
			ov.setOff_item(off_item);		 // 제안목적
			ov.setOff_email(off_email);		 // 제안자 이메일
			ov.setOff_domain(off_domain);	 // 제안자 도메인
			ov.setOff_phone1(off_phone1);	 // 제안자 전화번호
			ov.setOff_phone2(off_phone2);
			ov.setOff_phone3(off_phone3);
			ov.setOff_cont(off_cont);		 // 제안 세부내용
			if(off_file1 != null) {
				ov.setOff_file1(off_file1);		 // 첨부파일
			}
			if(off_file2 != null) {
				ov.setOff_file2(off_file2);
			}
			if(off_file3 != null) {
				ov.setOff_file3(off_file3);
			}
			ov.setMem_no(author.getMem_no()); // 작가 회원번호
			
			String subject=user.getMem_nickname()+"님께서 "+off_item+"목적으로 작가님께 제안한 내용이 도착했습니다.";
			
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
			int sMem_no = user.getMem_no();
			HashMap<String, Object> om = new HashMap<>();
			om.put("ov",ov);
			om.put("sMem_no", sMem_no);
			this.offerService.offer_send(om);
			
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Success!',\r\n" + 
					"		text : '해당 작가님에게 제안메일이 발송되었습니다.',\r\n" + 
					"		icon: 'info',\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
			
		}
		
		return null;
	}
	
	@RequestMapping("admin_offer")
	public ModelAndView admin_offer(HttpServletRequest request, HttpServletResponse response, HttpSession session, OfferVO ov, AdminOfferVO ao) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		} else {
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				int page=1;
				int limit=10; // 한 페이지에 보여지는 목록 개수
				if(request.getParameter("page") != null) { // get 방식으로 전달된 쪽번호가 있는 경우
					page=Integer.parseInt(request.getParameter("page")); // 전달된 쪽번호를 정수 숫자로 바꾼다.
				}
				
				String search_name=request.getParameter("search_name");
				String search_field1=request.getParameter("search_field1");
				String search_field2=request.getParameter("search_field2");
				
				ov.setSearch_name("%"+search_name+"%");
				ov.setSearch_field1(search_field1);
				ov.setSearch_field2(search_field2);
				
				ao.setSearch_name("%"+search_name+"%");
				ao.setSearch_field1(search_field1);
				ao.setSearch_field2(search_field2);
				
				
				int offcount=this.offerService.offer_count(ov);
				
				ov.setStartrow((page-1)*10+1); // 시작 행 번호
				ov.setEndrow(ao.getStartrow()+limit-1); // 끝 행 번호
				
				ao.setStartrow((page-1)*10+1); // 시작 행 번호
				ao.setEndrow(ao.getStartrow()+limit-1); // 끝 행 번호
				
				List<AdminOfferVO> offList=this.offerService.offer_list(ao);
				
				// 총 페이지
				int maxpage=(int)((double)offcount/limit+0.95);
				// 시작페이지
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				// 마지막 페이지
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;
				
				ModelAndView mv=new ModelAndView();
				mv.setViewName("jsp/admin_offer");
				
				mv.addObject("ao",ao);
				mv.addObject("ov",ov);
				mv.addObject("offList",offList);
				mv.addObject("offcount",offcount);
				mv.addObject("page",page);
				mv.addObject("startpage",startpage);
				mv.addObject("endpage",endpage);
				mv.addObject("maxpage",maxpage);
				mv.addObject("search_field1",search_field1);
				mv.addObject("search_field2",search_field2);
				mv.addObject("search_name",search_name);
				
				return mv;
			}
		}
		return null;
	}
	
	@RequestMapping("admin_offer_info")
	public ModelAndView admin_offer_info (HttpServletRequest request, HttpServletResponse response, HttpSession session, int no, int page) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		} else {
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				AdminOfferVO ao=this.offerService.offer_info(no);
				page=1;
				if(request.getParameter("page") != null) {
					page=Integer.parseInt(request.getParameter("page"));
				}
				
				String fileName1=ao.getOff_file1().substring(ao.getOff_file1().lastIndexOf("/")+1);
				String fileName2=ao.getOff_file2().substring(ao.getOff_file2().lastIndexOf("/")+1);
				String fileName3=ao.getOff_file3().substring(ao.getOff_file3().lastIndexOf("/")+1);
				
				ModelAndView mv=new ModelAndView();
				mv.setViewName("jsp/admin_offer_info");
				
				mv.addObject("ao",ao);
				mv.addObject("page",page);
				mv.addObject("no",no);
				mv.addObject("fileName1",fileName1);
				mv.addObject("fileName2",fileName2);
				mv.addObject("fileName3",fileName3);
				
				return mv;
			}
		}
		
		return null;
	}
	
	@RequestMapping("offer_file1")
	public ModelAndView offer_file1(HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		
		AdminOfferVO ao=this.offerService.offer_info(no);
		
		/*경로제외 파일명*/
		String fileName1=ao.getOff_file1().substring(ao.getOff_file1().lastIndexOf("/")+1);
		
		/*저장할 폴더 경로*/
		Calendar c = Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH)+1;
		int date=c.get(Calendar.DATE);
		
		if(ao.getOff_file1() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/offer/"+year+"-"+month+"-"+date+"/"+ao.getOff_id();
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			// 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName1,"UTF-8") + "\";");
			
			// 서버 실제 경로의 파일을 구함
			String pathAndName=ao.getOff_file1();
			File off_file1=new File(pathAndName);			
			
			/* 읽어와야 할 용량은 최대 업로드 용량을 초과하지 않는다. */
			byte[] b = new byte[50*1024*1024];
			
			FileInputStream in=new FileInputStream(off_file1);
			BufferedInputStream bis=new BufferedInputStream(in);
			
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			
			if (off_file1.isFile() && off_file1.length() > 0){ 
				int read=0;
				
				while((read=bis.read(b)) != -1) {
					bos.write(b , 0 , read);
				}
				bos.flush();
				bos.close();
				bis.close();
			}
			ModelAndView mv=new ModelAndView("jsp/admin_offer_info");
			mv.addObject(off_file1);
		}
		
		return null;
	}
	@RequestMapping("offer_file2")
	public ModelAndView offer_file2(HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		
		AdminOfferVO ao=this.offerService.offer_info(no);
		
		/*경로제외 파일명*/
		String fileName2=ao.getOff_file2().substring(ao.getOff_file2().lastIndexOf("/")+1);
		
		/*저장할 폴더 경로*/
		Calendar c = Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH)+1;
		int date=c.get(Calendar.DATE);
		
		if(ao.getOff_file2() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/offer/"+year+"-"+month+"-"+date+"/"+ao.getOff_id();
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			// 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName2,"UTF-8") + "\";");
			
			// 서버 실제 경로의 파일을 구함
			String pathAndName=ao.getOff_file2();
			File off_file2=new File(pathAndName);			
			
			/* 읽어와야 할 용량은 최대 업로드 용량을 초과하지 않는다. */
			byte[] b = new byte[50*1024*1024];
			
			FileInputStream in=new FileInputStream(off_file2);
			BufferedInputStream bis=new BufferedInputStream(in);
			
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			
			if (off_file2.isFile() && off_file2.length() > 0){ 
				int read=0;
				
				while((read=bis.read(b)) != -1) {
					bos.write(b , 0 , read);
				}
				bos.flush();
				bos.close();
				bis.close();
			}
			ModelAndView mv=new ModelAndView("jsp/admin_offer_info");
			mv.addObject(off_file2);
		}
		
		return null;
	}
	@RequestMapping("offer_file3")
	public ModelAndView offer_file3(HttpServletRequest request, HttpServletResponse response, int no) throws Exception {
		
		AdminOfferVO ao=this.offerService.offer_info(no);
		
		/*경로제외 파일명*/
		String fileName3=ao.getOff_file3().substring(ao.getOff_file3().lastIndexOf("/")+1);
		
		/*저장할 폴더 경로*/
		Calendar c = Calendar.getInstance();
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH)+1;
		int date=c.get(Calendar.DATE);
		
		if(ao.getOff_file3() == null) {
			response.sendRedirect("/redirect.jsp");
		}else {
			
			String downPath = "C:/jamongAdmin/offer/"+year+"-"+month+"-"+date+"/"+ao.getOff_id();
			File folder=new File(downPath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			// 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.
			response.setContentType("application/octet-stream");
			
			response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName3,"UTF-8") + "\";");
			
			// 서버 실제 경로의 파일을 구함
			String pathAndName=ao.getOff_file3();
			File off_file3=new File(pathAndName);			
			
			/* 읽어와야 할 용량은 최대 업로드 용량을 초과하지 않는다. */
			byte[] b = new byte[50*1024*1024];
			
			FileInputStream in=new FileInputStream(off_file3);
			BufferedInputStream bis=new BufferedInputStream(in);
			
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			
			if (off_file3.isFile() && off_file3.length() > 0){ 
				int read=0;
				
				while((read=bis.read(b)) != -1) {
					bos.write(b , 0 , read);
				}
				bos.flush();
				bos.close();
				bis.close();
			}
			ModelAndView mv=new ModelAndView("jsp/admin_offer_info");
			mv.addObject(off_file3);
		}
		
		return null;
	}
}
