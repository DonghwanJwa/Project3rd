package com.jamong.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.AccuseVO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.InquireVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.NoticeVO;
import com.jamong.service.AccuseService;
import com.jamong.service.AdminService;
import com.jamong.service.BoardService;
import com.jamong.service.BookService;
import com.jamong.service.InquireService;
import com.jamong.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;	
	@Autowired
	private AccuseService accuseService;
	@Autowired
	private InquireService inquireService;
	@Autowired
	private BoardService boardService;	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BookService bookService;
	
	@RequestMapping("admin_main")
	public ModelAndView admin_main(HttpSession session, HttpServletRequest request, HttpServletResponse response, NoticeVO n,AccuseVO a,InquireVO i) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		MemberVO adm_m=(MemberVO)session.getAttribute("m");
		
		/* 세션 유효성 검증 */
		if(adm_m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<script src=\"/jamong.com/resources/js/jquery.js\"></script>\r\n"+
					"<body>\r\n" + 
					"<script>\r\n" + 
					"$('.wrap-loading').hide();\r\n" +
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '세션이 만료되었습니다!',\r\n" + 
					"		allowOutsideClick: false,\r\n" +
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
			if(adm_m.getMem_state() != 9) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Error!',\r\n" + 
						"		text : '잘못된 접근입니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'error',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			}else {
				// 최신공지 띄우기
				List<NoticeVO> newNotice=this.adminService.newNotice(n);
				List<AccuseVO> newAccuse=this.accuseService.newAccuse(a);
				List<InquireVO> newInquire=this.inquireService.newInquire(i);

					
				ModelAndView m=new ModelAndView();
				
				m.addObject("newNotice",newNotice);
				m.addObject("newAccuse",newAccuse);
				m.addObject("newInquire",newInquire);
				m.addObject("n",n);
				m.addObject("a",a);
				m.addObject("i",i);
				
				m.setViewName("jsp/admin_main");
				
				return m;
			}
		}
		return null;
	} // admin_main()
	
	/* 로그아웃 */
	@RequestMapping("admin_logout")
	public ModelAndView admin_logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		
		session.invalidate();
		
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
				"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
				"<body>\r\n" + 
				"<script>\r\n" + 
				"Swal.fire({\r\n" + 
				"		title : 'Success!',\r\n" + 
				"		text : '로그아웃 되었습니다!',\r\n" + 
				"		allowOutsideClick: false,\r\n" +
				"		icon: 'success',\r\n" + 
				"		}).then((result) => {\r\n" + 
				"			if(result.value){\r\n" + 
				"				location='/jamong.com/';\r\n" + 
				"			}\r\n" + 
				"		});\r\n" + 
				"</script>\r\n" + 
				"</body>");
		
		return null;
	}
	
	@RequestMapping("statistics")
	public ModelAndView statisticsChart() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("jsp/statistics");
		return mv;
	}
	
	@RequestMapping("AgeGroupData")
	public ResponseEntity<JSONObject> ageGroup_List(){
		ResponseEntity<JSONObject> entity = null;
		List<MemberVO> items = this.memberService.chartAgeGroup();
		JSONObject jobj = new JSONObject();
		
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		JSONArray title = new JSONArray();
		cols1.put("lable","연령");
		cols1.put("type","string");
		cols2.put("label","분포도");
		cols2.put("type","number");
		
		title.add(cols1);
		title.add(cols2);
		
		jobj.put("cols",title);
		
		JSONArray body = new JSONArray();
		for(MemberVO vo : items) {
			JSONObject age = new JSONObject();
			age.put("v",vo.getAge_group()+"대");
			JSONObject count = new JSONObject();
			count.put("v",vo.getCount());
			
			JSONArray rows = new JSONArray();
			rows.add(age);
			rows.add(count);
			
			JSONObject c = new JSONObject();
			c.put("c",rows);
			
			body.add(c);
		}
		jobj.put("rows",body);
		try {
			entity = new ResponseEntity<JSONObject>(jobj, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping("GenderData")
	public ResponseEntity<JSONObject> genderData_List(){
		ResponseEntity<JSONObject> entity = null;
		List<MemberVO> items = this.memberService.chartGenderData();
		JSONObject jobj = new JSONObject();
		
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		JSONArray title = new JSONArray();
		cols1.put("lable","성별");
		cols1.put("type","string");
		cols2.put("label","인원수");
		cols2.put("type","number");
		
		title.add(cols1);
		title.add(cols2);
		
		jobj.put("cols",title);
		
		JSONArray body = new JSONArray();
		for(MemberVO vo : items) {
			JSONObject gender = new JSONObject();
			gender.put("v",vo.getMem_gender());
			JSONObject count = new JSONObject();
			count.put("v",vo.getCount());
			
			JSONArray rows = new JSONArray();
			rows.add(gender);
			rows.add(count);
			
			JSONObject c = new JSONObject();
			c.put("c",rows);
			
			body.add(c);
		}
		jobj.put("rows",body);
		try {
			entity = new ResponseEntity<JSONObject>(jobj, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping("ArticleData")
	public ResponseEntity<JSONObject> articleData_List(){
		ResponseEntity<JSONObject> entity = null;
		List<BoardVO> items = this.boardService.chartArticleState();
		JSONObject jobj = new JSONObject();
		
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		JSONArray title = new JSONArray();
		cols1.put("lable","게시글 타입");
		cols1.put("type","string");
		cols2.put("label","타입별 수");
		cols2.put("type","number");
		
		title.add(cols1);
		title.add(cols2);
		
		jobj.put("cols",title);
		
		JSONArray body = new JSONArray();
		for(BoardVO vo : items) {
			JSONObject type = new JSONObject();
			if(vo.getBo_lock() == 1) {
				type.put("v","공개글");				
			}else {
				type.put("v","비공개글");
			}
			JSONObject count = new JSONObject();
			count.put("v",vo.getCount());
			
			JSONArray rows = new JSONArray();
			rows.add(type);
			rows.add(count);
			
			JSONObject c = new JSONObject();
			c.put("c",rows);
			
			body.add(c);
		}
		jobj.put("rows",body);
		try {
			entity = new ResponseEntity<JSONObject>(jobj, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping("ArticleCategory")
	public ResponseEntity<JSONObject> articleCategory_List(){
		ResponseEntity<JSONObject> entity = null;
		List<BoardVO> items = this.boardService.chartArticleCategory();
		
		
		JSONObject jobj = new JSONObject();
		
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		JSONObject cols3 = new JSONObject();
		JSONArray title = new JSONArray();
		cols1.put("lable","게시글 분류");
		cols1.put("type","string");
		cols2.put("label","분류별 게시글 수");
		cols2.put("type","number");
		title.add(cols1);
		title.add(cols2);
		
		jobj.put("cols",title);
		
		JSONArray body = new JSONArray();
		for(BoardVO vo : items) {
			
			JSONObject category = new JSONObject();
			category.put("v",vo.getCat_name());
			JSONObject count = new JSONObject();
			count.put("v",vo.getCount());
			
			JSONArray rows = new JSONArray();
			rows.add(category);
			rows.add(count);
			
			JSONObject c = new JSONObject();
			c.put("c",rows);
			
			body.add(c);
		}
		jobj.put("rows",body);
		try {
			entity = new ResponseEntity<JSONObject>(jobj, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping("ArticleCount")
	public ResponseEntity<JSONObject> articleCount_List(){
		ResponseEntity<JSONObject> entity = null;
		List<BoardVO> items = this.boardService.chartArticleCount();
		List<BookVO> books = this.bookService.chartBookCount();
		
		
		JSONObject jobj = new JSONObject();
		
		JSONObject cols1 = new JSONObject();
		JSONObject cols2 = new JSONObject();
		JSONObject cols3 = new JSONObject();
		JSONArray title = new JSONArray();
		cols1.put("lable","일별 게시글/책 작성수");
		cols1.put("type","string");
		cols2.put("label","게시글 수");
		cols2.put("type","number");
		cols3.put("label","책 수");
		cols3.put("type","number");
		title.add(cols1);
		title.add(cols2);
		title.add(cols3);
		
		jobj.put("cols",title);
		
		JSONArray body = new JSONArray();
		for(int i=0;i<items.size();i++) {
			BoardVO bvo = items.get(i);
			BookVO bovo = books.get(i);
			JSONObject date = new JSONObject();
			date.put("v",bvo.getBo_date().substring(0,11));
			JSONObject acount = new JSONObject();
			acount.put("v",bvo.getCount());
			JSONObject bcount = new JSONObject();
			bcount.put("v",bovo.getCount());
			
			JSONArray rows = new JSONArray();
			rows.add(date);
			rows.add(acount);
			rows.add(bcount);
			
			JSONObject c = new JSONObject();
			c.put("c",rows);
			
			body.add(c);
		}
		jobj.put("rows",body);
		try {
			entity = new ResponseEntity<JSONObject>(jobj, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
}
