package kr.co.codin.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.codin.test.service.TestService;

@Controller
@RequestMapping("testmsg")
public class TestMsgController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("login1.do")
	public String login1(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login1());
		return "redirect:/msgtest.jsp";
	}
	
	@RequestMapping("login2.do")
	public String login2(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login2());
		return "redirect:/msgtest.jsp";
	}
	
	@RequestMapping("login3.do")
	public String login3(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login3());
		return "redirect:/msgtest.jsp";
	}
	
	@RequestMapping("login4.do")
	public String login4(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login4());
		return "redirect:/msgtest.jsp";
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/msgtest.jsp";
	}
	
	@RequestMapping("maininbox.do")
	public String mainIndex(HttpServletRequest request) throws Exception {
		return "redirect:/msg/maininbox.do";
	}
	
	
}
