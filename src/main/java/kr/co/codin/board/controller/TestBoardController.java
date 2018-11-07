package kr.co.codin.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.codin.test.service.TestService;

@Controller
@RequestMapping("TestBoard")
@SessionAttributes("id")
public class TestBoardController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("login1.do")
	public String login1(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login1());
	
		//return "redirect:/boardtest.jsp";
		return "redirect:/board/listForm.do?pageNo=1";
	}
	
	@RequestMapping("login2.do")
	public String login2(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login2());
		System.out.println(session.getId());
		return "redirect:/board/listForm.do?pageNo=1";
	}
	
	@RequestMapping("login3.do")//url에서 캐시 먹어서 안되었다
	public String login3(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login3());
		System.out.println(session.getId().toString());
		return "redirect:/board/listForm.do?pageNo=1";
	}
	
	@RequestMapping("login4.do")
	public String login4(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("user", service.login4());
		System.out.println(session.getId().toString());
		return "redirect:/board/listForm.do?pageNo=1";
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println(session.getId().toString());
		return "redirect:/board/listForm.do?pageNo=1";
	}
}
