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

import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.AdminService;

@Controller
public class AdminArticleController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin_article")
	public ModelAndView admin_article(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"$('.wrap-loading').hide();" +
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		icon: 'error',\r\n" + 
					"		showCancelButton : true,\r\n" + 
					"		confirmButtonText : '로그인',\r\n" + 
					"		cancelButtonText : '메인으로'\r\n" + 
					"		}).then((result) => {\r\n" + 
					"			if(result.value){\r\n" + 
					"				location='/jamong.com/login/1';\r\n" + 
					"			}else if(result.dismiss === Swal.DismissReason.cancel) {\r\n" + 
					"				location='/jamong.com/';\r\n" + 
					"			}\r\n" + 
					"		});\r\n" + 
					"</script>\r\n" + 
					"</body>");
		}else {
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
				BoardVO b=new BoardVO();
				
				int page=1;
				int limit=10; // 한 페이지에 보여지는 목록 개수
				if(request.getParameter("page") != null) { // get 방식으로 전달된 쪽번호가 있는 경우
					page=Integer.parseInt(request.getParameter("page")); // 전달된 쪽번호를 정수 숫자로 바꾼다.
				}
				
				String find_name=request.getParameter("find_name");
				String find_field=request.getParameter("find_field");
				String find_field2=request.getParameter("find_field2");
				String find_field3=request.getParameter("find_field3");
				
				b.setFind_name("%"+find_name+"%");
				b.setFind_field(find_field);
				b.setFind_field2(find_field2);
				b.setFind_field3(find_field3);
				int bcount=this.adminService.articleCount(b);
				
				b.setStartrow((page-1)*10+1);
				b.setEndrow(b.getStartrow()+limit-1);
				
				List<BoardVO> blist=this.adminService.articleList(b);
				
				// 총 페이지
				int maxpage=(int)((double)bcount/limit+0.95);
				// 시작페이지
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				// 마지막 페이지
				int endpage=maxpage;
				if(endpage > startpage+10-1) endpage=startpage+10-1;
				
				ModelAndView mv=new ModelAndView("jsp/admin_article");
				
				mv.addObject("b",b);
				mv.addObject("blist",blist);
				mv.addObject("bcount",bcount);
				
				mv.addObject("page",page);
				mv.addObject("startpage",startpage);
				mv.addObject("endpage",endpage);
				mv.addObject("maxpage",maxpage);
				
				mv.addObject("find_name",find_name);
				mv.addObject("find_field",find_field);
				mv.addObject("find_field2",find_field2);
				mv.addObject("find_field3",find_field3);
				
				return mv;
			}
		}
		return null;
	}
}
