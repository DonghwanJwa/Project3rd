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
	
	@RequestMapping("book_info")
	public ModelAndView user_book_info() { // 책 정보
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/book_info");
		
		return mv;
	}
	
	@RequestMapping("new_book")
	public ModelAndView user_new_book() { // 최신 책
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/new_book");
		
		return mv;
	}
	
	@RequestMapping("book_create")
	public ModelAndView user_book_create(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception { // 책 생성
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		
		MemberVO m=(MemberVO)session.getAttribute("m");
		String mem_id=m.getMem_id();
		
		List<BoardVO> bList = this.bookService.getBList(mem_id);
		MemberVO member = this.bookService.getMember(mem_id);
		String mem_nickname=member.getMem_nickname();
		String profile_photo=member.getProfile_photo();
		String profile_cont=member.getProfile_cont();
		
		//메서드 전달인자가 세션에 있는 아이디 값이나, 맴버 번호 값을 가져와서 리스트 검색
		for(int i=0;i<bList.size();i++) {
			String bl=bList.get(i).getBo_cont();
			String bookList=bl.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bList.get(i).setBo_cont(bookList);
		}
		ModelAndView mv=new ModelAndView();
		mv.addObject("mem_nickname",mem_nickname);
		mv.addObject("profile_photo",profile_photo);
		mv.addObject("profile_cont",profile_cont);
		mv.addObject("bookList",bList);
		mv.setViewName("jsp/book_create");
		
		return mv;
	}

	@RequestMapping("book_create_ok")
	@ResponseBody
	public String book_create_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			BookVO b) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		String saveFolder = request.getRealPath("/resources/upload");
		int fileSize = 100 * 1024 * 1024;//파일 최대 크기
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
		
		UUID uuid = UUID.randomUUID();
		
		// MultipartRequest로부터 각 파라미터 값 저장
		String book_name = multi.getParameter("book_name");
		String book_preface = multi.getParameter("book_preface");
		
		MemberVO m = (MemberVO) session.getAttribute("m");
		int mem_no = m.getMem_no();
		
		File UpFile1 = multi.getFile("book_cover");
		if(UpFile1 != null) {
			String fileName = UpFile1.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder + "\\" + "book_cover" + "\\" + year + "-" + month + "-" + date;
			String DBdir = "/jamong.com/resource/upload/book_cover/" + year + "-" + month + "-" + date;
			File path1 = new File(homedir);
			if(!(path1.exists())) {
				path1.mkdirs();// 폴더 생성
			}// 해당 폴더가 없을 때
			
			int index = fileName.lastIndexOf(".");
			String fileExtendsion= fileName.substring(index + 1);//확장자
			
			String refileName = uuid.toString() + year + month + date;//파일 업로드 날짜
			// 업로드 파일명 + 년월일 + 난수 + 확장자;
			String encryptionName = PwdChange.getPassWordToXEMD5String(refileName);
			String fileDBName = DBdir + "/" + encryptionName + "." + fileExtendsion;
			
			UpFile1.renameTo(new File(homedir + "/" + encryptionName + "." + fileExtendsion));
			
			b.setBook_cover(fileDBName);
		}// 파일이 있을 때
		
		b.setBook_name(book_name);
		b.setBook_preface(book_preface);
		b.setMem_no(mem_no);

		String[] val = multi.getParameterValues("book_create");// 스트링 배열로 선택 된 book_create의 value 값인 bo_no를 가져옴
		
		HashMap<String, Object> bm = new HashMap<>();
		bm.put("b", b);
		bm.put("bo_no", val);
		
		this.bookService.createBook(bm);
		
		
		out.println("<script>");
		out.println("alert('글이 등록되었습니다!')");
		out.println("location='/jamong.com/';");
		out.println("</script>");
		
		return null;
	}

	@RequestMapping("book_edit")
	public ModelAndView user_book_edit() { // 책 수정
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsp/book_edit");
		
		return mv;
	}
}
