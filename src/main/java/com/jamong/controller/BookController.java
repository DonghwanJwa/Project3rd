package com.jamong.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;
import com.jamong.service.BookService;
import com.oreilly.servlet.MultipartRequest;

import pwdconv.PwdChange;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	@RequestMapping("new_book")
	public ModelAndView user_new_book(BookVO b) { // 최신 책
		List<BoardVO> BookList = this.bookService.selectBookList(b);
		List<BoardVO> bkList = this.bookService.bookBannerList();
		// 책 제목 특수 태그 삭제
		for(int i = 0; i < BookList.size(); i++) {
			String book_title = BookList.get(i).getBookVO().getBook_name();
			String book_titleRe = book_title.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			BookList.get(i).getBookVO().setBook_name(book_titleRe);
		}
		for(int j = 0; j < bkList.size(); j++) {
			String book_name = bkList.get(j).getBookVO().getBook_name();
			String book_nameRe = book_name.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bkList.get(j).getBookVO().setBook_name(book_nameRe);
			String book_cont = bkList.get(j).getBookVO().getBook_preface();
			String book_contRe = book_cont.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bkList.get(j).getBookVO().setBook_preface(book_contRe);
		}
		ModelAndView mv = new ModelAndView();

		mv.addObject("bkList",bkList);
		mv.addObject("bookList", BookList);
		mv.setViewName("jsp/new_book");

		return mv;
	}

	@RequestMapping("book_create")
	public ModelAndView user_book_create(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 책 생성
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		MemberVO m = (MemberVO) session.getAttribute("m");
		if (m == null) {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
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
		} else {
			int mem_author = m.getMem_author();
			if (mem_author != 1) {
				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Not Author!',\r\n" + 
						"		text : '책 집필은 작가권한이 필요합니다!',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'warning',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				history.back();\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");
			} else {
				String mem_id = m.getMem_id();

				List<BoardVO> bList = this.bookService.getBList(mem_id);
				MemberVO member = this.bookService.getMember(mem_id);
				String mem_nickname = member.getMem_nickname();
				String profile_photo = member.getProfile_photo();
				String profile_cont = member.getProfile_cont();

				// 메서드 전달인자가 세션에 있는 아이디 값이나, 맴버 번호 값을 가져와서 리스트 검색
				for (int i = 0; i < bList.size(); i++) {
					String bl = bList.get(i).getBo_title();
					String bookList = bl.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
					bList.get(i).setBo_title(bookList);
				}
				ModelAndView mv = new ModelAndView();
				mv.addObject("mem_nickname", mem_nickname);
				mv.addObject("profile_photo", profile_photo);
				mv.addObject("profile_cont", profile_cont);
				mv.addObject("bookList", bList);
				mv.setViewName("jsp/book_create");

				return mv;
			}
		}
		return null;
	}

	@RequestMapping("book_create_ok")
	@ResponseBody
	public String book_create_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			BookVO b) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String saveFolder = request.getRealPath("/resources/upload");
		int fileSize = 100 * 1024 * 1024;// 파일 최대 크기
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

		UUID uuid = UUID.randomUUID();

		// MultipartRequest로부터 각 파라미터 값 저장
		String book_name = multi.getParameter("book_name");
		String book_preface = multi.getParameter("book_preface");
		String cat_name = multi.getParameter("cat_name");

		MemberVO m = (MemberVO) session.getAttribute("m");
		int mem_no = m.getMem_no();
		String mem_id = m.getMem_id();

		File UpFile1 = multi.getFile("book_cover");
		if (UpFile1 != null) {
			String fileName = UpFile1.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);

			String homedir = saveFolder + "\\" + "book_cover" + "\\" + year + "-" + month + "-" + date;
			String DBdir = "/jamong.com/resources/upload/book_cover/" + year + "-" + month + "-" + date;
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdirs();// 폴더 생성
			} // 해당 폴더가 없을 때

			int index = fileName.lastIndexOf(".");
			String fileExtendsion = fileName.substring(index + 1);// 확장자

			String refileName = uuid.toString() + year + month + date;// 파일 업로드 날짜
			// 업로드 파일명 + 년월일 + 난수 + 확장자;
			String encryptionName = PwdChange.getPassWordToXEMD5String(refileName);
			String fileDBName = DBdir + "/" + encryptionName + "." + fileExtendsion;

			UpFile1.renameTo(new File(homedir + "/" + encryptionName + "." + fileExtendsion));

			b.setBook_cover(fileDBName);
		} // 파일이 있을 때

		b.setBook_name(book_name);
		b.setBook_preface(book_preface);
		b.setCat_name(cat_name);
		b.setMem_no(mem_no);

		String[] val = multi.getParameterValues("book_create");// 스트링 배열로 선택 된 book_create의 value 값인 bo_no를 가져옴

		HashMap<String, Object> bm = new HashMap<>();
		bm.put("b", b);
		bm.put("bo_no", val);
		bm.put("mem_no", mem_no);
		bm.put("mem_id", mem_id);

		this.bookService.createBook(bm);

		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
				"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
				"<body>\r\n" + 
				"<script>\r\n" + 
				"Swal.fire({\r\n" + 
				"		title : 'Success!',\r\n" + 
				"		text : '책이 출간되었습니다!',\r\n" + 
				"		allowOutsideClick: false,\r\n" +
				"		icon: 'success',\r\n" + 
				"		}).then((result) => {\r\n" + 
				"			if(result.value){\r\n" + 
				"				location='/jamong.com/@"+mem_id+"';\r\n" + 
				"			}\r\n" + 
				"		});\r\n" + 
				"</script>\r\n" + 
				"</body>");

		return null;
	}

	@RequestMapping("book/del/{mem_id}/{book_no}")
	public String user_book_del(@PathVariable String mem_id,@PathVariable int book_no, 
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("m");

		if(m!=null) {
		int mem_state = m.getMem_state();
			if (mem_state == 9) {
				this.bookService.bookDel(book_no);

				out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
						"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
						"<body>\r\n" + 
						"<script>\r\n" + 
						"Swal.fire({\r\n" + 
						"		title : 'Delete Book',\r\n" + 
						"		text : '책이 폐간되었습니다.',\r\n" + 
						"		allowOutsideClick: false,\r\n" +
						"		icon: 'info',\r\n" + 
						"		}).then((result) => {\r\n" + 
						"			if(result.value){\r\n" + 
						"				location='/jamong.com/';\r\n" + 
						"			}\r\n" + 
						"		});\r\n" + 
						"</script>\r\n" + 
						"</body>");

			} else {
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
			}
		}else {
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/jamong.com/resources/css/sweetalert2.css\" />\r\n" + 
					"<script type=\"text/javascript\" src=\"/jamong.com/resources/js/sweetalert2.min.js\"></script>\r\n" + 
					"<body>\r\n" + 
					"<script>\r\n" + 
					"Swal.fire({\r\n" + 
					"		title : 'Oops!',\r\n" + 
					"		text : '로그인이 필요합니다!',\r\n" + 
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
		}

		return null;
	}

	@PostMapping("book_inner_info")
	@ResponseBody
	public BoardVO book_inner_info(String bk_no) throws Exception {
		int book_no = Integer.parseInt(bk_no);
		BoardVO book_info = this.bookService.bookInnerInfo(book_no);

		// 책 제목 특수 태그 지우기
		String book_name = (String) book_info.getBookVO().getBook_name();
		String book_nameRe = book_name.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
		book_info.getBookVO().setBook_name(book_nameRe);

		// 책 소개 특수 태그 지우기
		String book_info_cont = (String) book_info.getBookVO().getBook_preface();
		String book_infoRe = book_info_cont.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
		book_info.getBookVO().setBook_preface(book_infoRe);

		// 글 본문 특수 태그 지우기
		String bo_cont = (String) book_info.getBo_cont();
		String bo_contRe = bo_cont.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
		book_info.setBo_cont(bo_contRe);

		return book_info;
	}

	@RequestMapping("book/@{mem_id}/{book_no}")
	public String book_readCont(@PathVariable String mem_id, @PathVariable int book_no, BoardVO b, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();

		/* 준비물 */
		// 책 커버, 책 제목, 책 소개, 책추천수, 작가 이름, 작가 프로필, 작가 소개, 책 번호에 해당하는 글 리스트(제목,내용,썸네일,작성 날짜,글쓴이
		// 아이디,글 번호)
		HashMap<String, Object> binfo = new HashMap<>();
		binfo.put("mem_id", mem_id);
		binfo.put("book_no", book_no);

		MemberVO member = this.bookService.getMember(mem_id);
		String mem_nickname = member.getMem_nickname();
		String profile_photo = member.getProfile_photo();
		String profile_cont = member.getProfile_cont();

		BookVO book = this.bookService.getBook(book_no);
		String book_name = book.getBook_name();
		String book_cover = book.getBook_cover();
		String book_preface = book.getBook_preface();
		String book_prefaceRe = book_preface.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
		int book_recommend = book.getBook_recommend();

		List<BoardVO> bkifcntlist = this.bookService.bookInfoCont(binfo);
		for (int i = 0; i < bkifcntlist.size(); i++) {
			String orgcontlist = (String) bkifcntlist.get(i).getBo_cont();
			String orgcontlistRe = orgcontlist.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bkifcntlist.get(i).setBo_cont(orgcontlistRe);
		}

		model.addAttribute("book_name", book_name);
		model.addAttribute("book_cover", book_cover);
		model.addAttribute("book_preface", book_prefaceRe);
		model.addAttribute("book_recommend", book_recommend);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("book_no", book_no);
		model.addAttribute("mem_nickname", mem_nickname);
		model.addAttribute("profile_photo", profile_photo);
		model.addAttribute("profile_cont", profile_cont);
		model.addAttribute("bkList", bkifcntlist);

		return "jsp/book_info";
	}

	@PostMapping("book/recommend_up/{book_no}")
	@ResponseBody
	public int recommned_up(@PathVariable int book_no, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("m");

		int result = -1;
		if (m != null) {
			BookVO bk = new BookVO();
			bk.setBook_no(book_no);
			bk.setMem_no(m.getMem_no());
			result = this.bookService.recommendUp(bk);
		}
		return result;
	}

	@PostMapping("book/recommend_down/{book_no}")
	@ResponseBody
	public int recommend_down(@PathVariable int book_no, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("m");

		int result = -1;
		if (m != null) {
			BookVO bk = new BookVO();
			bk.setBook_no(book_no);
			bk.setMem_no(m.getMem_no());
			result = this.bookService.recommendDown(bk);
		}
		return result;
	}
}
