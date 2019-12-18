package com.jamong.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;
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
import com.jamong.domain.MemberVO;
import com.jamong.service.BoardService;
import com.jamong.service.CategoryService;
import com.jamong.service.MemberService;
import com.oreilly.servlet.MultipartRequest;

import pwdconv.PwdChange;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CategoryService catService;

	@RequestMapping("@{mem_id}/{bo_no}")
	public String user_readCont(@PathVariable String mem_id, @PathVariable int bo_no, BoardVO bo, Model model,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session=request.getSession();
		
		MemberVO readM = (MemberVO)session.getAttribute("m");
		
		bo = this.boardService.getUserBoardCont(bo_no);
		List<BoardVO> catList = this.boardService.getUserBoardCatArticle(bo.getCat_name());
		List<BoardVO> bList = this.boardService.getUserBoardContList(bo.getMem_no());
		
		// 날짜 출력타입 변경
		SimpleDateFormat org_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat title_format = new SimpleDateFormat("MMM d, yyyy",new Locale("en","US"));		
		Date format_date = org_format.parse(bo.getBo_date());
		String title_date = title_format.format(format_date);
		
		for(int i=0;i<bList.size();i++) {
			Date bListFormat_date = org_format.parse(bList.get(i).getBo_date());
			String bListTitle_date = title_format.format(bListFormat_date);
			bList.get(i).setBo_date(bListTitle_date);
		}
		bo.setBo_date(title_date);

		model.addAttribute("catList",catList);
		model.addAttribute("bList",bList);
		model.addAttribute("bo", bo);
		model.addAttribute("mem_id", mem_id);
		
		return "jsp/read";
	}

	@RequestMapping("write")
	public ModelAndView user_write(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		ModelAndView mv = new ModelAndView();

		MemberVO m = (MemberVO) session.getAttribute("m");

		if (m == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다!');");
			out.println("location='login';");
			out.println("</script>");
		} else {
			mv.setViewName("jsp/jamong_write");
			return mv;
		} // if else => 로그인 전 / 후

		return null;
	}

	@RequestMapping("write_ok")
	public String user_write_ok(BoardVO b, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		String saveFolder = request.getRealPath("/resources/upload");
		int fileSize = 100 * 1024 * 1024; // 첨부파일 최대크기
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

		UUID uuid = UUID.randomUUID(); // 랜덤한 이름값 생성

		// MultipartRequest로부터 각 파라미터값 저장
		String bo_title = multi.getParameter("bo_title");
		String bo_subtitle = multi.getParameter("bo_subtitle");
		String bo_cont = multi.getParameter("bo_cont");
		String bo_color = multi.getParameter("bo_color");
		int bo_lock = Integer.parseInt(multi.getParameter("bo_lock"));
		int bo_type = Integer.parseInt(multi.getParameter("bo_type"));
		int bo_titlespace=Integer.parseInt(multi.getParameter("bo_titlespace"));
		String cat_name = multi.getParameter("cat_name");

		MemberVO m = (MemberVO) session.getAttribute("m");
		int mem_no = m.getMem_no();

		File UpFile1 = multi.getFile("bo_thumbnail");
		if (UpFile1 != null) {
			String fileName = UpFile1.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);

			String homedir = saveFolder + "\\" + "thumbnail" + "\\" + year + "-" + month + "-" + date;
			String DBdir = "/jamong.com/resources/upload/thumbnail/" + year + "-" + month + "-" + date;
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdirs(); // 폴더 생성
			} // if => 해당 폴더가 없을때

			Random r = new Random();
			int index = fileName.lastIndexOf(".");
			String fileExtendsion = fileName.substring(index + 1);

			String refileName = uuid.toString() + year + month + date;
			// 업로드파일명 + 년월일 + 난수 + 확장자
			String encryptionName = PwdChange.getPassWordToXEMD5String(refileName);
			String fileDBName = DBdir + "/" + encryptionName + "." + fileExtendsion;

			UpFile1.renameTo(new File(homedir + "/" + encryptionName + "." + fileExtendsion));

			b.setBo_thumbnail(fileDBName);
		} // if => 파일이 있을 때

		b.setBo_title(bo_title);
		b.setBo_subtitle(bo_subtitle);
		b.setBo_cont(bo_cont);
		b.setBo_color(bo_color);
		b.setBo_titlespace(bo_titlespace);
		b.setBo_lock(bo_lock);
		b.setBo_type(bo_type);
		b.setCat_name(cat_name);
		b.setMem_no(mem_no);

		this.boardService.insertBoard(b);

		out.println("<script>");
		out.println("alert('글이 등록되었습니다!')");
		out.println("location='/jamong.com/';");
		out.println("</script>");

		return null;
	}// user_write_ok() => 유저 글 등록

	@PostMapping("imageUpload")
	@ResponseBody
	public void ImageUpload(HttpServletResponse response, HttpServletRequest request) throws Exception {

		PrintWriter out = response.getWriter();
		String saveFolder = request.getRealPath("/resources/upload");
		int fileSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

		UUID uuid = UUID.randomUUID();

		File UpFile = multi.getFile("file");
		if (UpFile != null) {
			String fileName = UpFile.getName();
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH) + 1;
			int date = c.get(Calendar.DATE);

			String homedir = saveFolder + "\\" + "user" + "\\" + year + "-" + month + "-" + date;

			File path = new File(homedir);
			if (!(path.exists())) {
				path.mkdirs();
			} // if => 폴더 경로 생성

			int index = fileName.lastIndexOf(".");
			String fileExtendsion = fileName.substring(index + 1);

			String refileName = uuid.toString() + year + month + date;
			String encryptionName = PwdChange.getPassWordToXEMD5String(refileName);
			String fileUpName = "/jamong.com/resources/upload/user/" + year + "-" + month + "-" + date + "/"
					+ encryptionName + "." + fileExtendsion;

			UpFile.renameTo(new File(homedir + "/" + encryptionName + "." + fileExtendsion));

			out.println(fileUpName);
		}
	}// imageUp() => 썸머노트 이미지 업로드 이름변경

	@RequestMapping("new_posts")
	public ModelAndView user_new_posts(BoardVO b) {
		List<BoardVO> bList = this.boardService.getListAll(b);
		for (int i = 0; i < bList.size(); i++) {
			String htmlText = bList.get(i).getBo_cont();
			String normalText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bList.get(i).setBo_cont(normalText);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("bList", bList);
		mv.setViewName("jsp/new_posts");
		return mv;
	}

	@PostMapping("infinitiScrollDown")
	@ResponseBody
	public List<BoardVO> infinitiScrollDownPOST(String bo_no) {
		int bo_noToStart = Integer.parseInt(bo_no) - 1;
		List<BoardVO> data = this.boardService.infinitiScrollDown(bo_noToStart);
		for (int i = 0; i < data.size(); i++) {
			String htmlText = data.get(i).getBo_cont();
			String normalText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			data.get(i).setBo_cont(normalText);
		}
		return data;
	}

	@RequestMapping("search")
	public ModelAndView user_search(BoardVO b) {
		List<BoardVO> bList = this.boardService.getListAll(b);
		for (int i = 0; i < bList.size(); i++) {
			String htmlText = bList.get(i).getBo_cont();
			String normalText = htmlText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
			bList.get(i).setBo_cont(normalText);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("bList", bList);
		mv.setViewName("jsp/search_result");

		return mv;
	}
}
