package com.jamong.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jamong.domain.MemberVO;
import com.jamong.service.MemberService;

import pwdconv.PwdChange;

@Controller
public class MemberModifyController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("pass_modify_ok")
	public ModelAndView pass_login_ok(@ModelAttribute MemberVO m, 
			String pass_modify_id, String pass_modify_pass,
			HttpServletResponse response, HttpSession session, 
			HttpServletRequest request) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		PrintWriter out = response.getWriter();
		ModelAndView view = new ModelAndView();
		MemberVO session_m = (MemberVO) session.getAttribute("m");

		/* 세션 유효성 검증 */
		if (session_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login';");
			out.println("</script>");
		} else {

			MemberVO ck = this.memberService.pwdcheck(pass_modify_id);
			//아이디를 기준으로 sql문에서 아이디를 조회해서 맞으면 그 아이디에 맞는 회원정보를 가져온 것을 담은 것이 ck
			if (ck != null) {// 비어 있지 않을때
				if (ck.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(pass_modify_pass))) {

					m.setMem_name(ck.getMem_name());
					//회원정보를 getMem_name으로 빼서 m 객체에 담는다
					m.setMem_birth1(ck.getMem_birth1());
					m.setMem_birth2(ck.getMem_birth2());
					m.setMem_birth3(ck.getMem_birth3());
					m.setMem_gender(ck.getMem_gender());
					m.setEmail_id(ck.getEmail_id());
					m.setEmail_domain(ck.getEmail_domain());
					m.setMem_phone01(ck.getMem_phone01());
					m.setMem_phone02(ck.getMem_phone02());
					m.setMem_phone03(ck.getMem_phone03());
					m.setMem_fav1(ck.getMem_fav1());
					m.setMem_fav2(ck.getMem_fav2());
					m.setMem_fav3(ck.getMem_fav3());

					view.addObject("mv", m);
					//m객체를 mv에 담고 view에 담는다
					//view를 리턴하면 jsp에서 view에 담긴 값들을 사용할수 있다
					view.setViewName("jsp/member_modify");
					return view;
				}
			} else {
				out.println("<script>");
				out.println("alert('회원정보를 찾을 수 없습니다!');");
				out.println("</script>");
				view.setViewName("jsp/pass_modify");
			}
		}
		return view;
	}// pass_login_ok

	
	/*//회원번호값은 session에 담겨있다.
	@RequestMapping("member_modify_ok")
	public ModelAndView member_modify_ok(@ModelAttribute MemberVO vo,
			HttpSession session,HttpServletResponse response,
			HttpServletRequest request) throws Exception  {
		response.setContentType("text/html;charset=UTF-8");
		session = request.getSession();
		PrintWriter out = response.getWriter();
		int no = (int) session.getAttribute("no");
		ModelAndView view = new ModelAndView();

		 세션 유효성 검증 
		if (session_m == null) {
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다. 다시 로그인하세요.');");
			out.println("location='login';");
			out.println("</script>");
		} else {
			
			MemberVO up = this.memberService.memberUpdate(session_m);
			
			
		
		
		}
		return null;
	}//member_modify_ok()
*/	
}//MemberModifyController


















