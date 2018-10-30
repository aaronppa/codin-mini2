package kr.co.codin.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@RequestMapping("list.do")
	public void test(Model model) throws Exception{
		model.addAttribute("board");
	}
}
