package kr.co.codin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/signupForm.do")
	public void signupForm() throws Exception {}
	
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
	
	@RequestMapping("/loginForm.do")
	public void loginForm() throws Exception {}
	
	@RequestMapping("/login.do")
	public String login(Member member, Model model) throws Exception {
		model.addAttribute("user", service.login(member));
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
