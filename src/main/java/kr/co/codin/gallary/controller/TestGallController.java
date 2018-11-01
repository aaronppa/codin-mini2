package kr.co.codin.gallary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codin.test.service.TestService;

@Controller
@RequestMapping("testGall")
public class TestGallController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("login1.do")
	public String login1(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login1());
		return "redirect:/gallary/list.do";
	}
	
	@RequestMapping("login2.do")
	public String login2(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login2());
		return "redirect:/gallary/list.do";
	}
	
	@RequestMapping("login3.do")
	public String login3(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login3());
		return "redirect:/gallarytest.jsp";
	}
	
	@RequestMapping("login4.do")
	public String login4(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login4());
		return "redirect:/gallarytest.jsp";
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/gallarytest.jsp";
	}
}
