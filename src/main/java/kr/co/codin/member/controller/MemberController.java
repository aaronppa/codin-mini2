package kr.co.codin.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.MemberSkill;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
//	@RequestMapping("/signupForm.do")
//	public void signupForm() throws Exception {}
	
	@RequestMapping("/signup.do")
	public String signup(Member member) throws Exception {
//		System.out.println(member);
		service.signup(member);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/list.do")
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.list());
	}
	
//	@RequestMapping("/loginForm.do")
//	public void loginForm() throws Exception {}
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) throws Exception {
		if (service.login(member) != null) {
			session.setAttribute("user", service.login(member));
//			System.out.println(member.getMemberId().equals("admin"));
			if(member.getMemberId().equals("admin")) {
				return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
			}
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";			
		}
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/myPage.do")
	public void myPage(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.mypage(memberNo));
		model.addAttribute("memberSkill", service.myskill(memberNo));
	}
	
	@RequestMapping("/updateForm.do")
	public void updateForm (HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("user");
		int memberNo = member.getMemberNo();
		model.addAttribute("member", service.mypage(memberNo));
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "loginForm.do";
	}
	
	@RequestMapping("/edit.do")
	public String editProfile(Member member, MemberSkill memberSkill) {
//		System.out.println(member);
//		System.out.println(memberSkill);
		service.editProfile(member, memberSkill);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "myPage.do";
	}
}
