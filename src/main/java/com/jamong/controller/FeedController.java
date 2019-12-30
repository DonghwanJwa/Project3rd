package com.jamong.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.FeedVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.RecommendVO;
import com.jamong.domain.SympathyVO;
import com.jamong.service.FeedService;
import com.jamong.service.RecommendService;
import com.jamong.service.SympathyService;

import timeChanger.TIME_MAXIMUM;

@Controller
public class FeedController {

	@Autowired
	private FeedService feedService;
	@Autowired
	private SympathyService symService;
	@Autowired
	private RecommendService recService;

	@RequestMapping("feed")
	public ModelAndView user_Feed(
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html;charset=	UTF-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();

		MemberVO feedM = (MemberVO)session.getAttribute("m");

		if(feedM == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 페이지입니다!');");
			out.println("location='login/1';");
			out.println("</script>");
		}else {
			List<FeedVO> fList = this.feedService.getUserFeedList(feedM.getMem_no());
			List<SympathyVO> aList = this.symService.getUserScrapArticle(feedM.getMem_no());
			List<RecommendVO> bList = this.recService.getUserScrapBook(feedM.getMem_no());

			SimpleDateFormat org_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat title_format = new SimpleDateFormat("MMM d, yyyy",new Locale("en","US"));		

			// 날짜 출력방식 변경
			for(int i=0;i<aList.size();i++) {
				Date format_date = org_format.parse(aList.get(i).getSym_date());
				String title_date = title_format.format(format_date);
				aList.get(i).setSym_date(title_date);
			}
			for(int i=0;i<bList.size();i++) {
				Date format_date = org_format.parse(bList.get(i).getRec_date());
				String title_date = title_format.format(format_date);
				bList.get(i).setRec_date(title_date);
			}
			
			for(int i=0;i<fList.size();i++) {
				Date repListFormat_date = org_format.parse(fList.get(i).getFeed_date());
				String repList_date = TIME_MAXIMUM.formatTimeString(repListFormat_date);
				fList.get(i).setFeed_date(repList_date);
			}

			mv.addObject("fList",fList);
			mv.addObject("aList",aList);
			mv.addObject("bList",bList);
			mv.setViewName("jsp/feed");
			return mv;
		}
		return null;
	}

	@PostMapping("stateUp")
	@ResponseBody
	public void feedStateUp(int feed_no) {
		this.feedService.feedStateUp(feed_no);
	}

	@PostMapping("feedCount")
	@ResponseBody
	public int feedCount(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		int count = -1;
		session = request.getSession();
		MemberVO feedM = (MemberVO)session.getAttribute("m");
		if(feedM !=null) {
			int sMem_no = feedM.getMem_no();
			count = this.feedService.feedCount(sMem_no);
		}
		return count;
	}
}
